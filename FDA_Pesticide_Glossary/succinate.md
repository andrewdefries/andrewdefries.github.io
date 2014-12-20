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
-2.510435, 0.371936, -2.193466, 1, 0, 0, 1,
-2.393793, -0.174829, -2.614761, 1, 0.007843138, 0, 1,
-2.387328, -0.7501377, -3.50114, 1, 0.01176471, 0, 1,
-2.311947, 0.002046576, -1.433406, 1, 0.01960784, 0, 1,
-2.309236, -0.002784879, -1.677176, 1, 0.02352941, 0, 1,
-2.244253, 0.3341583, -1.426827, 1, 0.03137255, 0, 1,
-2.225769, -0.08486462, -1.975142, 1, 0.03529412, 0, 1,
-2.187765, -0.1678946, -0.5033492, 1, 0.04313726, 0, 1,
-2.15021, 1.159466, -0.6883592, 1, 0.04705882, 0, 1,
-2.136957, -0.8211025, -1.963003, 1, 0.05490196, 0, 1,
-2.125614, 0.06794795, -0.6558774, 1, 0.05882353, 0, 1,
-2.124725, 0.2803595, -1.026254, 1, 0.06666667, 0, 1,
-2.088612, 0.6635798, -0.6436067, 1, 0.07058824, 0, 1,
-2.085325, 0.7567517, -1.139422, 1, 0.07843138, 0, 1,
-2.083875, 0.5003549, -2.233796, 1, 0.08235294, 0, 1,
-2.066684, -1.309336, -1.959182, 1, 0.09019608, 0, 1,
-2.038655, -2.044744, -1.825862, 1, 0.09411765, 0, 1,
-2.026892, -0.4209521, -1.29864, 1, 0.1019608, 0, 1,
-2.014527, 0.5194718, -1.911118, 1, 0.1098039, 0, 1,
-1.970014, 0.9137775, -1.392561, 1, 0.1137255, 0, 1,
-1.965899, -0.6708649, -2.395697, 1, 0.1215686, 0, 1,
-1.945859, 0.6609668, 0.2111295, 1, 0.1254902, 0, 1,
-1.935932, -0.07694611, -1.815525, 1, 0.1333333, 0, 1,
-1.915496, 0.3507161, -0.6537759, 1, 0.1372549, 0, 1,
-1.908549, 0.6128495, -1.11766, 1, 0.145098, 0, 1,
-1.905664, 0.2535421, -1.378408, 1, 0.1490196, 0, 1,
-1.885042, -0.490348, -1.060758, 1, 0.1568628, 0, 1,
-1.881755, 0.7094036, -0.2296043, 1, 0.1607843, 0, 1,
-1.880275, -0.743356, -1.977717, 1, 0.1686275, 0, 1,
-1.840848, -1.40123, -2.436173, 1, 0.172549, 0, 1,
-1.828475, -0.3533507, -2.337899, 1, 0.1803922, 0, 1,
-1.825979, -0.3797891, -0.3997528, 1, 0.1843137, 0, 1,
-1.823318, -0.004288452, -0.8621547, 1, 0.1921569, 0, 1,
-1.820389, 0.5085822, -2.503348, 1, 0.1960784, 0, 1,
-1.81466, -0.8549426, -4.350819, 1, 0.2039216, 0, 1,
-1.809726, 0.8734069, -3.121958, 1, 0.2117647, 0, 1,
-1.783486, 0.8761564, -1.80975, 1, 0.2156863, 0, 1,
-1.779116, -0.003419181, -1.921486, 1, 0.2235294, 0, 1,
-1.778192, 0.1600197, -1.626612, 1, 0.227451, 0, 1,
-1.777181, -1.229974, -1.312248, 1, 0.2352941, 0, 1,
-1.764254, -0.4394355, -2.308921, 1, 0.2392157, 0, 1,
-1.757241, -1.864951, -0.8731402, 1, 0.2470588, 0, 1,
-1.754425, -1.182686, -4.065217, 1, 0.2509804, 0, 1,
-1.732365, -1.372978, -1.736831, 1, 0.2588235, 0, 1,
-1.730499, 0.1895046, 1.031663, 1, 0.2627451, 0, 1,
-1.714565, -0.7008194, -3.053182, 1, 0.2705882, 0, 1,
-1.710602, -0.9305118, -1.80175, 1, 0.2745098, 0, 1,
-1.67837, -0.5291749, -1.980627, 1, 0.282353, 0, 1,
-1.652745, -0.5993623, -1.619404, 1, 0.2862745, 0, 1,
-1.650607, -0.750964, -2.425997, 1, 0.2941177, 0, 1,
-1.626077, -0.6134269, -2.263455, 1, 0.3019608, 0, 1,
-1.61195, -1.066685, -3.363638, 1, 0.3058824, 0, 1,
-1.603722, -0.1367016, -2.15675, 1, 0.3137255, 0, 1,
-1.596346, 0.1651327, -2.600212, 1, 0.3176471, 0, 1,
-1.592028, -1.481117, -0.30636, 1, 0.3254902, 0, 1,
-1.58334, 1.935257, -0.9892159, 1, 0.3294118, 0, 1,
-1.5659, -0.01788113, -1.750008, 1, 0.3372549, 0, 1,
-1.557042, 1.525662, -1.707101, 1, 0.3411765, 0, 1,
-1.556003, -2.051912, -2.001186, 1, 0.3490196, 0, 1,
-1.551, -0.7570955, -1.590911, 1, 0.3529412, 0, 1,
-1.545333, -1.284041, -1.608904, 1, 0.3607843, 0, 1,
-1.541215, -0.7964633, -4.572916, 1, 0.3647059, 0, 1,
-1.541044, 1.79156, 0.2004057, 1, 0.372549, 0, 1,
-1.536633, 0.654525, -1.33826, 1, 0.3764706, 0, 1,
-1.535498, 1.22031, 0.03258713, 1, 0.3843137, 0, 1,
-1.533548, 0.9076223, -0.105601, 1, 0.3882353, 0, 1,
-1.515394, -0.7534524, -2.503855, 1, 0.3960784, 0, 1,
-1.502679, -1.863312, -4.409978, 1, 0.4039216, 0, 1,
-1.47751, 0.6270746, 0.08745536, 1, 0.4078431, 0, 1,
-1.471087, 0.9684008, -4.20211, 1, 0.4156863, 0, 1,
-1.458474, 0.910587, -0.2916147, 1, 0.4196078, 0, 1,
-1.43858, -1.962753, -0.4000557, 1, 0.427451, 0, 1,
-1.422058, 1.67692, -1.736652, 1, 0.4313726, 0, 1,
-1.413432, 1.841271, -0.6508839, 1, 0.4392157, 0, 1,
-1.402842, 2.186809, -1.978314, 1, 0.4431373, 0, 1,
-1.400789, -0.5265717, -0.8825263, 1, 0.4509804, 0, 1,
-1.400234, -0.9716497, -0.5397186, 1, 0.454902, 0, 1,
-1.399061, -1.049162, -2.139607, 1, 0.4627451, 0, 1,
-1.398014, -0.6355091, -0.6473382, 1, 0.4666667, 0, 1,
-1.393064, 1.660405, 0.3581696, 1, 0.4745098, 0, 1,
-1.392463, 1.063004, -1.892037, 1, 0.4784314, 0, 1,
-1.352839, -0.7487771, -3.161071, 1, 0.4862745, 0, 1,
-1.348878, -0.9482738, -2.82955, 1, 0.4901961, 0, 1,
-1.313023, -1.268204, -1.001474, 1, 0.4980392, 0, 1,
-1.306098, -0.3638508, -0.9117308, 1, 0.5058824, 0, 1,
-1.304276, -0.8176097, -1.73341, 1, 0.509804, 0, 1,
-1.282735, -1.421612, -3.905742, 1, 0.5176471, 0, 1,
-1.281353, -1.25134, -3.744953, 1, 0.5215687, 0, 1,
-1.275231, 0.2149671, -0.7846165, 1, 0.5294118, 0, 1,
-1.268744, 0.8013083, 0.1041868, 1, 0.5333334, 0, 1,
-1.26718, -0.2125404, -2.593635, 1, 0.5411765, 0, 1,
-1.266706, -2.032566, -3.441918, 1, 0.5450981, 0, 1,
-1.266527, -1.447529, -3.555963, 1, 0.5529412, 0, 1,
-1.265086, 0.7087703, 0.2695909, 1, 0.5568628, 0, 1,
-1.265065, -0.3973279, 0.2927879, 1, 0.5647059, 0, 1,
-1.250261, 1.137264, -0.8802066, 1, 0.5686275, 0, 1,
-1.238284, 1.83467, -1.44429, 1, 0.5764706, 0, 1,
-1.230943, 1.239609, -0.3328392, 1, 0.5803922, 0, 1,
-1.224238, -1.318751, -1.832918, 1, 0.5882353, 0, 1,
-1.214464, -0.5089871, -1.43427, 1, 0.5921569, 0, 1,
-1.209607, -1.742833, -1.433976, 1, 0.6, 0, 1,
-1.209537, -1.470144, -2.703139, 1, 0.6078432, 0, 1,
-1.203933, -0.1243996, -2.14859, 1, 0.6117647, 0, 1,
-1.202163, 0.07627378, -2.685764, 1, 0.6196079, 0, 1,
-1.199397, 1.028464, 2.639612, 1, 0.6235294, 0, 1,
-1.199214, -2.217087, -1.621585, 1, 0.6313726, 0, 1,
-1.192564, -0.2102145, -3.100709, 1, 0.6352941, 0, 1,
-1.185037, -0.7720122, -2.001994, 1, 0.6431373, 0, 1,
-1.18066, -0.2916001, -0.6281574, 1, 0.6470588, 0, 1,
-1.170631, -0.9401793, -0.3472744, 1, 0.654902, 0, 1,
-1.167732, -0.6865007, -2.008917, 1, 0.6588235, 0, 1,
-1.166052, -2.034622, -4.174706, 1, 0.6666667, 0, 1,
-1.165035, -0.1687849, -1.357884, 1, 0.6705883, 0, 1,
-1.163169, -0.5445691, -2.072527, 1, 0.6784314, 0, 1,
-1.155814, -0.2875335, -4.044603, 1, 0.682353, 0, 1,
-1.155581, -0.5931976, -1.026738, 1, 0.6901961, 0, 1,
-1.15316, -0.4599064, -2.265434, 1, 0.6941177, 0, 1,
-1.152814, 0.6756185, 0.4290949, 1, 0.7019608, 0, 1,
-1.142486, 1.468786, 0.2614788, 1, 0.7098039, 0, 1,
-1.142369, 0.03953189, -1.940992, 1, 0.7137255, 0, 1,
-1.139688, -0.03736582, -3.042452, 1, 0.7215686, 0, 1,
-1.136326, -1.247554, -1.920615, 1, 0.7254902, 0, 1,
-1.132307, -1.452846, -0.6781647, 1, 0.7333333, 0, 1,
-1.117762, -1.483129, -0.6638335, 1, 0.7372549, 0, 1,
-1.108503, 1.125168, -2.824971, 1, 0.7450981, 0, 1,
-1.108113, 0.7295541, 0.3220064, 1, 0.7490196, 0, 1,
-1.099658, -0.07206401, -2.476273, 1, 0.7568628, 0, 1,
-1.096007, 0.8440238, -2.105403, 1, 0.7607843, 0, 1,
-1.092255, 0.431641, 0.09201172, 1, 0.7686275, 0, 1,
-1.08984, -0.7943371, -2.064461, 1, 0.772549, 0, 1,
-1.089287, -0.9043564, -1.060996, 1, 0.7803922, 0, 1,
-1.089052, 0.1609416, -0.6898755, 1, 0.7843137, 0, 1,
-1.086909, -1.063448, -3.019779, 1, 0.7921569, 0, 1,
-1.07642, -0.6715981, -2.674182, 1, 0.7960784, 0, 1,
-1.074486, 1.063471, 0.435339, 1, 0.8039216, 0, 1,
-1.072114, 0.6329536, -0.1099934, 1, 0.8117647, 0, 1,
-1.068942, 1.399388, -0.6992667, 1, 0.8156863, 0, 1,
-1.065347, 1.312889, 0.2720432, 1, 0.8235294, 0, 1,
-1.057281, 0.401421, -0.4225993, 1, 0.827451, 0, 1,
-1.052758, 3.135953, -0.6634163, 1, 0.8352941, 0, 1,
-1.033063, 0.8417842, -0.8308918, 1, 0.8392157, 0, 1,
-1.029641, 0.8917078, -0.5664375, 1, 0.8470588, 0, 1,
-1.028397, -1.123199, -2.369744, 1, 0.8509804, 0, 1,
-1.027515, 1.012134, 0.02170916, 1, 0.8588235, 0, 1,
-1.019129, 0.272129, -2.375356, 1, 0.8627451, 0, 1,
-1.015054, -1.824197, -2.374716, 1, 0.8705882, 0, 1,
-1.008977, 0.5589827, -0.777056, 1, 0.8745098, 0, 1,
-1.007596, 1.391383, -0.1844077, 1, 0.8823529, 0, 1,
-1.00517, 0.9025269, -2.784131, 1, 0.8862745, 0, 1,
-1.000581, 0.9747987, -0.3313564, 1, 0.8941177, 0, 1,
-0.9890601, -1.476733, -2.656359, 1, 0.8980392, 0, 1,
-0.9824907, 0.07182349, -2.07998, 1, 0.9058824, 0, 1,
-0.9824536, 0.07597327, -2.288671, 1, 0.9137255, 0, 1,
-0.9796196, -1.254025, -2.224465, 1, 0.9176471, 0, 1,
-0.9748743, -2.279958, -4.508082, 1, 0.9254902, 0, 1,
-0.9736445, 0.5334433, -0.6703319, 1, 0.9294118, 0, 1,
-0.9721605, -1.115633, -2.352407, 1, 0.9372549, 0, 1,
-0.9671746, -1.166206, -1.423305, 1, 0.9411765, 0, 1,
-0.9660475, -2.804502, -1.343722, 1, 0.9490196, 0, 1,
-0.9654748, -0.07076748, -3.68128, 1, 0.9529412, 0, 1,
-0.9616271, 2.710277, -0.09905393, 1, 0.9607843, 0, 1,
-0.9607517, 0.5388559, 0.7731837, 1, 0.9647059, 0, 1,
-0.9588662, 0.2961237, -0.7482337, 1, 0.972549, 0, 1,
-0.9572486, -0.2830532, -1.905338, 1, 0.9764706, 0, 1,
-0.9552257, 0.01809839, -1.288999, 1, 0.9843137, 0, 1,
-0.94946, 1.787508, 0.6652492, 1, 0.9882353, 0, 1,
-0.9475524, -0.4034587, -0.6585308, 1, 0.9960784, 0, 1,
-0.9441009, 0.9283866, -0.9757142, 0.9960784, 1, 0, 1,
-0.9439365, -0.2910301, -0.9937955, 0.9921569, 1, 0, 1,
-0.9284523, -1.719614, -1.377603, 0.9843137, 1, 0, 1,
-0.9279095, -0.3851362, -3.059987, 0.9803922, 1, 0, 1,
-0.9260983, 0.6960083, 0.1309685, 0.972549, 1, 0, 1,
-0.9256693, 0.5217878, -0.4323031, 0.9686275, 1, 0, 1,
-0.9233895, 0.5047053, -0.3845567, 0.9607843, 1, 0, 1,
-0.9180751, 0.08193301, -0.7133864, 0.9568627, 1, 0, 1,
-0.9153736, 0.3764531, -0.7527791, 0.9490196, 1, 0, 1,
-0.9135241, -1.002964, -2.952446, 0.945098, 1, 0, 1,
-0.9080271, 0.3519967, -0.2465951, 0.9372549, 1, 0, 1,
-0.9014608, 0.206805, -0.9023329, 0.9333333, 1, 0, 1,
-0.900651, 0.06882221, -1.825231, 0.9254902, 1, 0, 1,
-0.8949906, -0.05060294, -3.216218, 0.9215686, 1, 0, 1,
-0.8833653, -0.8846706, -1.717112, 0.9137255, 1, 0, 1,
-0.8814244, -0.9403958, -1.610717, 0.9098039, 1, 0, 1,
-0.8813354, -1.529653, -2.365531, 0.9019608, 1, 0, 1,
-0.8776407, 0.5849642, -1.202443, 0.8941177, 1, 0, 1,
-0.8755149, -0.6478921, -2.310576, 0.8901961, 1, 0, 1,
-0.8754686, -1.046423, -0.6946213, 0.8823529, 1, 0, 1,
-0.8753464, 1.128741, -0.8876329, 0.8784314, 1, 0, 1,
-0.8718854, -0.2520443, -2.223171, 0.8705882, 1, 0, 1,
-0.8705787, 0.580818, -0.2004009, 0.8666667, 1, 0, 1,
-0.8662312, -0.4279979, -1.864117, 0.8588235, 1, 0, 1,
-0.8660957, -1.939649, -3.241274, 0.854902, 1, 0, 1,
-0.8658739, -0.3406131, -3.163643, 0.8470588, 1, 0, 1,
-0.8588777, -0.2258983, -2.232667, 0.8431373, 1, 0, 1,
-0.84956, -0.09950433, -1.190909, 0.8352941, 1, 0, 1,
-0.8487539, -0.1201819, -1.505274, 0.8313726, 1, 0, 1,
-0.8448749, -0.1362806, -2.644891, 0.8235294, 1, 0, 1,
-0.8405778, 0.5294119, -1.202342, 0.8196079, 1, 0, 1,
-0.8385696, 0.01318963, -1.582863, 0.8117647, 1, 0, 1,
-0.8370794, 0.6592566, -0.362206, 0.8078431, 1, 0, 1,
-0.8349287, -0.07986964, -1.927227, 0.8, 1, 0, 1,
-0.8327175, 2.361075, -0.04768174, 0.7921569, 1, 0, 1,
-0.8261563, 1.261071, -0.2822015, 0.7882353, 1, 0, 1,
-0.8229575, -0.8178285, -2.702976, 0.7803922, 1, 0, 1,
-0.8193946, -1.771646, -2.015979, 0.7764706, 1, 0, 1,
-0.8076901, -3.277768, -3.783027, 0.7686275, 1, 0, 1,
-0.8025149, -0.873444, -0.9152944, 0.7647059, 1, 0, 1,
-0.8014617, 0.4023246, -2.013915, 0.7568628, 1, 0, 1,
-0.7960082, 0.9819434, -0.5474551, 0.7529412, 1, 0, 1,
-0.7957922, 0.1314743, -1.410792, 0.7450981, 1, 0, 1,
-0.7942826, -0.9451126, -2.179221, 0.7411765, 1, 0, 1,
-0.7844074, 2.003102, -0.8211675, 0.7333333, 1, 0, 1,
-0.7812699, -0.1650721, -3.371101, 0.7294118, 1, 0, 1,
-0.7811095, -0.005023234, 0.1024049, 0.7215686, 1, 0, 1,
-0.7809719, 0.4849006, -2.371029, 0.7176471, 1, 0, 1,
-0.7796263, -0.4435142, -3.08665, 0.7098039, 1, 0, 1,
-0.7758339, -1.653807, -2.99059, 0.7058824, 1, 0, 1,
-0.7688213, -0.8564222, -3.601039, 0.6980392, 1, 0, 1,
-0.7657609, 0.0499379, -1.554438, 0.6901961, 1, 0, 1,
-0.7649075, -2.959294, -2.327208, 0.6862745, 1, 0, 1,
-0.7630821, -1.185272, -2.002995, 0.6784314, 1, 0, 1,
-0.7542796, -1.164801, -2.353183, 0.6745098, 1, 0, 1,
-0.7536623, -0.8728247, -3.283481, 0.6666667, 1, 0, 1,
-0.7485152, -1.413779, -2.661583, 0.6627451, 1, 0, 1,
-0.7470255, -0.1622299, -3.079285, 0.654902, 1, 0, 1,
-0.744752, -0.1095985, -2.21038, 0.6509804, 1, 0, 1,
-0.7437425, 1.343044, 0.4241156, 0.6431373, 1, 0, 1,
-0.7430603, 1.028856, -0.1801272, 0.6392157, 1, 0, 1,
-0.7416022, 0.1283665, -2.554382, 0.6313726, 1, 0, 1,
-0.7401516, 1.940598, -0.7159662, 0.627451, 1, 0, 1,
-0.7311261, -0.6907318, -2.959242, 0.6196079, 1, 0, 1,
-0.7244592, 1.996282, 0.09827499, 0.6156863, 1, 0, 1,
-0.7239802, 0.2667249, -0.5491208, 0.6078432, 1, 0, 1,
-0.7219768, 1.96561, 0.339354, 0.6039216, 1, 0, 1,
-0.7219644, 0.8707899, 0.2016288, 0.5960785, 1, 0, 1,
-0.7201191, -0.08482457, -1.006126, 0.5882353, 1, 0, 1,
-0.7166716, 2.058807, 0.3654827, 0.5843138, 1, 0, 1,
-0.7123362, -0.8330282, -1.241005, 0.5764706, 1, 0, 1,
-0.7107179, -1.283782, -3.784085, 0.572549, 1, 0, 1,
-0.7103902, -2.193388, -3.87338, 0.5647059, 1, 0, 1,
-0.7076414, -3.014128, -3.221098, 0.5607843, 1, 0, 1,
-0.7034164, 0.8209181, -0.9694408, 0.5529412, 1, 0, 1,
-0.6971275, 1.070567, 0.6114916, 0.5490196, 1, 0, 1,
-0.6890221, -0.8103238, -0.4989454, 0.5411765, 1, 0, 1,
-0.6863449, -1.098148, -2.812871, 0.5372549, 1, 0, 1,
-0.6855505, -0.4916938, -2.046916, 0.5294118, 1, 0, 1,
-0.6848894, 1.478579, -0.4134647, 0.5254902, 1, 0, 1,
-0.6795371, -0.239064, -1.093564, 0.5176471, 1, 0, 1,
-0.6717864, 0.5448627, -1.365975, 0.5137255, 1, 0, 1,
-0.6699235, -1.180815, -4.701734, 0.5058824, 1, 0, 1,
-0.6692805, 2.099314, -1.460307, 0.5019608, 1, 0, 1,
-0.668793, 1.329305, -1.995827, 0.4941176, 1, 0, 1,
-0.6572894, 1.513151, -2.012121, 0.4862745, 1, 0, 1,
-0.6570289, 1.177411, -1.733096, 0.4823529, 1, 0, 1,
-0.6558255, -0.6937459, -3.029256, 0.4745098, 1, 0, 1,
-0.6539804, -0.1537006, 0.9142862, 0.4705882, 1, 0, 1,
-0.6517745, 1.452914, 0.17235, 0.4627451, 1, 0, 1,
-0.645452, -0.3005484, -3.257626, 0.4588235, 1, 0, 1,
-0.6411831, 0.9503843, -0.6693375, 0.4509804, 1, 0, 1,
-0.6392241, -1.567445, -2.488284, 0.4470588, 1, 0, 1,
-0.6305063, 1.767483, -0.6697357, 0.4392157, 1, 0, 1,
-0.6302909, -0.4171992, -2.955595, 0.4352941, 1, 0, 1,
-0.6298915, 0.2525655, -0.9118802, 0.427451, 1, 0, 1,
-0.6279476, -0.5465242, -1.952112, 0.4235294, 1, 0, 1,
-0.6259036, -0.3483025, -1.233238, 0.4156863, 1, 0, 1,
-0.6255089, -1.254399, -1.729237, 0.4117647, 1, 0, 1,
-0.6244192, 1.194657, -0.786761, 0.4039216, 1, 0, 1,
-0.6204542, 1.151723, 0.6177864, 0.3960784, 1, 0, 1,
-0.6203866, -0.2320366, -0.7736449, 0.3921569, 1, 0, 1,
-0.6193636, 1.403977, -0.6091791, 0.3843137, 1, 0, 1,
-0.6176399, 0.2526748, -1.550132, 0.3803922, 1, 0, 1,
-0.6172122, 1.306957, -2.468282, 0.372549, 1, 0, 1,
-0.6160948, -0.5154894, -2.871834, 0.3686275, 1, 0, 1,
-0.614675, -0.1669928, -2.775926, 0.3607843, 1, 0, 1,
-0.6113552, -1.056765, -1.913204, 0.3568628, 1, 0, 1,
-0.609963, -0.6749591, -3.076549, 0.3490196, 1, 0, 1,
-0.6020266, -0.4961076, -1.636906, 0.345098, 1, 0, 1,
-0.6014483, -0.8848746, -2.305535, 0.3372549, 1, 0, 1,
-0.5999647, 1.776687, -0.4340501, 0.3333333, 1, 0, 1,
-0.5961696, 0.4744582, -0.7438383, 0.3254902, 1, 0, 1,
-0.5960112, 2.308201, -2.42911, 0.3215686, 1, 0, 1,
-0.5947808, -0.4455994, -1.128924, 0.3137255, 1, 0, 1,
-0.5877206, -0.2552914, -0.9545599, 0.3098039, 1, 0, 1,
-0.5876494, 1.396112, -3.135226, 0.3019608, 1, 0, 1,
-0.5874979, -0.2632679, -0.8242643, 0.2941177, 1, 0, 1,
-0.5869718, -1.162804, -0.8571492, 0.2901961, 1, 0, 1,
-0.5857526, 0.6232236, 1.005513, 0.282353, 1, 0, 1,
-0.5851423, 0.3239733, -0.342867, 0.2784314, 1, 0, 1,
-0.5840371, -0.3514258, -3.349245, 0.2705882, 1, 0, 1,
-0.5829998, 0.5638137, -0.8282771, 0.2666667, 1, 0, 1,
-0.582153, -0.1256553, -1.460015, 0.2588235, 1, 0, 1,
-0.5749531, -0.4430607, -1.783053, 0.254902, 1, 0, 1,
-0.5711239, -0.1520254, -2.952792, 0.2470588, 1, 0, 1,
-0.5623739, -0.1706122, -2.785438, 0.2431373, 1, 0, 1,
-0.5617733, -0.7925948, -0.8273584, 0.2352941, 1, 0, 1,
-0.5614532, -2.684302, -3.913754, 0.2313726, 1, 0, 1,
-0.5588428, -0.52188, -3.263931, 0.2235294, 1, 0, 1,
-0.5570066, -2.791881, -2.171292, 0.2196078, 1, 0, 1,
-0.5524814, 1.083414, -0.4574084, 0.2117647, 1, 0, 1,
-0.5488324, -0.7321187, -2.326801, 0.2078431, 1, 0, 1,
-0.5474689, -0.1483726, -2.23953, 0.2, 1, 0, 1,
-0.5412056, 1.473145, 1.31227, 0.1921569, 1, 0, 1,
-0.5396332, -0.5394855, -3.627468, 0.1882353, 1, 0, 1,
-0.5376041, -0.8104535, -3.692267, 0.1803922, 1, 0, 1,
-0.5375506, -0.500716, -1.353798, 0.1764706, 1, 0, 1,
-0.5374998, -0.3130161, -1.978685, 0.1686275, 1, 0, 1,
-0.5368275, -0.09740122, -1.896822, 0.1647059, 1, 0, 1,
-0.5331489, -1.071818, -1.693716, 0.1568628, 1, 0, 1,
-0.5266884, -1.475471, -2.786542, 0.1529412, 1, 0, 1,
-0.5253608, -0.5086894, -2.359019, 0.145098, 1, 0, 1,
-0.524035, 0.2069596, -0.8904643, 0.1411765, 1, 0, 1,
-0.5213401, -0.2923569, -1.661009, 0.1333333, 1, 0, 1,
-0.518145, -0.358455, -2.310787, 0.1294118, 1, 0, 1,
-0.5149962, 0.6454515, 0.6846346, 0.1215686, 1, 0, 1,
-0.5128681, -0.423956, -2.199537, 0.1176471, 1, 0, 1,
-0.5119216, 0.5456652, 1.221147, 0.1098039, 1, 0, 1,
-0.5102342, 1.520895, 0.2557824, 0.1058824, 1, 0, 1,
-0.5086885, -1.277497, -0.5775782, 0.09803922, 1, 0, 1,
-0.495028, -0.2792222, -2.369995, 0.09019608, 1, 0, 1,
-0.493373, -0.1951121, -2.345814, 0.08627451, 1, 0, 1,
-0.4892559, -0.475967, -2.465671, 0.07843138, 1, 0, 1,
-0.4821788, -0.2637115, -2.150394, 0.07450981, 1, 0, 1,
-0.477653, 0.1662717, -2.96505, 0.06666667, 1, 0, 1,
-0.4731929, -0.3849447, -3.655686, 0.0627451, 1, 0, 1,
-0.4681635, 0.2658499, -2.354154, 0.05490196, 1, 0, 1,
-0.4609569, -0.9073272, -4.011164, 0.05098039, 1, 0, 1,
-0.4609517, -0.2326808, -3.760486, 0.04313726, 1, 0, 1,
-0.4590384, -0.926999, -2.465279, 0.03921569, 1, 0, 1,
-0.4581884, -1.189399, -3.650213, 0.03137255, 1, 0, 1,
-0.4566814, -0.479995, -2.930568, 0.02745098, 1, 0, 1,
-0.4538186, -0.03219052, -2.02341, 0.01960784, 1, 0, 1,
-0.4533207, -0.04671754, -1.821938, 0.01568628, 1, 0, 1,
-0.4504982, -0.5815579, -3.23842, 0.007843138, 1, 0, 1,
-0.4504712, -2.719481, -1.476056, 0.003921569, 1, 0, 1,
-0.4498471, -1.117553, -2.632183, 0, 1, 0.003921569, 1,
-0.4418092, 0.6154267, 0.5513533, 0, 1, 0.01176471, 1,
-0.4281843, -0.8822529, -2.439481, 0, 1, 0.01568628, 1,
-0.428156, 0.07059864, -3.004287, 0, 1, 0.02352941, 1,
-0.4272854, -0.3811564, -1.397836, 0, 1, 0.02745098, 1,
-0.4269278, -0.2727091, -1.732851, 0, 1, 0.03529412, 1,
-0.4232764, -0.05406987, -2.332845, 0, 1, 0.03921569, 1,
-0.4199378, 0.3200775, -0.05484091, 0, 1, 0.04705882, 1,
-0.4166743, -0.7992322, -2.61522, 0, 1, 0.05098039, 1,
-0.4159506, 0.3350157, -1.176351, 0, 1, 0.05882353, 1,
-0.4143637, -1.073806, -0.1230978, 0, 1, 0.0627451, 1,
-0.4100739, -1.001885, -1.489158, 0, 1, 0.07058824, 1,
-0.4073115, 0.7211807, -0.6011565, 0, 1, 0.07450981, 1,
-0.4058436, -0.4753112, -2.737466, 0, 1, 0.08235294, 1,
-0.4050207, 0.0950829, -0.5441365, 0, 1, 0.08627451, 1,
-0.4023289, 0.8700438, 0.7748999, 0, 1, 0.09411765, 1,
-0.401583, -1.310121, -0.6478483, 0, 1, 0.1019608, 1,
-0.4007591, -1.158054, -2.317676, 0, 1, 0.1058824, 1,
-0.3945551, 0.6918685, -1.961161, 0, 1, 0.1137255, 1,
-0.3923548, 1.113661, -0.9436645, 0, 1, 0.1176471, 1,
-0.390458, -1.824678, -3.074858, 0, 1, 0.1254902, 1,
-0.3865746, 1.155852, -0.7143204, 0, 1, 0.1294118, 1,
-0.3848373, -0.8604196, -2.533346, 0, 1, 0.1372549, 1,
-0.382446, -0.8603069, -1.450776, 0, 1, 0.1411765, 1,
-0.3794125, 0.7919809, -1.276097, 0, 1, 0.1490196, 1,
-0.3775799, 1.173261, -2.459319, 0, 1, 0.1529412, 1,
-0.3727649, 0.6750937, -1.385483, 0, 1, 0.1607843, 1,
-0.3695157, 0.3931832, -1.330744, 0, 1, 0.1647059, 1,
-0.3653598, -0.08854099, -0.8209781, 0, 1, 0.172549, 1,
-0.3581686, -1.177772, -1.227851, 0, 1, 0.1764706, 1,
-0.3572684, 0.3359824, -2.286066, 0, 1, 0.1843137, 1,
-0.3533594, 1.529778, -0.623821, 0, 1, 0.1882353, 1,
-0.3529862, 0.5610235, 0.03779998, 0, 1, 0.1960784, 1,
-0.3528984, -0.1275881, -2.589854, 0, 1, 0.2039216, 1,
-0.3520613, -0.8722481, -3.551611, 0, 1, 0.2078431, 1,
-0.3474008, -1.72045, -2.787677, 0, 1, 0.2156863, 1,
-0.3459378, 0.5668396, -0.6040888, 0, 1, 0.2196078, 1,
-0.3433785, -0.06309095, -0.6932796, 0, 1, 0.227451, 1,
-0.3426243, 0.2770391, -1.369241, 0, 1, 0.2313726, 1,
-0.3389933, -1.664338, -3.45514, 0, 1, 0.2392157, 1,
-0.3325281, -0.3564155, -2.333664, 0, 1, 0.2431373, 1,
-0.3310764, -0.7388611, -1.991103, 0, 1, 0.2509804, 1,
-0.3254746, -0.08304414, -1.654951, 0, 1, 0.254902, 1,
-0.3225091, 1.101038, 1.014007, 0, 1, 0.2627451, 1,
-0.3217199, -0.7796521, 0.3479615, 0, 1, 0.2666667, 1,
-0.3207986, -0.7152605, -1.607516, 0, 1, 0.2745098, 1,
-0.3193329, -0.02806462, -3.895977, 0, 1, 0.2784314, 1,
-0.3188531, 1.256177, 0.3469086, 0, 1, 0.2862745, 1,
-0.315872, -1.576507, -3.700143, 0, 1, 0.2901961, 1,
-0.3156675, -1.202981, -2.443126, 0, 1, 0.2980392, 1,
-0.3122836, 1.156005, 0.8700354, 0, 1, 0.3058824, 1,
-0.3059396, -0.2913311, -2.414375, 0, 1, 0.3098039, 1,
-0.3056779, 0.418976, -2.2757, 0, 1, 0.3176471, 1,
-0.3035972, 0.285581, -0.4200836, 0, 1, 0.3215686, 1,
-0.3023533, -1.116613, -3.505741, 0, 1, 0.3294118, 1,
-0.302224, -0.3111408, -1.532698, 0, 1, 0.3333333, 1,
-0.3016826, 1.877505, 0.0862541, 0, 1, 0.3411765, 1,
-0.300716, 0.09626953, -1.936705, 0, 1, 0.345098, 1,
-0.2993199, 0.4381925, -0.6814312, 0, 1, 0.3529412, 1,
-0.2985606, -0.8105553, -3.183494, 0, 1, 0.3568628, 1,
-0.2985185, 0.5560802, -1.107992, 0, 1, 0.3647059, 1,
-0.293536, 0.2141298, -1.715869, 0, 1, 0.3686275, 1,
-0.2884655, 0.5287645, -2.032511, 0, 1, 0.3764706, 1,
-0.2874942, 0.967884, -0.7464511, 0, 1, 0.3803922, 1,
-0.2840733, -2.036141, -3.499834, 0, 1, 0.3882353, 1,
-0.2807212, -0.09366143, -2.272819, 0, 1, 0.3921569, 1,
-0.2795777, -2.043144, -4.404572, 0, 1, 0.4, 1,
-0.2776578, 1.444785, 0.501147, 0, 1, 0.4078431, 1,
-0.2721716, -0.8559484, -2.668102, 0, 1, 0.4117647, 1,
-0.2672331, 0.6403654, 0.4850328, 0, 1, 0.4196078, 1,
-0.264174, -0.55462, -0.8985543, 0, 1, 0.4235294, 1,
-0.2582312, 0.2249053, -0.7438418, 0, 1, 0.4313726, 1,
-0.2580329, -1.288829, -4.066989, 0, 1, 0.4352941, 1,
-0.2578938, 0.5846099, -0.5609735, 0, 1, 0.4431373, 1,
-0.25692, -0.4603226, -2.566396, 0, 1, 0.4470588, 1,
-0.2519817, 0.00892549, -0.7064995, 0, 1, 0.454902, 1,
-0.2514683, 0.005496113, -0.003360265, 0, 1, 0.4588235, 1,
-0.2512791, 1.269769, 0.3663456, 0, 1, 0.4666667, 1,
-0.250211, -0.03108189, -1.565882, 0, 1, 0.4705882, 1,
-0.2499665, 0.1915881, -0.5580803, 0, 1, 0.4784314, 1,
-0.2446142, 0.1412035, -1.888742, 0, 1, 0.4823529, 1,
-0.2301234, -1.723114, -4.562967, 0, 1, 0.4901961, 1,
-0.2295148, 0.4112487, -1.884105, 0, 1, 0.4941176, 1,
-0.2267248, 0.08758949, -0.8471817, 0, 1, 0.5019608, 1,
-0.2254293, -0.1152458, -1.814633, 0, 1, 0.509804, 1,
-0.2245416, -0.6291692, -2.337124, 0, 1, 0.5137255, 1,
-0.2215016, -0.1702907, -3.052232, 0, 1, 0.5215687, 1,
-0.2171175, 0.5395323, -0.9159467, 0, 1, 0.5254902, 1,
-0.2167431, -0.8952077, -3.007669, 0, 1, 0.5333334, 1,
-0.2161376, 1.093652, -0.02705202, 0, 1, 0.5372549, 1,
-0.2124556, 1.802611, -1.385426, 0, 1, 0.5450981, 1,
-0.2079817, -0.5872366, -1.218017, 0, 1, 0.5490196, 1,
-0.2079139, -0.9676574, -4.183711, 0, 1, 0.5568628, 1,
-0.2046051, 0.8401598, -1.084502, 0, 1, 0.5607843, 1,
-0.20035, 1.266558, -1.418653, 0, 1, 0.5686275, 1,
-0.1959189, -0.004239607, -2.220245, 0, 1, 0.572549, 1,
-0.1938497, -1.831942, -2.675637, 0, 1, 0.5803922, 1,
-0.1921477, -1.109029, -3.823914, 0, 1, 0.5843138, 1,
-0.1880731, 0.347141, 0.04965787, 0, 1, 0.5921569, 1,
-0.1870637, 0.3984796, -0.3103355, 0, 1, 0.5960785, 1,
-0.1867023, -1.898198, -2.018368, 0, 1, 0.6039216, 1,
-0.1840819, 0.7097141, 1.268001, 0, 1, 0.6117647, 1,
-0.1826461, -1.09277, -1.734249, 0, 1, 0.6156863, 1,
-0.1812446, -0.3649089, -1.98003, 0, 1, 0.6235294, 1,
-0.1802071, 0.9591864, 0.4260391, 0, 1, 0.627451, 1,
-0.1788097, -0.2719049, -1.78773, 0, 1, 0.6352941, 1,
-0.1776905, -0.8476959, -3.088033, 0, 1, 0.6392157, 1,
-0.1702961, 0.4673899, -0.8541039, 0, 1, 0.6470588, 1,
-0.1691221, 1.751517, -1.444807, 0, 1, 0.6509804, 1,
-0.1660854, 0.7957472, -0.139453, 0, 1, 0.6588235, 1,
-0.164959, -0.8605627, -2.179824, 0, 1, 0.6627451, 1,
-0.16201, -0.2242954, -1.92015, 0, 1, 0.6705883, 1,
-0.1608283, -0.7419938, -3.349497, 0, 1, 0.6745098, 1,
-0.1563938, 0.4632659, 1.660836, 0, 1, 0.682353, 1,
-0.1558022, 0.6833113, -0.8876702, 0, 1, 0.6862745, 1,
-0.155775, 1.289425, -0.6355283, 0, 1, 0.6941177, 1,
-0.1533158, -0.6885337, -2.772953, 0, 1, 0.7019608, 1,
-0.1513066, -0.9259202, -3.383645, 0, 1, 0.7058824, 1,
-0.1430797, -0.7555773, -3.86583, 0, 1, 0.7137255, 1,
-0.1418666, 0.7982814, -1.882853, 0, 1, 0.7176471, 1,
-0.1376841, -0.2548079, -2.111754, 0, 1, 0.7254902, 1,
-0.137463, -0.5625362, -1.453142, 0, 1, 0.7294118, 1,
-0.1366241, -1.158668, -3.649758, 0, 1, 0.7372549, 1,
-0.136464, -0.70913, -2.365703, 0, 1, 0.7411765, 1,
-0.1331052, -0.7882314, -3.929402, 0, 1, 0.7490196, 1,
-0.1322439, -1.356369, -2.681448, 0, 1, 0.7529412, 1,
-0.1308413, -1.865654, -4.711424, 0, 1, 0.7607843, 1,
-0.1242408, 0.2180106, 0.1010113, 0, 1, 0.7647059, 1,
-0.1230127, -0.09545221, -1.288991, 0, 1, 0.772549, 1,
-0.11259, -0.5128818, -2.401304, 0, 1, 0.7764706, 1,
-0.110591, 0.9950143, -1.174393, 0, 1, 0.7843137, 1,
-0.1057052, 0.6470151, 1.247155, 0, 1, 0.7882353, 1,
-0.1036254, -0.1396635, -1.418929, 0, 1, 0.7960784, 1,
-0.1034318, -2.378018, -1.389358, 0, 1, 0.8039216, 1,
-0.1034317, 2.632856, -1.212054, 0, 1, 0.8078431, 1,
-0.09680205, -0.1409011, -3.351483, 0, 1, 0.8156863, 1,
-0.09624469, 0.3280326, 0.3498383, 0, 1, 0.8196079, 1,
-0.09103254, 0.6329397, -0.8600361, 0, 1, 0.827451, 1,
-0.08742758, 0.8958349, -0.4952818, 0, 1, 0.8313726, 1,
-0.08705309, 2.277382, -0.5564576, 0, 1, 0.8392157, 1,
-0.0869078, -0.9334878, -3.370436, 0, 1, 0.8431373, 1,
-0.08615417, 1.24741, 0.2544535, 0, 1, 0.8509804, 1,
-0.08487076, 0.1675782, -0.2773823, 0, 1, 0.854902, 1,
-0.08178027, -0.9752278, -2.322471, 0, 1, 0.8627451, 1,
-0.08072039, -0.233297, -4.636187, 0, 1, 0.8666667, 1,
-0.0701909, 1.236706, 1.61963, 0, 1, 0.8745098, 1,
-0.0645164, -2.28097, -2.376011, 0, 1, 0.8784314, 1,
-0.06271137, 0.1562264, -1.155539, 0, 1, 0.8862745, 1,
-0.06141969, 2.727236, -0.97898, 0, 1, 0.8901961, 1,
-0.06025449, -0.7810216, -2.01144, 0, 1, 0.8980392, 1,
-0.05887403, 1.419704, -0.212484, 0, 1, 0.9058824, 1,
-0.05634521, 0.8967221, -1.10465, 0, 1, 0.9098039, 1,
-0.05571223, -1.035682, -2.822687, 0, 1, 0.9176471, 1,
-0.05479497, 0.3506438, -1.718535, 0, 1, 0.9215686, 1,
-0.04926189, 0.3029727, 0.2816859, 0, 1, 0.9294118, 1,
-0.03875125, -0.7225947, -4.109038, 0, 1, 0.9333333, 1,
-0.0361075, 0.106034, -0.2774627, 0, 1, 0.9411765, 1,
-0.03587003, 1.236117, 0.1734146, 0, 1, 0.945098, 1,
-0.03316173, -0.9005428, -5.003358, 0, 1, 0.9529412, 1,
-0.03238604, -0.2096459, -3.988799, 0, 1, 0.9568627, 1,
-0.03035156, -0.2803371, -1.2758, 0, 1, 0.9647059, 1,
-0.03033017, 0.8450292, -0.2876269, 0, 1, 0.9686275, 1,
-0.02576935, 2.050448, -1.008912, 0, 1, 0.9764706, 1,
-0.02538129, -1.694271, -3.953019, 0, 1, 0.9803922, 1,
-0.0251909, -1.629709, -2.438622, 0, 1, 0.9882353, 1,
-0.02484702, 1.340285, -1.431699, 0, 1, 0.9921569, 1,
-0.02482359, -0.3990643, -3.847926, 0, 1, 1, 1,
-0.02222855, -1.188913, -2.537049, 0, 0.9921569, 1, 1,
-0.02197832, 0.9841881, -0.2456485, 0, 0.9882353, 1, 1,
-0.01951831, 0.3655683, -0.1748493, 0, 0.9803922, 1, 1,
-0.0190811, -0.1158802, -3.627144, 0, 0.9764706, 1, 1,
-0.01876944, -1.597705, -3.71392, 0, 0.9686275, 1, 1,
-0.01861905, 0.3966695, -0.7800261, 0, 0.9647059, 1, 1,
-0.01661877, -0.1589728, -3.211122, 0, 0.9568627, 1, 1,
-0.01514752, -0.3945539, -2.414697, 0, 0.9529412, 1, 1,
-0.006631448, 0.7443584, -0.06783511, 0, 0.945098, 1, 1,
-0.005814768, 1.318883, -0.1444079, 0, 0.9411765, 1, 1,
-0.005217358, -0.1009173, -3.741725, 0, 0.9333333, 1, 1,
-0.001953163, -0.1657711, -3.436361, 0, 0.9294118, 1, 1,
0.009069679, -0.3269441, 4.477681, 0, 0.9215686, 1, 1,
0.01047739, -2.938457, 3.294639, 0, 0.9176471, 1, 1,
0.01063345, -1.223013, 4.108823, 0, 0.9098039, 1, 1,
0.01782664, -0.6964815, 1.874396, 0, 0.9058824, 1, 1,
0.01975637, 1.186886, -0.5603037, 0, 0.8980392, 1, 1,
0.02388927, 0.5134909, -1.012775, 0, 0.8901961, 1, 1,
0.03171374, -0.9912348, 2.703778, 0, 0.8862745, 1, 1,
0.03381028, 0.9939289, 1.677729, 0, 0.8784314, 1, 1,
0.03426836, 0.1059262, 0.1080292, 0, 0.8745098, 1, 1,
0.03463998, -0.08096219, 4.427025, 0, 0.8666667, 1, 1,
0.03512894, 0.1512007, 1.570717, 0, 0.8627451, 1, 1,
0.03555994, -0.3722773, 4.654536, 0, 0.854902, 1, 1,
0.03884511, 1.367994, 1.444466, 0, 0.8509804, 1, 1,
0.04364074, -0.5074489, 3.186902, 0, 0.8431373, 1, 1,
0.04502679, 0.07972005, -0.122627, 0, 0.8392157, 1, 1,
0.05026934, 1.220539, -0.6204821, 0, 0.8313726, 1, 1,
0.05104954, -0.09095871, 2.705802, 0, 0.827451, 1, 1,
0.05110402, -0.5522613, 1.866983, 0, 0.8196079, 1, 1,
0.05202752, 0.2072701, -0.3741624, 0, 0.8156863, 1, 1,
0.05329058, 0.1522318, 0.2269905, 0, 0.8078431, 1, 1,
0.0707247, 1.531298, 0.0824661, 0, 0.8039216, 1, 1,
0.07219848, 1.237926, 1.344816, 0, 0.7960784, 1, 1,
0.07391721, -0.641481, 1.955908, 0, 0.7882353, 1, 1,
0.07482763, 0.6502317, 0.7073523, 0, 0.7843137, 1, 1,
0.07555099, -0.7527336, 4.117572, 0, 0.7764706, 1, 1,
0.07641783, -1.337224, 2.729139, 0, 0.772549, 1, 1,
0.07976545, -0.776304, 2.014435, 0, 0.7647059, 1, 1,
0.08074684, -1.938665, 3.117057, 0, 0.7607843, 1, 1,
0.08564286, -1.090419, 3.460437, 0, 0.7529412, 1, 1,
0.08574543, 1.338272, 0.1807293, 0, 0.7490196, 1, 1,
0.08620242, -1.550922, 4.039448, 0, 0.7411765, 1, 1,
0.0873387, 0.5094196, -1.871872, 0, 0.7372549, 1, 1,
0.0879741, -1.510427, 2.192383, 0, 0.7294118, 1, 1,
0.09354198, -0.4223672, 3.230314, 0, 0.7254902, 1, 1,
0.09392993, -0.5622945, 3.710197, 0, 0.7176471, 1, 1,
0.0948483, -1.401214, 2.001419, 0, 0.7137255, 1, 1,
0.09642572, -0.1052746, 3.376455, 0, 0.7058824, 1, 1,
0.106826, 1.839215, 0.4161187, 0, 0.6980392, 1, 1,
0.1075844, -0.2332016, 3.046816, 0, 0.6941177, 1, 1,
0.1088273, 0.5171227, 0.3619887, 0, 0.6862745, 1, 1,
0.111566, 0.7071483, 0.7355429, 0, 0.682353, 1, 1,
0.1153333, -0.447062, 3.258892, 0, 0.6745098, 1, 1,
0.1191386, -1.216147, 1.998235, 0, 0.6705883, 1, 1,
0.1220942, -0.03377667, 2.024933, 0, 0.6627451, 1, 1,
0.1238686, 0.5123575, 0.9717248, 0, 0.6588235, 1, 1,
0.1263267, 1.902224, -0.4629138, 0, 0.6509804, 1, 1,
0.132096, -0.2784679, 2.752162, 0, 0.6470588, 1, 1,
0.1332615, -0.8876891, 4.120067, 0, 0.6392157, 1, 1,
0.1369748, -0.1812424, 2.696968, 0, 0.6352941, 1, 1,
0.1375896, -1.13527, 3.402069, 0, 0.627451, 1, 1,
0.1394106, -0.4219547, 3.824742, 0, 0.6235294, 1, 1,
0.1554343, -0.704459, 2.769061, 0, 0.6156863, 1, 1,
0.1607662, -1.635908, 3.751403, 0, 0.6117647, 1, 1,
0.1621242, -0.2349511, 1.514315, 0, 0.6039216, 1, 1,
0.1652014, -2.412016, 4.198877, 0, 0.5960785, 1, 1,
0.1667735, 1.272901, 0.2462126, 0, 0.5921569, 1, 1,
0.1709755, -0.3876765, 2.646828, 0, 0.5843138, 1, 1,
0.1768475, -0.406751, 0.3403208, 0, 0.5803922, 1, 1,
0.1776578, -1.646949, 3.616893, 0, 0.572549, 1, 1,
0.1793545, -1.549974, 3.780933, 0, 0.5686275, 1, 1,
0.1810607, 2.27314, 1.439277, 0, 0.5607843, 1, 1,
0.1811559, -0.9237756, 4.462261, 0, 0.5568628, 1, 1,
0.1829648, -0.1809239, 1.175054, 0, 0.5490196, 1, 1,
0.1836119, 0.2306871, -0.2114785, 0, 0.5450981, 1, 1,
0.1846057, 1.952412, 0.3545277, 0, 0.5372549, 1, 1,
0.1869947, -1.250772, 2.858506, 0, 0.5333334, 1, 1,
0.1878466, 0.4380967, 1.443204, 0, 0.5254902, 1, 1,
0.1930064, -1.319234, 4.242037, 0, 0.5215687, 1, 1,
0.1937955, -0.5695975, 4.250247, 0, 0.5137255, 1, 1,
0.195273, 0.1883995, 1.823017, 0, 0.509804, 1, 1,
0.1972722, 0.0698716, 0.4539889, 0, 0.5019608, 1, 1,
0.198091, 1.394987, 0.009029469, 0, 0.4941176, 1, 1,
0.2000483, -1.102557, 2.093732, 0, 0.4901961, 1, 1,
0.2006699, -0.4726751, 4.034091, 0, 0.4823529, 1, 1,
0.2034179, -1.010339, -0.01698246, 0, 0.4784314, 1, 1,
0.2052427, 0.2304395, 1.436573, 0, 0.4705882, 1, 1,
0.2054489, -0.9113652, 3.434956, 0, 0.4666667, 1, 1,
0.2062609, -0.657988, 3.185201, 0, 0.4588235, 1, 1,
0.2067481, -0.9590885, 2.489013, 0, 0.454902, 1, 1,
0.2096558, -0.5375824, 2.72079, 0, 0.4470588, 1, 1,
0.2149657, -0.7003827, 1.952372, 0, 0.4431373, 1, 1,
0.2158398, -0.1001008, 1.662997, 0, 0.4352941, 1, 1,
0.2228565, -0.9718967, 3.718043, 0, 0.4313726, 1, 1,
0.2347641, -1.536461, 1.939664, 0, 0.4235294, 1, 1,
0.2351527, 0.2933288, 1.118635, 0, 0.4196078, 1, 1,
0.2368218, 0.2447668, -0.8659258, 0, 0.4117647, 1, 1,
0.2372758, 1.110103, 0.8667535, 0, 0.4078431, 1, 1,
0.2390762, 0.284335, 1.145989, 0, 0.4, 1, 1,
0.2422643, -2.081062, 3.690127, 0, 0.3921569, 1, 1,
0.2445334, 0.7734636, 0.9296138, 0, 0.3882353, 1, 1,
0.2446302, -0.04349436, 2.742773, 0, 0.3803922, 1, 1,
0.2448607, -1.177222, 2.430555, 0, 0.3764706, 1, 1,
0.2452603, 1.090888, 0.9890571, 0, 0.3686275, 1, 1,
0.2498063, 0.436336, 0.9368149, 0, 0.3647059, 1, 1,
0.2501236, 2.08376, 0.147967, 0, 0.3568628, 1, 1,
0.2503769, 0.9089549, 1.049232, 0, 0.3529412, 1, 1,
0.2519896, 0.6600813, 0.7873529, 0, 0.345098, 1, 1,
0.254544, 0.0433823, 2.529706, 0, 0.3411765, 1, 1,
0.2552681, -0.4101722, 2.492104, 0, 0.3333333, 1, 1,
0.2593224, 0.5209851, 1.462556, 0, 0.3294118, 1, 1,
0.2597782, 0.7482084, 0.13281, 0, 0.3215686, 1, 1,
0.261292, 1.503269, -1.568116, 0, 0.3176471, 1, 1,
0.2645085, 0.2680019, -0.01736809, 0, 0.3098039, 1, 1,
0.2654459, 0.2273797, 0.441748, 0, 0.3058824, 1, 1,
0.2665781, -1.054289, 3.415179, 0, 0.2980392, 1, 1,
0.2675598, 0.2219733, 0.2379777, 0, 0.2901961, 1, 1,
0.2702429, -0.0339698, 1.128368, 0, 0.2862745, 1, 1,
0.2720112, 0.973178, -0.6953307, 0, 0.2784314, 1, 1,
0.2736725, -0.02801121, 1.647693, 0, 0.2745098, 1, 1,
0.274823, 0.434521, -0.01740042, 0, 0.2666667, 1, 1,
0.2757083, -0.1675992, 1.555795, 0, 0.2627451, 1, 1,
0.27737, 0.4934328, 0.006073204, 0, 0.254902, 1, 1,
0.2853094, 0.417904, 1.487515, 0, 0.2509804, 1, 1,
0.289562, -0.7305495, 3.752252, 0, 0.2431373, 1, 1,
0.28995, 1.481614, 0.6624709, 0, 0.2392157, 1, 1,
0.2970185, -1.737497, 3.695209, 0, 0.2313726, 1, 1,
0.2979912, 0.2266091, 1.249542, 0, 0.227451, 1, 1,
0.2998907, 0.7162648, -0.117192, 0, 0.2196078, 1, 1,
0.2999727, 0.02980351, 3.336443, 0, 0.2156863, 1, 1,
0.3000257, 0.3114378, 1.552562, 0, 0.2078431, 1, 1,
0.3049452, -0.0006266707, 0.8938966, 0, 0.2039216, 1, 1,
0.3071782, 0.5355251, 0.2232494, 0, 0.1960784, 1, 1,
0.3090283, 0.2938157, 1.164463, 0, 0.1882353, 1, 1,
0.3161724, 1.046756, -0.5671783, 0, 0.1843137, 1, 1,
0.3165182, -0.7323722, 3.634264, 0, 0.1764706, 1, 1,
0.3202929, 0.7007464, 0.542843, 0, 0.172549, 1, 1,
0.3244479, 0.4661595, -0.2277635, 0, 0.1647059, 1, 1,
0.3260369, -0.6188052, 2.164948, 0, 0.1607843, 1, 1,
0.3284099, -1.814831, 3.030733, 0, 0.1529412, 1, 1,
0.3297433, 0.5678194, 0.2127906, 0, 0.1490196, 1, 1,
0.3322739, -1.505622, 1.868639, 0, 0.1411765, 1, 1,
0.3325143, 1.027993, -0.4464877, 0, 0.1372549, 1, 1,
0.3333295, -0.7513752, 3.666221, 0, 0.1294118, 1, 1,
0.3336865, -1.104111, 3.000568, 0, 0.1254902, 1, 1,
0.3367799, -0.804985, 4.482927, 0, 0.1176471, 1, 1,
0.3372883, 0.2635134, 3.208958, 0, 0.1137255, 1, 1,
0.3381492, -0.6843088, 3.251982, 0, 0.1058824, 1, 1,
0.3390428, 0.2499005, -1.333894, 0, 0.09803922, 1, 1,
0.339136, -2.349418, 2.47769, 0, 0.09411765, 1, 1,
0.3396425, -2.365222, 1.962341, 0, 0.08627451, 1, 1,
0.3422282, 0.2781937, 1.196207, 0, 0.08235294, 1, 1,
0.348185, -0.1471335, 2.79486, 0, 0.07450981, 1, 1,
0.348681, -0.4771695, 4.241516, 0, 0.07058824, 1, 1,
0.3493146, -0.1140768, 1.1337, 0, 0.0627451, 1, 1,
0.3567818, -0.01955003, 1.910669, 0, 0.05882353, 1, 1,
0.3569859, 0.6015723, 0.03737706, 0, 0.05098039, 1, 1,
0.358678, 0.5719652, 0.7910064, 0, 0.04705882, 1, 1,
0.3592441, 0.9344242, 0.6650275, 0, 0.03921569, 1, 1,
0.3616833, 0.08303215, 1.830555, 0, 0.03529412, 1, 1,
0.3631844, -1.690356, 2.93739, 0, 0.02745098, 1, 1,
0.3674797, -0.919026, 3.972384, 0, 0.02352941, 1, 1,
0.371496, -0.3438808, 4.080327, 0, 0.01568628, 1, 1,
0.3738842, 0.0198341, 2.9611, 0, 0.01176471, 1, 1,
0.3791445, 1.250003, 0.5163555, 0, 0.003921569, 1, 1,
0.379481, 0.5818559, 0.5108512, 0.003921569, 0, 1, 1,
0.3806674, 1.512714, -0.5036436, 0.007843138, 0, 1, 1,
0.3807389, 1.582802, -0.0191239, 0.01568628, 0, 1, 1,
0.3835412, 1.624522, -0.1555661, 0.01960784, 0, 1, 1,
0.3882194, 0.5288733, -0.4987258, 0.02745098, 0, 1, 1,
0.3882228, 0.9339347, 0.2190234, 0.03137255, 0, 1, 1,
0.391115, 0.6911308, 0.02837458, 0.03921569, 0, 1, 1,
0.394388, -0.7056816, 4.402212, 0.04313726, 0, 1, 1,
0.3952498, 0.6792695, 2.319464, 0.05098039, 0, 1, 1,
0.395497, 1.487069, -0.752843, 0.05490196, 0, 1, 1,
0.3973305, -0.04420979, 0.8664949, 0.0627451, 0, 1, 1,
0.4056725, -1.587025, 3.79135, 0.06666667, 0, 1, 1,
0.4093128, -1.231848, 2.545387, 0.07450981, 0, 1, 1,
0.4094125, -0.1115496, 1.911441, 0.07843138, 0, 1, 1,
0.4105045, 1.423215, 0.1668, 0.08627451, 0, 1, 1,
0.4190766, -0.127836, 2.464288, 0.09019608, 0, 1, 1,
0.4272635, -0.4014195, 2.539289, 0.09803922, 0, 1, 1,
0.4274985, -0.1368909, 1.580514, 0.1058824, 0, 1, 1,
0.4290878, -0.4154257, 2.081407, 0.1098039, 0, 1, 1,
0.430442, -1.098056, 1.601944, 0.1176471, 0, 1, 1,
0.436747, -1.677136, 1.770537, 0.1215686, 0, 1, 1,
0.4391622, -0.7111351, 1.670756, 0.1294118, 0, 1, 1,
0.44254, 1.134747, -0.1200839, 0.1333333, 0, 1, 1,
0.4485912, -0.8493223, 3.330266, 0.1411765, 0, 1, 1,
0.4498167, -0.7173464, 2.654931, 0.145098, 0, 1, 1,
0.4540531, -0.9748239, 5.604156, 0.1529412, 0, 1, 1,
0.454665, -0.4625419, 3.901341, 0.1568628, 0, 1, 1,
0.4591228, -0.2957586, 1.547693, 0.1647059, 0, 1, 1,
0.4595037, 0.5251604, 0.6417726, 0.1686275, 0, 1, 1,
0.4602961, 1.12282, -0.8905763, 0.1764706, 0, 1, 1,
0.4629414, -0.004816466, 0.706237, 0.1803922, 0, 1, 1,
0.4646185, -0.2596455, 1.463618, 0.1882353, 0, 1, 1,
0.4690176, -0.6839952, 3.323492, 0.1921569, 0, 1, 1,
0.4702679, 1.195457, 0.6881122, 0.2, 0, 1, 1,
0.4707143, -0.07961292, 3.278645, 0.2078431, 0, 1, 1,
0.4722107, 1.301744, -0.1697195, 0.2117647, 0, 1, 1,
0.4723149, 1.061753, -1.855424, 0.2196078, 0, 1, 1,
0.4738299, 0.3791006, -0.1006115, 0.2235294, 0, 1, 1,
0.4775687, -0.6495787, 2.163217, 0.2313726, 0, 1, 1,
0.4813893, -2.055142, 4.539347, 0.2352941, 0, 1, 1,
0.4832571, 0.8279732, 1.514791, 0.2431373, 0, 1, 1,
0.4835458, -1.267578, 3.26047, 0.2470588, 0, 1, 1,
0.4844928, -0.1869997, 2.053961, 0.254902, 0, 1, 1,
0.4871791, 0.03589162, 0.7196696, 0.2588235, 0, 1, 1,
0.4884751, -1.194963, 0.6782367, 0.2666667, 0, 1, 1,
0.4964598, -0.2088628, 0.7680637, 0.2705882, 0, 1, 1,
0.4974729, 0.2273445, -0.5451804, 0.2784314, 0, 1, 1,
0.4999849, 1.308743, 2.02855, 0.282353, 0, 1, 1,
0.5064117, -1.567924, 2.567175, 0.2901961, 0, 1, 1,
0.5069783, 1.700222, 0.4973755, 0.2941177, 0, 1, 1,
0.5102403, -2.301601, 3.199093, 0.3019608, 0, 1, 1,
0.5107011, 0.6526, 0.6506614, 0.3098039, 0, 1, 1,
0.5148655, 0.3889486, 1.952881, 0.3137255, 0, 1, 1,
0.5150183, 1.333367, 0.9685655, 0.3215686, 0, 1, 1,
0.5181125, -0.6706364, 1.290551, 0.3254902, 0, 1, 1,
0.5198941, 0.4055063, 1.111104, 0.3333333, 0, 1, 1,
0.5217808, 1.194227, 0.568804, 0.3372549, 0, 1, 1,
0.5285382, -0.7627302, 2.327625, 0.345098, 0, 1, 1,
0.5292746, -0.1770986, 0.615198, 0.3490196, 0, 1, 1,
0.5295184, -1.159968, 3.285292, 0.3568628, 0, 1, 1,
0.5343906, -0.07868692, 1.6041, 0.3607843, 0, 1, 1,
0.535624, -0.2319646, 2.64913, 0.3686275, 0, 1, 1,
0.5371839, -1.027302, 2.476876, 0.372549, 0, 1, 1,
0.5395589, 1.737627, -1.364153, 0.3803922, 0, 1, 1,
0.541387, -1.304623, 1.968853, 0.3843137, 0, 1, 1,
0.5460237, 0.3087366, 2.221222, 0.3921569, 0, 1, 1,
0.549199, -1.491531, 1.890469, 0.3960784, 0, 1, 1,
0.5515773, 1.510316, 0.3399421, 0.4039216, 0, 1, 1,
0.55589, 0.4807129, 1.441345, 0.4117647, 0, 1, 1,
0.5578383, 1.034225, -0.509127, 0.4156863, 0, 1, 1,
0.5596597, 0.4583309, -0.3907078, 0.4235294, 0, 1, 1,
0.5613067, -0.3625117, 0.8880638, 0.427451, 0, 1, 1,
0.5619659, -1.954048, 0.8073508, 0.4352941, 0, 1, 1,
0.5645108, 1.28501, 0.6977893, 0.4392157, 0, 1, 1,
0.5658231, 0.3083873, -0.5278203, 0.4470588, 0, 1, 1,
0.5663013, 0.1749263, 1.878358, 0.4509804, 0, 1, 1,
0.5705343, 0.2354423, 1.404507, 0.4588235, 0, 1, 1,
0.5712665, 0.3040205, 2.510266, 0.4627451, 0, 1, 1,
0.5829627, -0.5712375, 1.461616, 0.4705882, 0, 1, 1,
0.5866336, 0.6473343, 3.208371, 0.4745098, 0, 1, 1,
0.5896102, -0.6873316, 2.644909, 0.4823529, 0, 1, 1,
0.5917264, -0.1893553, 1.565593, 0.4862745, 0, 1, 1,
0.594869, -0.3799363, 1.3054, 0.4941176, 0, 1, 1,
0.5949975, 1.302343, 0.5506068, 0.5019608, 0, 1, 1,
0.5963258, -0.7549587, 2.811317, 0.5058824, 0, 1, 1,
0.5990435, -0.9016153, 2.516139, 0.5137255, 0, 1, 1,
0.5993673, -1.211296, 2.641833, 0.5176471, 0, 1, 1,
0.6042327, -0.6100638, 0.05687179, 0.5254902, 0, 1, 1,
0.6064819, 0.2639094, 0.6401469, 0.5294118, 0, 1, 1,
0.6098181, -0.8836808, 2.97352, 0.5372549, 0, 1, 1,
0.6131709, 0.2352543, 0.3126098, 0.5411765, 0, 1, 1,
0.6140604, -1.737403, 3.412403, 0.5490196, 0, 1, 1,
0.6167264, -1.899169, 2.516737, 0.5529412, 0, 1, 1,
0.6173212, 0.8455945, 1.759959, 0.5607843, 0, 1, 1,
0.6286017, -0.5430846, 2.437057, 0.5647059, 0, 1, 1,
0.6287069, -0.2606501, 1.04659, 0.572549, 0, 1, 1,
0.629722, -1.395452, 3.806781, 0.5764706, 0, 1, 1,
0.6329594, -0.3314914, 2.062824, 0.5843138, 0, 1, 1,
0.6336775, -0.2095072, 1.145628, 0.5882353, 0, 1, 1,
0.6355157, -0.4196099, 3.339864, 0.5960785, 0, 1, 1,
0.6395037, 0.2767254, 0.8949323, 0.6039216, 0, 1, 1,
0.6497154, 0.02457239, 1.480315, 0.6078432, 0, 1, 1,
0.6525838, 1.537002, 0.1004695, 0.6156863, 0, 1, 1,
0.6530655, 1.196212, -0.5782946, 0.6196079, 0, 1, 1,
0.6630434, -0.8610618, 1.243733, 0.627451, 0, 1, 1,
0.6661398, -1.941219, 2.123169, 0.6313726, 0, 1, 1,
0.6674849, -0.1253553, 3.619294, 0.6392157, 0, 1, 1,
0.6721103, -1.215199, 3.540326, 0.6431373, 0, 1, 1,
0.6774864, -0.01852087, 2.91938, 0.6509804, 0, 1, 1,
0.6778696, 1.205389, 0.9843323, 0.654902, 0, 1, 1,
0.6832774, -0.1405273, 1.43432, 0.6627451, 0, 1, 1,
0.6863103, 0.4814828, -1.094088, 0.6666667, 0, 1, 1,
0.6885741, 0.7322387, 0.01232173, 0.6745098, 0, 1, 1,
0.6895474, -0.1727249, -0.1550176, 0.6784314, 0, 1, 1,
0.6938695, 2.503552, 1.493735, 0.6862745, 0, 1, 1,
0.6964462, -0.3320395, 1.006171, 0.6901961, 0, 1, 1,
0.7014074, -0.9172734, 1.871549, 0.6980392, 0, 1, 1,
0.7017698, -0.2993275, 0.6467292, 0.7058824, 0, 1, 1,
0.7106269, -0.4401028, 1.036666, 0.7098039, 0, 1, 1,
0.7108181, -1.102825, 2.768961, 0.7176471, 0, 1, 1,
0.7117198, -0.2051037, 2.428408, 0.7215686, 0, 1, 1,
0.7284644, -1.205612, 2.720871, 0.7294118, 0, 1, 1,
0.73013, -0.4651695, 1.221403, 0.7333333, 0, 1, 1,
0.7319384, -0.2709762, 0.7880986, 0.7411765, 0, 1, 1,
0.7358746, -1.264431, 2.42393, 0.7450981, 0, 1, 1,
0.7415622, -0.9389336, 2.698987, 0.7529412, 0, 1, 1,
0.741846, -0.2733142, 1.042248, 0.7568628, 0, 1, 1,
0.7504342, -0.06415755, 2.451475, 0.7647059, 0, 1, 1,
0.7520737, 0.9581737, -0.3822866, 0.7686275, 0, 1, 1,
0.7542749, -0.9549173, 1.771998, 0.7764706, 0, 1, 1,
0.7543755, -0.867435, 3.125504, 0.7803922, 0, 1, 1,
0.7546675, 1.102097, -0.7243186, 0.7882353, 0, 1, 1,
0.7555792, 0.8619359, 0.7804641, 0.7921569, 0, 1, 1,
0.7614565, 0.9688256, -0.07342852, 0.8, 0, 1, 1,
0.7719247, -0.5412079, 2.504714, 0.8078431, 0, 1, 1,
0.7731738, 0.806246, -1.010208, 0.8117647, 0, 1, 1,
0.7754036, -0.235312, 3.561158, 0.8196079, 0, 1, 1,
0.7816043, -1.587016, 5.11719, 0.8235294, 0, 1, 1,
0.7847589, -0.22001, 2.623719, 0.8313726, 0, 1, 1,
0.7858292, 1.202258, -0.7965515, 0.8352941, 0, 1, 1,
0.7880453, -0.5805613, 0.8454157, 0.8431373, 0, 1, 1,
0.7881761, 0.1098859, 1.587384, 0.8470588, 0, 1, 1,
0.79623, 0.8482106, 2.348331, 0.854902, 0, 1, 1,
0.796404, -0.6682339, 2.556556, 0.8588235, 0, 1, 1,
0.8003877, 0.7442945, 2.135304, 0.8666667, 0, 1, 1,
0.8037177, 1.124074, 0.05261103, 0.8705882, 0, 1, 1,
0.8059887, 1.369466, 1.370197, 0.8784314, 0, 1, 1,
0.8120185, 0.3848617, 0.9272782, 0.8823529, 0, 1, 1,
0.815842, 0.2667767, 1.286952, 0.8901961, 0, 1, 1,
0.8205627, 1.373696, -0.2784986, 0.8941177, 0, 1, 1,
0.8213176, -0.2046839, 1.773874, 0.9019608, 0, 1, 1,
0.8257049, -2.045941, 1.85854, 0.9098039, 0, 1, 1,
0.8262998, 0.5575866, -0.1377135, 0.9137255, 0, 1, 1,
0.8323144, 0.9646777, -0.4817405, 0.9215686, 0, 1, 1,
0.8332481, 0.1914471, 2.355015, 0.9254902, 0, 1, 1,
0.8340693, 0.4046341, 2.02465, 0.9333333, 0, 1, 1,
0.8374702, 0.2633132, 0.8955488, 0.9372549, 0, 1, 1,
0.8377999, 0.1233921, 1.18309, 0.945098, 0, 1, 1,
0.8404872, -1.209315, 2.423034, 0.9490196, 0, 1, 1,
0.8424072, 0.9793884, 1.392536, 0.9568627, 0, 1, 1,
0.8434318, -0.1946, 1.067442, 0.9607843, 0, 1, 1,
0.8482445, -1.729861, 1.739998, 0.9686275, 0, 1, 1,
0.8510866, -0.6219265, 3.485691, 0.972549, 0, 1, 1,
0.8521144, 0.2914989, -0.1445896, 0.9803922, 0, 1, 1,
0.8655542, -0.6256402, 0.455829, 0.9843137, 0, 1, 1,
0.8710376, -1.523607, 4.261911, 0.9921569, 0, 1, 1,
0.8775322, -0.5970513, 1.142403, 0.9960784, 0, 1, 1,
0.8798217, -0.539991, 2.128982, 1, 0, 0.9960784, 1,
0.8799289, 0.2646, 1.197258, 1, 0, 0.9882353, 1,
0.8829293, 1.382158, 0.5499476, 1, 0, 0.9843137, 1,
0.8939799, -1.300105, 1.805912, 1, 0, 0.9764706, 1,
0.8973716, 0.2407397, 2.272409, 1, 0, 0.972549, 1,
0.8975638, -0.7357106, 2.582438, 1, 0, 0.9647059, 1,
0.9021839, 1.479646, 0.8008341, 1, 0, 0.9607843, 1,
0.9039522, 1.705477, -1.484888, 1, 0, 0.9529412, 1,
0.9055644, -0.4429417, 1.419934, 1, 0, 0.9490196, 1,
0.912859, 1.207815, 0.9062601, 1, 0, 0.9411765, 1,
0.9130361, 1.366846, 1.198122, 1, 0, 0.9372549, 1,
0.9134687, -0.6694528, 3.499618, 1, 0, 0.9294118, 1,
0.928142, -1.179223, 4.055349, 1, 0, 0.9254902, 1,
0.9295202, -0.4406677, 0.08429436, 1, 0, 0.9176471, 1,
0.9347486, 0.09290796, 0.1858614, 1, 0, 0.9137255, 1,
0.9372587, -0.7790423, 3.17781, 1, 0, 0.9058824, 1,
0.9382979, 1.612127, 0.2955672, 1, 0, 0.9019608, 1,
0.9477558, -1.119401, 1.618895, 1, 0, 0.8941177, 1,
0.965992, 0.8746333, -0.553433, 1, 0, 0.8862745, 1,
0.9757308, 1.407231, -0.497464, 1, 0, 0.8823529, 1,
0.9763548, -0.4152407, 1.070028, 1, 0, 0.8745098, 1,
0.9893043, 0.3583569, 0.4449999, 1, 0, 0.8705882, 1,
0.9956495, -1.165849, 1.345569, 1, 0, 0.8627451, 1,
0.9975562, 0.3297493, 2.2433, 1, 0, 0.8588235, 1,
1.000208, -1.65038, 1.55482, 1, 0, 0.8509804, 1,
1.002836, 0.5949942, 0.8846485, 1, 0, 0.8470588, 1,
1.012833, 0.667956, 0.8627799, 1, 0, 0.8392157, 1,
1.015979, 0.02451195, 1.411126, 1, 0, 0.8352941, 1,
1.021288, 0.707285, 1.63671, 1, 0, 0.827451, 1,
1.023917, -0.6764089, 2.210989, 1, 0, 0.8235294, 1,
1.02505, 1.363461, 0.7233815, 1, 0, 0.8156863, 1,
1.02581, 0.9252664, -0.3056404, 1, 0, 0.8117647, 1,
1.026183, -0.2744961, 2.311023, 1, 0, 0.8039216, 1,
1.028169, -0.7150218, 3.016333, 1, 0, 0.7960784, 1,
1.028173, 0.0349274, 1.236132, 1, 0, 0.7921569, 1,
1.03659, 0.5698829, 0.8567913, 1, 0, 0.7843137, 1,
1.041784, 2.502876, -0.7231967, 1, 0, 0.7803922, 1,
1.051845, 3.106662, -0.7045805, 1, 0, 0.772549, 1,
1.052474, 0.4385778, -0.3281546, 1, 0, 0.7686275, 1,
1.055372, 0.07581659, 3.724052, 1, 0, 0.7607843, 1,
1.056803, -0.9094032, 2.11459, 1, 0, 0.7568628, 1,
1.061981, -0.3032998, 1.188054, 1, 0, 0.7490196, 1,
1.068123, 0.5603881, 1.897395, 1, 0, 0.7450981, 1,
1.070195, -1.756035, 1.597158, 1, 0, 0.7372549, 1,
1.072892, -0.147977, 0.2355498, 1, 0, 0.7333333, 1,
1.073274, -0.2955997, 1.97891, 1, 0, 0.7254902, 1,
1.083666, -0.4845269, 2.029706, 1, 0, 0.7215686, 1,
1.096079, -1.610202, 1.735779, 1, 0, 0.7137255, 1,
1.098179, -0.3328948, 2.2917, 1, 0, 0.7098039, 1,
1.098259, -0.559278, 1.1535, 1, 0, 0.7019608, 1,
1.100652, -0.5718412, 2.130993, 1, 0, 0.6941177, 1,
1.121349, -0.1757016, 0.7591137, 1, 0, 0.6901961, 1,
1.123734, -2.164809, 2.284152, 1, 0, 0.682353, 1,
1.126156, -0.7562825, 2.149774, 1, 0, 0.6784314, 1,
1.133827, -0.9760906, 1.722118, 1, 0, 0.6705883, 1,
1.140051, -0.4487433, 1.953054, 1, 0, 0.6666667, 1,
1.141578, 0.1154073, 2.515532, 1, 0, 0.6588235, 1,
1.150048, 0.7347154, -0.005600627, 1, 0, 0.654902, 1,
1.150964, -0.3689397, 0.5341079, 1, 0, 0.6470588, 1,
1.151408, 0.05247537, 1.01357, 1, 0, 0.6431373, 1,
1.160076, -0.6880015, 3.260829, 1, 0, 0.6352941, 1,
1.161248, -0.1603444, 0.6144749, 1, 0, 0.6313726, 1,
1.171246, -1.16234, 3.651389, 1, 0, 0.6235294, 1,
1.171655, -0.2956987, 1.338585, 1, 0, 0.6196079, 1,
1.178707, -1.97467, 0.687065, 1, 0, 0.6117647, 1,
1.186692, 0.5755133, 1.460616, 1, 0, 0.6078432, 1,
1.192593, 0.4061837, 1.599676, 1, 0, 0.6, 1,
1.194363, -0.8038812, 0.5456576, 1, 0, 0.5921569, 1,
1.194993, -1.248051, 3.185794, 1, 0, 0.5882353, 1,
1.204742, -1.392263, 1.318587, 1, 0, 0.5803922, 1,
1.20498, 0.6781659, -0.350635, 1, 0, 0.5764706, 1,
1.212592, 0.3589484, 2.727806, 1, 0, 0.5686275, 1,
1.219375, 0.8565074, 2.157315, 1, 0, 0.5647059, 1,
1.22344, -1.079965, 3.155887, 1, 0, 0.5568628, 1,
1.224247, -0.6363772, 2.110103, 1, 0, 0.5529412, 1,
1.225067, -0.4283246, 1.772101, 1, 0, 0.5450981, 1,
1.240299, -1.186619, 1.66348, 1, 0, 0.5411765, 1,
1.241175, -0.1291142, 0.6298032, 1, 0, 0.5333334, 1,
1.250429, -0.1414867, 2.273062, 1, 0, 0.5294118, 1,
1.263696, 0.3619624, 0.3731066, 1, 0, 0.5215687, 1,
1.263968, 0.3328528, -1.490291, 1, 0, 0.5176471, 1,
1.265077, -2.117603, 3.079168, 1, 0, 0.509804, 1,
1.288122, -0.2873532, 0.6969693, 1, 0, 0.5058824, 1,
1.291934, 0.8922822, 2.836525, 1, 0, 0.4980392, 1,
1.292509, -1.01338, 2.039534, 1, 0, 0.4901961, 1,
1.300743, 0.6019832, -0.2098761, 1, 0, 0.4862745, 1,
1.312362, -1.066246, 1.616003, 1, 0, 0.4784314, 1,
1.316805, 0.5683783, 1.922684, 1, 0, 0.4745098, 1,
1.32191, -0.1254371, 0.01619089, 1, 0, 0.4666667, 1,
1.33631, 0.6966414, 1.746657, 1, 0, 0.4627451, 1,
1.337488, 0.3525177, 1.935706, 1, 0, 0.454902, 1,
1.339412, 0.8509744, 1.209867, 1, 0, 0.4509804, 1,
1.340988, -0.5870078, 2.09542, 1, 0, 0.4431373, 1,
1.360546, 0.5773799, 1.731701, 1, 0, 0.4392157, 1,
1.360809, -1.474597, 1.68322, 1, 0, 0.4313726, 1,
1.372529, 0.5047831, 1.244565, 1, 0, 0.427451, 1,
1.379747, -1.166819, 1.933557, 1, 0, 0.4196078, 1,
1.382751, 0.6156049, 1.056899, 1, 0, 0.4156863, 1,
1.386948, -0.6663244, 1.870586, 1, 0, 0.4078431, 1,
1.402873, -0.7253125, 1.380383, 1, 0, 0.4039216, 1,
1.409473, -0.8123313, 0.8214457, 1, 0, 0.3960784, 1,
1.444343, -1.616104, 3.525062, 1, 0, 0.3882353, 1,
1.494068, 0.9473668, 1.402047, 1, 0, 0.3843137, 1,
1.5166, -0.109909, 2.270294, 1, 0, 0.3764706, 1,
1.523494, -0.9595519, 2.447049, 1, 0, 0.372549, 1,
1.540916, 1.141482, 0.5382627, 1, 0, 0.3647059, 1,
1.555899, -0.9866903, 1.310463, 1, 0, 0.3607843, 1,
1.577577, 0.3460813, 0.6473004, 1, 0, 0.3529412, 1,
1.580925, 1.661025, 1.154114, 1, 0, 0.3490196, 1,
1.584789, -0.4122013, 1.681068, 1, 0, 0.3411765, 1,
1.595175, 0.5518744, 0.9272206, 1, 0, 0.3372549, 1,
1.633655, 0.415151, 0.9631618, 1, 0, 0.3294118, 1,
1.642089, -1.258769, 2.367435, 1, 0, 0.3254902, 1,
1.642833, 0.0734081, 1.894993, 1, 0, 0.3176471, 1,
1.644283, 0.9988415, -0.7410381, 1, 0, 0.3137255, 1,
1.645992, -0.5084228, 2.894754, 1, 0, 0.3058824, 1,
1.650912, -0.003222439, 2.754645, 1, 0, 0.2980392, 1,
1.659062, -0.4094548, 2.195518, 1, 0, 0.2941177, 1,
1.664219, -1.625769, 2.254029, 1, 0, 0.2862745, 1,
1.677909, -0.5908597, 2.798665, 1, 0, 0.282353, 1,
1.684719, -0.4247224, 1.221425, 1, 0, 0.2745098, 1,
1.694114, 1.010916, 2.590963, 1, 0, 0.2705882, 1,
1.699826, -0.2846138, 0.9030754, 1, 0, 0.2627451, 1,
1.710267, -1.343231, 2.108398, 1, 0, 0.2588235, 1,
1.7151, -0.04743274, 1.516055, 1, 0, 0.2509804, 1,
1.71577, 0.5236075, 0.3517317, 1, 0, 0.2470588, 1,
1.71611, 0.4323435, -0.7378381, 1, 0, 0.2392157, 1,
1.747256, -0.6745608, 3.924886, 1, 0, 0.2352941, 1,
1.747791, 1.409882, 0.4904533, 1, 0, 0.227451, 1,
1.752802, 0.4427447, 0.6353744, 1, 0, 0.2235294, 1,
1.760011, -1.17855, 2.594213, 1, 0, 0.2156863, 1,
1.762185, 0.1834759, 3.008061, 1, 0, 0.2117647, 1,
1.767639, -0.5419121, 1.523746, 1, 0, 0.2039216, 1,
1.778203, -0.9363908, 2.027926, 1, 0, 0.1960784, 1,
1.790327, -0.3566689, 0.1244525, 1, 0, 0.1921569, 1,
1.79335, 1.051599, -0.2974746, 1, 0, 0.1843137, 1,
1.794644, 0.3085078, 2.207921, 1, 0, 0.1803922, 1,
1.795301, -0.1952016, 0.5770706, 1, 0, 0.172549, 1,
1.798021, 0.9465144, 0.09236492, 1, 0, 0.1686275, 1,
1.805527, -0.9330204, 2.368107, 1, 0, 0.1607843, 1,
1.81473, -0.4449571, 2.088108, 1, 0, 0.1568628, 1,
1.826402, -0.4015961, 2.016324, 1, 0, 0.1490196, 1,
1.835342, 0.2796854, 1.835987, 1, 0, 0.145098, 1,
1.849319, -0.6088551, 2.336086, 1, 0, 0.1372549, 1,
1.854367, -1.792026, 2.136528, 1, 0, 0.1333333, 1,
1.861872, 0.2184511, 1.608908, 1, 0, 0.1254902, 1,
1.876349, -0.7075534, 3.872669, 1, 0, 0.1215686, 1,
1.877671, 0.7414989, 1.022195, 1, 0, 0.1137255, 1,
1.887089, 0.9130649, 0.3346184, 1, 0, 0.1098039, 1,
1.890872, -2.673767, 1.880932, 1, 0, 0.1019608, 1,
1.910258, 0.3613467, 2.179242, 1, 0, 0.09411765, 1,
1.911824, -0.4368972, 2.506225, 1, 0, 0.09019608, 1,
1.958802, 0.8103781, 1.193916, 1, 0, 0.08235294, 1,
1.963937, 0.3518843, 1.850868, 1, 0, 0.07843138, 1,
1.981453, -0.3813604, 1.775508, 1, 0, 0.07058824, 1,
2.020531, 1.887182, -0.3540105, 1, 0, 0.06666667, 1,
2.20624, 2.083167, 0.5209574, 1, 0, 0.05882353, 1,
2.208898, -0.6214317, 0.7526492, 1, 0, 0.05490196, 1,
2.245864, 0.0313396, 1.152384, 1, 0, 0.04705882, 1,
2.314473, 0.3278304, 0.7821663, 1, 0, 0.04313726, 1,
2.330768, 0.9506387, 0.7551492, 1, 0, 0.03529412, 1,
2.342639, 0.1111676, 2.47663, 1, 0, 0.03137255, 1,
2.369228, 0.2820441, 1.480056, 1, 0, 0.02352941, 1,
2.547306, 2.035338, 2.114929, 1, 0, 0.01960784, 1,
2.580436, 1.735895, 1.427412, 1, 0, 0.01176471, 1,
2.637754, 0.9929383, 0.2273293, 1, 0, 0.007843138, 1
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
0.06365967, -4.364894, -6.801332, 0, -0.5, 0.5, 0.5,
0.06365967, -4.364894, -6.801332, 1, -0.5, 0.5, 0.5,
0.06365967, -4.364894, -6.801332, 1, 1.5, 0.5, 0.5,
0.06365967, -4.364894, -6.801332, 0, 1.5, 0.5, 0.5
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
-3.383053, -0.07090747, -6.801332, 0, -0.5, 0.5, 0.5,
-3.383053, -0.07090747, -6.801332, 1, -0.5, 0.5, 0.5,
-3.383053, -0.07090747, -6.801332, 1, 1.5, 0.5, 0.5,
-3.383053, -0.07090747, -6.801332, 0, 1.5, 0.5, 0.5
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
-3.383053, -4.364894, 0.3003988, 0, -0.5, 0.5, 0.5,
-3.383053, -4.364894, 0.3003988, 1, -0.5, 0.5, 0.5,
-3.383053, -4.364894, 0.3003988, 1, 1.5, 0.5, 0.5,
-3.383053, -4.364894, 0.3003988, 0, 1.5, 0.5, 0.5
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
-2, -3.373974, -5.162471,
2, -3.373974, -5.162471,
-2, -3.373974, -5.162471,
-2, -3.539128, -5.435614,
-1, -3.373974, -5.162471,
-1, -3.539128, -5.435614,
0, -3.373974, -5.162471,
0, -3.539128, -5.435614,
1, -3.373974, -5.162471,
1, -3.539128, -5.435614,
2, -3.373974, -5.162471,
2, -3.539128, -5.435614
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
-2, -3.869434, -5.981901, 0, -0.5, 0.5, 0.5,
-2, -3.869434, -5.981901, 1, -0.5, 0.5, 0.5,
-2, -3.869434, -5.981901, 1, 1.5, 0.5, 0.5,
-2, -3.869434, -5.981901, 0, 1.5, 0.5, 0.5,
-1, -3.869434, -5.981901, 0, -0.5, 0.5, 0.5,
-1, -3.869434, -5.981901, 1, -0.5, 0.5, 0.5,
-1, -3.869434, -5.981901, 1, 1.5, 0.5, 0.5,
-1, -3.869434, -5.981901, 0, 1.5, 0.5, 0.5,
0, -3.869434, -5.981901, 0, -0.5, 0.5, 0.5,
0, -3.869434, -5.981901, 1, -0.5, 0.5, 0.5,
0, -3.869434, -5.981901, 1, 1.5, 0.5, 0.5,
0, -3.869434, -5.981901, 0, 1.5, 0.5, 0.5,
1, -3.869434, -5.981901, 0, -0.5, 0.5, 0.5,
1, -3.869434, -5.981901, 1, -0.5, 0.5, 0.5,
1, -3.869434, -5.981901, 1, 1.5, 0.5, 0.5,
1, -3.869434, -5.981901, 0, 1.5, 0.5, 0.5,
2, -3.869434, -5.981901, 0, -0.5, 0.5, 0.5,
2, -3.869434, -5.981901, 1, -0.5, 0.5, 0.5,
2, -3.869434, -5.981901, 1, 1.5, 0.5, 0.5,
2, -3.869434, -5.981901, 0, 1.5, 0.5, 0.5
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
-2.587658, -3, -5.162471,
-2.587658, 3, -5.162471,
-2.587658, -3, -5.162471,
-2.720224, -3, -5.435614,
-2.587658, -2, -5.162471,
-2.720224, -2, -5.435614,
-2.587658, -1, -5.162471,
-2.720224, -1, -5.435614,
-2.587658, 0, -5.162471,
-2.720224, 0, -5.435614,
-2.587658, 1, -5.162471,
-2.720224, 1, -5.435614,
-2.587658, 2, -5.162471,
-2.720224, 2, -5.435614,
-2.587658, 3, -5.162471,
-2.720224, 3, -5.435614
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
-2.985355, -3, -5.981901, 0, -0.5, 0.5, 0.5,
-2.985355, -3, -5.981901, 1, -0.5, 0.5, 0.5,
-2.985355, -3, -5.981901, 1, 1.5, 0.5, 0.5,
-2.985355, -3, -5.981901, 0, 1.5, 0.5, 0.5,
-2.985355, -2, -5.981901, 0, -0.5, 0.5, 0.5,
-2.985355, -2, -5.981901, 1, -0.5, 0.5, 0.5,
-2.985355, -2, -5.981901, 1, 1.5, 0.5, 0.5,
-2.985355, -2, -5.981901, 0, 1.5, 0.5, 0.5,
-2.985355, -1, -5.981901, 0, -0.5, 0.5, 0.5,
-2.985355, -1, -5.981901, 1, -0.5, 0.5, 0.5,
-2.985355, -1, -5.981901, 1, 1.5, 0.5, 0.5,
-2.985355, -1, -5.981901, 0, 1.5, 0.5, 0.5,
-2.985355, 0, -5.981901, 0, -0.5, 0.5, 0.5,
-2.985355, 0, -5.981901, 1, -0.5, 0.5, 0.5,
-2.985355, 0, -5.981901, 1, 1.5, 0.5, 0.5,
-2.985355, 0, -5.981901, 0, 1.5, 0.5, 0.5,
-2.985355, 1, -5.981901, 0, -0.5, 0.5, 0.5,
-2.985355, 1, -5.981901, 1, -0.5, 0.5, 0.5,
-2.985355, 1, -5.981901, 1, 1.5, 0.5, 0.5,
-2.985355, 1, -5.981901, 0, 1.5, 0.5, 0.5,
-2.985355, 2, -5.981901, 0, -0.5, 0.5, 0.5,
-2.985355, 2, -5.981901, 1, -0.5, 0.5, 0.5,
-2.985355, 2, -5.981901, 1, 1.5, 0.5, 0.5,
-2.985355, 2, -5.981901, 0, 1.5, 0.5, 0.5,
-2.985355, 3, -5.981901, 0, -0.5, 0.5, 0.5,
-2.985355, 3, -5.981901, 1, -0.5, 0.5, 0.5,
-2.985355, 3, -5.981901, 1, 1.5, 0.5, 0.5,
-2.985355, 3, -5.981901, 0, 1.5, 0.5, 0.5
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
-2.587658, -3.373974, -4,
-2.587658, -3.373974, 4,
-2.587658, -3.373974, -4,
-2.720224, -3.539128, -4,
-2.587658, -3.373974, -2,
-2.720224, -3.539128, -2,
-2.587658, -3.373974, 0,
-2.720224, -3.539128, 0,
-2.587658, -3.373974, 2,
-2.720224, -3.539128, 2,
-2.587658, -3.373974, 4,
-2.720224, -3.539128, 4
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
-2.985355, -3.869434, -4, 0, -0.5, 0.5, 0.5,
-2.985355, -3.869434, -4, 1, -0.5, 0.5, 0.5,
-2.985355, -3.869434, -4, 1, 1.5, 0.5, 0.5,
-2.985355, -3.869434, -4, 0, 1.5, 0.5, 0.5,
-2.985355, -3.869434, -2, 0, -0.5, 0.5, 0.5,
-2.985355, -3.869434, -2, 1, -0.5, 0.5, 0.5,
-2.985355, -3.869434, -2, 1, 1.5, 0.5, 0.5,
-2.985355, -3.869434, -2, 0, 1.5, 0.5, 0.5,
-2.985355, -3.869434, 0, 0, -0.5, 0.5, 0.5,
-2.985355, -3.869434, 0, 1, -0.5, 0.5, 0.5,
-2.985355, -3.869434, 0, 1, 1.5, 0.5, 0.5,
-2.985355, -3.869434, 0, 0, 1.5, 0.5, 0.5,
-2.985355, -3.869434, 2, 0, -0.5, 0.5, 0.5,
-2.985355, -3.869434, 2, 1, -0.5, 0.5, 0.5,
-2.985355, -3.869434, 2, 1, 1.5, 0.5, 0.5,
-2.985355, -3.869434, 2, 0, 1.5, 0.5, 0.5,
-2.985355, -3.869434, 4, 0, -0.5, 0.5, 0.5,
-2.985355, -3.869434, 4, 1, -0.5, 0.5, 0.5,
-2.985355, -3.869434, 4, 1, 1.5, 0.5, 0.5,
-2.985355, -3.869434, 4, 0, 1.5, 0.5, 0.5
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
-2.587658, -3.373974, -5.162471,
-2.587658, 3.232159, -5.162471,
-2.587658, -3.373974, 5.763268,
-2.587658, 3.232159, 5.763268,
-2.587658, -3.373974, -5.162471,
-2.587658, -3.373974, 5.763268,
-2.587658, 3.232159, -5.162471,
-2.587658, 3.232159, 5.763268,
-2.587658, -3.373974, -5.162471,
2.714977, -3.373974, -5.162471,
-2.587658, -3.373974, 5.763268,
2.714977, -3.373974, 5.763268,
-2.587658, 3.232159, -5.162471,
2.714977, 3.232159, -5.162471,
-2.587658, 3.232159, 5.763268,
2.714977, 3.232159, 5.763268,
2.714977, -3.373974, -5.162471,
2.714977, 3.232159, -5.162471,
2.714977, -3.373974, 5.763268,
2.714977, 3.232159, 5.763268,
2.714977, -3.373974, -5.162471,
2.714977, -3.373974, 5.763268,
2.714977, 3.232159, -5.162471,
2.714977, 3.232159, 5.763268
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
var radius = 7.382283;
var distance = 32.84461;
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
mvMatrix.translate( -0.06365967, 0.07090747, -0.3003988 );
mvMatrix.scale( 1.505265, 1.208251, 0.7305565 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.84461);
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
succinate<-read.table("succinate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-succinate$V2
```

```
## Error in eval(expr, envir, enclos): object 'succinate' not found
```

```r
y<-succinate$V3
```

```
## Error in eval(expr, envir, enclos): object 'succinate' not found
```

```r
z<-succinate$V4
```

```
## Error in eval(expr, envir, enclos): object 'succinate' not found
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
-2.510435, 0.371936, -2.193466, 0, 0, 1, 1, 1,
-2.393793, -0.174829, -2.614761, 1, 0, 0, 1, 1,
-2.387328, -0.7501377, -3.50114, 1, 0, 0, 1, 1,
-2.311947, 0.002046576, -1.433406, 1, 0, 0, 1, 1,
-2.309236, -0.002784879, -1.677176, 1, 0, 0, 1, 1,
-2.244253, 0.3341583, -1.426827, 1, 0, 0, 1, 1,
-2.225769, -0.08486462, -1.975142, 0, 0, 0, 1, 1,
-2.187765, -0.1678946, -0.5033492, 0, 0, 0, 1, 1,
-2.15021, 1.159466, -0.6883592, 0, 0, 0, 1, 1,
-2.136957, -0.8211025, -1.963003, 0, 0, 0, 1, 1,
-2.125614, 0.06794795, -0.6558774, 0, 0, 0, 1, 1,
-2.124725, 0.2803595, -1.026254, 0, 0, 0, 1, 1,
-2.088612, 0.6635798, -0.6436067, 0, 0, 0, 1, 1,
-2.085325, 0.7567517, -1.139422, 1, 1, 1, 1, 1,
-2.083875, 0.5003549, -2.233796, 1, 1, 1, 1, 1,
-2.066684, -1.309336, -1.959182, 1, 1, 1, 1, 1,
-2.038655, -2.044744, -1.825862, 1, 1, 1, 1, 1,
-2.026892, -0.4209521, -1.29864, 1, 1, 1, 1, 1,
-2.014527, 0.5194718, -1.911118, 1, 1, 1, 1, 1,
-1.970014, 0.9137775, -1.392561, 1, 1, 1, 1, 1,
-1.965899, -0.6708649, -2.395697, 1, 1, 1, 1, 1,
-1.945859, 0.6609668, 0.2111295, 1, 1, 1, 1, 1,
-1.935932, -0.07694611, -1.815525, 1, 1, 1, 1, 1,
-1.915496, 0.3507161, -0.6537759, 1, 1, 1, 1, 1,
-1.908549, 0.6128495, -1.11766, 1, 1, 1, 1, 1,
-1.905664, 0.2535421, -1.378408, 1, 1, 1, 1, 1,
-1.885042, -0.490348, -1.060758, 1, 1, 1, 1, 1,
-1.881755, 0.7094036, -0.2296043, 1, 1, 1, 1, 1,
-1.880275, -0.743356, -1.977717, 0, 0, 1, 1, 1,
-1.840848, -1.40123, -2.436173, 1, 0, 0, 1, 1,
-1.828475, -0.3533507, -2.337899, 1, 0, 0, 1, 1,
-1.825979, -0.3797891, -0.3997528, 1, 0, 0, 1, 1,
-1.823318, -0.004288452, -0.8621547, 1, 0, 0, 1, 1,
-1.820389, 0.5085822, -2.503348, 1, 0, 0, 1, 1,
-1.81466, -0.8549426, -4.350819, 0, 0, 0, 1, 1,
-1.809726, 0.8734069, -3.121958, 0, 0, 0, 1, 1,
-1.783486, 0.8761564, -1.80975, 0, 0, 0, 1, 1,
-1.779116, -0.003419181, -1.921486, 0, 0, 0, 1, 1,
-1.778192, 0.1600197, -1.626612, 0, 0, 0, 1, 1,
-1.777181, -1.229974, -1.312248, 0, 0, 0, 1, 1,
-1.764254, -0.4394355, -2.308921, 0, 0, 0, 1, 1,
-1.757241, -1.864951, -0.8731402, 1, 1, 1, 1, 1,
-1.754425, -1.182686, -4.065217, 1, 1, 1, 1, 1,
-1.732365, -1.372978, -1.736831, 1, 1, 1, 1, 1,
-1.730499, 0.1895046, 1.031663, 1, 1, 1, 1, 1,
-1.714565, -0.7008194, -3.053182, 1, 1, 1, 1, 1,
-1.710602, -0.9305118, -1.80175, 1, 1, 1, 1, 1,
-1.67837, -0.5291749, -1.980627, 1, 1, 1, 1, 1,
-1.652745, -0.5993623, -1.619404, 1, 1, 1, 1, 1,
-1.650607, -0.750964, -2.425997, 1, 1, 1, 1, 1,
-1.626077, -0.6134269, -2.263455, 1, 1, 1, 1, 1,
-1.61195, -1.066685, -3.363638, 1, 1, 1, 1, 1,
-1.603722, -0.1367016, -2.15675, 1, 1, 1, 1, 1,
-1.596346, 0.1651327, -2.600212, 1, 1, 1, 1, 1,
-1.592028, -1.481117, -0.30636, 1, 1, 1, 1, 1,
-1.58334, 1.935257, -0.9892159, 1, 1, 1, 1, 1,
-1.5659, -0.01788113, -1.750008, 0, 0, 1, 1, 1,
-1.557042, 1.525662, -1.707101, 1, 0, 0, 1, 1,
-1.556003, -2.051912, -2.001186, 1, 0, 0, 1, 1,
-1.551, -0.7570955, -1.590911, 1, 0, 0, 1, 1,
-1.545333, -1.284041, -1.608904, 1, 0, 0, 1, 1,
-1.541215, -0.7964633, -4.572916, 1, 0, 0, 1, 1,
-1.541044, 1.79156, 0.2004057, 0, 0, 0, 1, 1,
-1.536633, 0.654525, -1.33826, 0, 0, 0, 1, 1,
-1.535498, 1.22031, 0.03258713, 0, 0, 0, 1, 1,
-1.533548, 0.9076223, -0.105601, 0, 0, 0, 1, 1,
-1.515394, -0.7534524, -2.503855, 0, 0, 0, 1, 1,
-1.502679, -1.863312, -4.409978, 0, 0, 0, 1, 1,
-1.47751, 0.6270746, 0.08745536, 0, 0, 0, 1, 1,
-1.471087, 0.9684008, -4.20211, 1, 1, 1, 1, 1,
-1.458474, 0.910587, -0.2916147, 1, 1, 1, 1, 1,
-1.43858, -1.962753, -0.4000557, 1, 1, 1, 1, 1,
-1.422058, 1.67692, -1.736652, 1, 1, 1, 1, 1,
-1.413432, 1.841271, -0.6508839, 1, 1, 1, 1, 1,
-1.402842, 2.186809, -1.978314, 1, 1, 1, 1, 1,
-1.400789, -0.5265717, -0.8825263, 1, 1, 1, 1, 1,
-1.400234, -0.9716497, -0.5397186, 1, 1, 1, 1, 1,
-1.399061, -1.049162, -2.139607, 1, 1, 1, 1, 1,
-1.398014, -0.6355091, -0.6473382, 1, 1, 1, 1, 1,
-1.393064, 1.660405, 0.3581696, 1, 1, 1, 1, 1,
-1.392463, 1.063004, -1.892037, 1, 1, 1, 1, 1,
-1.352839, -0.7487771, -3.161071, 1, 1, 1, 1, 1,
-1.348878, -0.9482738, -2.82955, 1, 1, 1, 1, 1,
-1.313023, -1.268204, -1.001474, 1, 1, 1, 1, 1,
-1.306098, -0.3638508, -0.9117308, 0, 0, 1, 1, 1,
-1.304276, -0.8176097, -1.73341, 1, 0, 0, 1, 1,
-1.282735, -1.421612, -3.905742, 1, 0, 0, 1, 1,
-1.281353, -1.25134, -3.744953, 1, 0, 0, 1, 1,
-1.275231, 0.2149671, -0.7846165, 1, 0, 0, 1, 1,
-1.268744, 0.8013083, 0.1041868, 1, 0, 0, 1, 1,
-1.26718, -0.2125404, -2.593635, 0, 0, 0, 1, 1,
-1.266706, -2.032566, -3.441918, 0, 0, 0, 1, 1,
-1.266527, -1.447529, -3.555963, 0, 0, 0, 1, 1,
-1.265086, 0.7087703, 0.2695909, 0, 0, 0, 1, 1,
-1.265065, -0.3973279, 0.2927879, 0, 0, 0, 1, 1,
-1.250261, 1.137264, -0.8802066, 0, 0, 0, 1, 1,
-1.238284, 1.83467, -1.44429, 0, 0, 0, 1, 1,
-1.230943, 1.239609, -0.3328392, 1, 1, 1, 1, 1,
-1.224238, -1.318751, -1.832918, 1, 1, 1, 1, 1,
-1.214464, -0.5089871, -1.43427, 1, 1, 1, 1, 1,
-1.209607, -1.742833, -1.433976, 1, 1, 1, 1, 1,
-1.209537, -1.470144, -2.703139, 1, 1, 1, 1, 1,
-1.203933, -0.1243996, -2.14859, 1, 1, 1, 1, 1,
-1.202163, 0.07627378, -2.685764, 1, 1, 1, 1, 1,
-1.199397, 1.028464, 2.639612, 1, 1, 1, 1, 1,
-1.199214, -2.217087, -1.621585, 1, 1, 1, 1, 1,
-1.192564, -0.2102145, -3.100709, 1, 1, 1, 1, 1,
-1.185037, -0.7720122, -2.001994, 1, 1, 1, 1, 1,
-1.18066, -0.2916001, -0.6281574, 1, 1, 1, 1, 1,
-1.170631, -0.9401793, -0.3472744, 1, 1, 1, 1, 1,
-1.167732, -0.6865007, -2.008917, 1, 1, 1, 1, 1,
-1.166052, -2.034622, -4.174706, 1, 1, 1, 1, 1,
-1.165035, -0.1687849, -1.357884, 0, 0, 1, 1, 1,
-1.163169, -0.5445691, -2.072527, 1, 0, 0, 1, 1,
-1.155814, -0.2875335, -4.044603, 1, 0, 0, 1, 1,
-1.155581, -0.5931976, -1.026738, 1, 0, 0, 1, 1,
-1.15316, -0.4599064, -2.265434, 1, 0, 0, 1, 1,
-1.152814, 0.6756185, 0.4290949, 1, 0, 0, 1, 1,
-1.142486, 1.468786, 0.2614788, 0, 0, 0, 1, 1,
-1.142369, 0.03953189, -1.940992, 0, 0, 0, 1, 1,
-1.139688, -0.03736582, -3.042452, 0, 0, 0, 1, 1,
-1.136326, -1.247554, -1.920615, 0, 0, 0, 1, 1,
-1.132307, -1.452846, -0.6781647, 0, 0, 0, 1, 1,
-1.117762, -1.483129, -0.6638335, 0, 0, 0, 1, 1,
-1.108503, 1.125168, -2.824971, 0, 0, 0, 1, 1,
-1.108113, 0.7295541, 0.3220064, 1, 1, 1, 1, 1,
-1.099658, -0.07206401, -2.476273, 1, 1, 1, 1, 1,
-1.096007, 0.8440238, -2.105403, 1, 1, 1, 1, 1,
-1.092255, 0.431641, 0.09201172, 1, 1, 1, 1, 1,
-1.08984, -0.7943371, -2.064461, 1, 1, 1, 1, 1,
-1.089287, -0.9043564, -1.060996, 1, 1, 1, 1, 1,
-1.089052, 0.1609416, -0.6898755, 1, 1, 1, 1, 1,
-1.086909, -1.063448, -3.019779, 1, 1, 1, 1, 1,
-1.07642, -0.6715981, -2.674182, 1, 1, 1, 1, 1,
-1.074486, 1.063471, 0.435339, 1, 1, 1, 1, 1,
-1.072114, 0.6329536, -0.1099934, 1, 1, 1, 1, 1,
-1.068942, 1.399388, -0.6992667, 1, 1, 1, 1, 1,
-1.065347, 1.312889, 0.2720432, 1, 1, 1, 1, 1,
-1.057281, 0.401421, -0.4225993, 1, 1, 1, 1, 1,
-1.052758, 3.135953, -0.6634163, 1, 1, 1, 1, 1,
-1.033063, 0.8417842, -0.8308918, 0, 0, 1, 1, 1,
-1.029641, 0.8917078, -0.5664375, 1, 0, 0, 1, 1,
-1.028397, -1.123199, -2.369744, 1, 0, 0, 1, 1,
-1.027515, 1.012134, 0.02170916, 1, 0, 0, 1, 1,
-1.019129, 0.272129, -2.375356, 1, 0, 0, 1, 1,
-1.015054, -1.824197, -2.374716, 1, 0, 0, 1, 1,
-1.008977, 0.5589827, -0.777056, 0, 0, 0, 1, 1,
-1.007596, 1.391383, -0.1844077, 0, 0, 0, 1, 1,
-1.00517, 0.9025269, -2.784131, 0, 0, 0, 1, 1,
-1.000581, 0.9747987, -0.3313564, 0, 0, 0, 1, 1,
-0.9890601, -1.476733, -2.656359, 0, 0, 0, 1, 1,
-0.9824907, 0.07182349, -2.07998, 0, 0, 0, 1, 1,
-0.9824536, 0.07597327, -2.288671, 0, 0, 0, 1, 1,
-0.9796196, -1.254025, -2.224465, 1, 1, 1, 1, 1,
-0.9748743, -2.279958, -4.508082, 1, 1, 1, 1, 1,
-0.9736445, 0.5334433, -0.6703319, 1, 1, 1, 1, 1,
-0.9721605, -1.115633, -2.352407, 1, 1, 1, 1, 1,
-0.9671746, -1.166206, -1.423305, 1, 1, 1, 1, 1,
-0.9660475, -2.804502, -1.343722, 1, 1, 1, 1, 1,
-0.9654748, -0.07076748, -3.68128, 1, 1, 1, 1, 1,
-0.9616271, 2.710277, -0.09905393, 1, 1, 1, 1, 1,
-0.9607517, 0.5388559, 0.7731837, 1, 1, 1, 1, 1,
-0.9588662, 0.2961237, -0.7482337, 1, 1, 1, 1, 1,
-0.9572486, -0.2830532, -1.905338, 1, 1, 1, 1, 1,
-0.9552257, 0.01809839, -1.288999, 1, 1, 1, 1, 1,
-0.94946, 1.787508, 0.6652492, 1, 1, 1, 1, 1,
-0.9475524, -0.4034587, -0.6585308, 1, 1, 1, 1, 1,
-0.9441009, 0.9283866, -0.9757142, 1, 1, 1, 1, 1,
-0.9439365, -0.2910301, -0.9937955, 0, 0, 1, 1, 1,
-0.9284523, -1.719614, -1.377603, 1, 0, 0, 1, 1,
-0.9279095, -0.3851362, -3.059987, 1, 0, 0, 1, 1,
-0.9260983, 0.6960083, 0.1309685, 1, 0, 0, 1, 1,
-0.9256693, 0.5217878, -0.4323031, 1, 0, 0, 1, 1,
-0.9233895, 0.5047053, -0.3845567, 1, 0, 0, 1, 1,
-0.9180751, 0.08193301, -0.7133864, 0, 0, 0, 1, 1,
-0.9153736, 0.3764531, -0.7527791, 0, 0, 0, 1, 1,
-0.9135241, -1.002964, -2.952446, 0, 0, 0, 1, 1,
-0.9080271, 0.3519967, -0.2465951, 0, 0, 0, 1, 1,
-0.9014608, 0.206805, -0.9023329, 0, 0, 0, 1, 1,
-0.900651, 0.06882221, -1.825231, 0, 0, 0, 1, 1,
-0.8949906, -0.05060294, -3.216218, 0, 0, 0, 1, 1,
-0.8833653, -0.8846706, -1.717112, 1, 1, 1, 1, 1,
-0.8814244, -0.9403958, -1.610717, 1, 1, 1, 1, 1,
-0.8813354, -1.529653, -2.365531, 1, 1, 1, 1, 1,
-0.8776407, 0.5849642, -1.202443, 1, 1, 1, 1, 1,
-0.8755149, -0.6478921, -2.310576, 1, 1, 1, 1, 1,
-0.8754686, -1.046423, -0.6946213, 1, 1, 1, 1, 1,
-0.8753464, 1.128741, -0.8876329, 1, 1, 1, 1, 1,
-0.8718854, -0.2520443, -2.223171, 1, 1, 1, 1, 1,
-0.8705787, 0.580818, -0.2004009, 1, 1, 1, 1, 1,
-0.8662312, -0.4279979, -1.864117, 1, 1, 1, 1, 1,
-0.8660957, -1.939649, -3.241274, 1, 1, 1, 1, 1,
-0.8658739, -0.3406131, -3.163643, 1, 1, 1, 1, 1,
-0.8588777, -0.2258983, -2.232667, 1, 1, 1, 1, 1,
-0.84956, -0.09950433, -1.190909, 1, 1, 1, 1, 1,
-0.8487539, -0.1201819, -1.505274, 1, 1, 1, 1, 1,
-0.8448749, -0.1362806, -2.644891, 0, 0, 1, 1, 1,
-0.8405778, 0.5294119, -1.202342, 1, 0, 0, 1, 1,
-0.8385696, 0.01318963, -1.582863, 1, 0, 0, 1, 1,
-0.8370794, 0.6592566, -0.362206, 1, 0, 0, 1, 1,
-0.8349287, -0.07986964, -1.927227, 1, 0, 0, 1, 1,
-0.8327175, 2.361075, -0.04768174, 1, 0, 0, 1, 1,
-0.8261563, 1.261071, -0.2822015, 0, 0, 0, 1, 1,
-0.8229575, -0.8178285, -2.702976, 0, 0, 0, 1, 1,
-0.8193946, -1.771646, -2.015979, 0, 0, 0, 1, 1,
-0.8076901, -3.277768, -3.783027, 0, 0, 0, 1, 1,
-0.8025149, -0.873444, -0.9152944, 0, 0, 0, 1, 1,
-0.8014617, 0.4023246, -2.013915, 0, 0, 0, 1, 1,
-0.7960082, 0.9819434, -0.5474551, 0, 0, 0, 1, 1,
-0.7957922, 0.1314743, -1.410792, 1, 1, 1, 1, 1,
-0.7942826, -0.9451126, -2.179221, 1, 1, 1, 1, 1,
-0.7844074, 2.003102, -0.8211675, 1, 1, 1, 1, 1,
-0.7812699, -0.1650721, -3.371101, 1, 1, 1, 1, 1,
-0.7811095, -0.005023234, 0.1024049, 1, 1, 1, 1, 1,
-0.7809719, 0.4849006, -2.371029, 1, 1, 1, 1, 1,
-0.7796263, -0.4435142, -3.08665, 1, 1, 1, 1, 1,
-0.7758339, -1.653807, -2.99059, 1, 1, 1, 1, 1,
-0.7688213, -0.8564222, -3.601039, 1, 1, 1, 1, 1,
-0.7657609, 0.0499379, -1.554438, 1, 1, 1, 1, 1,
-0.7649075, -2.959294, -2.327208, 1, 1, 1, 1, 1,
-0.7630821, -1.185272, -2.002995, 1, 1, 1, 1, 1,
-0.7542796, -1.164801, -2.353183, 1, 1, 1, 1, 1,
-0.7536623, -0.8728247, -3.283481, 1, 1, 1, 1, 1,
-0.7485152, -1.413779, -2.661583, 1, 1, 1, 1, 1,
-0.7470255, -0.1622299, -3.079285, 0, 0, 1, 1, 1,
-0.744752, -0.1095985, -2.21038, 1, 0, 0, 1, 1,
-0.7437425, 1.343044, 0.4241156, 1, 0, 0, 1, 1,
-0.7430603, 1.028856, -0.1801272, 1, 0, 0, 1, 1,
-0.7416022, 0.1283665, -2.554382, 1, 0, 0, 1, 1,
-0.7401516, 1.940598, -0.7159662, 1, 0, 0, 1, 1,
-0.7311261, -0.6907318, -2.959242, 0, 0, 0, 1, 1,
-0.7244592, 1.996282, 0.09827499, 0, 0, 0, 1, 1,
-0.7239802, 0.2667249, -0.5491208, 0, 0, 0, 1, 1,
-0.7219768, 1.96561, 0.339354, 0, 0, 0, 1, 1,
-0.7219644, 0.8707899, 0.2016288, 0, 0, 0, 1, 1,
-0.7201191, -0.08482457, -1.006126, 0, 0, 0, 1, 1,
-0.7166716, 2.058807, 0.3654827, 0, 0, 0, 1, 1,
-0.7123362, -0.8330282, -1.241005, 1, 1, 1, 1, 1,
-0.7107179, -1.283782, -3.784085, 1, 1, 1, 1, 1,
-0.7103902, -2.193388, -3.87338, 1, 1, 1, 1, 1,
-0.7076414, -3.014128, -3.221098, 1, 1, 1, 1, 1,
-0.7034164, 0.8209181, -0.9694408, 1, 1, 1, 1, 1,
-0.6971275, 1.070567, 0.6114916, 1, 1, 1, 1, 1,
-0.6890221, -0.8103238, -0.4989454, 1, 1, 1, 1, 1,
-0.6863449, -1.098148, -2.812871, 1, 1, 1, 1, 1,
-0.6855505, -0.4916938, -2.046916, 1, 1, 1, 1, 1,
-0.6848894, 1.478579, -0.4134647, 1, 1, 1, 1, 1,
-0.6795371, -0.239064, -1.093564, 1, 1, 1, 1, 1,
-0.6717864, 0.5448627, -1.365975, 1, 1, 1, 1, 1,
-0.6699235, -1.180815, -4.701734, 1, 1, 1, 1, 1,
-0.6692805, 2.099314, -1.460307, 1, 1, 1, 1, 1,
-0.668793, 1.329305, -1.995827, 1, 1, 1, 1, 1,
-0.6572894, 1.513151, -2.012121, 0, 0, 1, 1, 1,
-0.6570289, 1.177411, -1.733096, 1, 0, 0, 1, 1,
-0.6558255, -0.6937459, -3.029256, 1, 0, 0, 1, 1,
-0.6539804, -0.1537006, 0.9142862, 1, 0, 0, 1, 1,
-0.6517745, 1.452914, 0.17235, 1, 0, 0, 1, 1,
-0.645452, -0.3005484, -3.257626, 1, 0, 0, 1, 1,
-0.6411831, 0.9503843, -0.6693375, 0, 0, 0, 1, 1,
-0.6392241, -1.567445, -2.488284, 0, 0, 0, 1, 1,
-0.6305063, 1.767483, -0.6697357, 0, 0, 0, 1, 1,
-0.6302909, -0.4171992, -2.955595, 0, 0, 0, 1, 1,
-0.6298915, 0.2525655, -0.9118802, 0, 0, 0, 1, 1,
-0.6279476, -0.5465242, -1.952112, 0, 0, 0, 1, 1,
-0.6259036, -0.3483025, -1.233238, 0, 0, 0, 1, 1,
-0.6255089, -1.254399, -1.729237, 1, 1, 1, 1, 1,
-0.6244192, 1.194657, -0.786761, 1, 1, 1, 1, 1,
-0.6204542, 1.151723, 0.6177864, 1, 1, 1, 1, 1,
-0.6203866, -0.2320366, -0.7736449, 1, 1, 1, 1, 1,
-0.6193636, 1.403977, -0.6091791, 1, 1, 1, 1, 1,
-0.6176399, 0.2526748, -1.550132, 1, 1, 1, 1, 1,
-0.6172122, 1.306957, -2.468282, 1, 1, 1, 1, 1,
-0.6160948, -0.5154894, -2.871834, 1, 1, 1, 1, 1,
-0.614675, -0.1669928, -2.775926, 1, 1, 1, 1, 1,
-0.6113552, -1.056765, -1.913204, 1, 1, 1, 1, 1,
-0.609963, -0.6749591, -3.076549, 1, 1, 1, 1, 1,
-0.6020266, -0.4961076, -1.636906, 1, 1, 1, 1, 1,
-0.6014483, -0.8848746, -2.305535, 1, 1, 1, 1, 1,
-0.5999647, 1.776687, -0.4340501, 1, 1, 1, 1, 1,
-0.5961696, 0.4744582, -0.7438383, 1, 1, 1, 1, 1,
-0.5960112, 2.308201, -2.42911, 0, 0, 1, 1, 1,
-0.5947808, -0.4455994, -1.128924, 1, 0, 0, 1, 1,
-0.5877206, -0.2552914, -0.9545599, 1, 0, 0, 1, 1,
-0.5876494, 1.396112, -3.135226, 1, 0, 0, 1, 1,
-0.5874979, -0.2632679, -0.8242643, 1, 0, 0, 1, 1,
-0.5869718, -1.162804, -0.8571492, 1, 0, 0, 1, 1,
-0.5857526, 0.6232236, 1.005513, 0, 0, 0, 1, 1,
-0.5851423, 0.3239733, -0.342867, 0, 0, 0, 1, 1,
-0.5840371, -0.3514258, -3.349245, 0, 0, 0, 1, 1,
-0.5829998, 0.5638137, -0.8282771, 0, 0, 0, 1, 1,
-0.582153, -0.1256553, -1.460015, 0, 0, 0, 1, 1,
-0.5749531, -0.4430607, -1.783053, 0, 0, 0, 1, 1,
-0.5711239, -0.1520254, -2.952792, 0, 0, 0, 1, 1,
-0.5623739, -0.1706122, -2.785438, 1, 1, 1, 1, 1,
-0.5617733, -0.7925948, -0.8273584, 1, 1, 1, 1, 1,
-0.5614532, -2.684302, -3.913754, 1, 1, 1, 1, 1,
-0.5588428, -0.52188, -3.263931, 1, 1, 1, 1, 1,
-0.5570066, -2.791881, -2.171292, 1, 1, 1, 1, 1,
-0.5524814, 1.083414, -0.4574084, 1, 1, 1, 1, 1,
-0.5488324, -0.7321187, -2.326801, 1, 1, 1, 1, 1,
-0.5474689, -0.1483726, -2.23953, 1, 1, 1, 1, 1,
-0.5412056, 1.473145, 1.31227, 1, 1, 1, 1, 1,
-0.5396332, -0.5394855, -3.627468, 1, 1, 1, 1, 1,
-0.5376041, -0.8104535, -3.692267, 1, 1, 1, 1, 1,
-0.5375506, -0.500716, -1.353798, 1, 1, 1, 1, 1,
-0.5374998, -0.3130161, -1.978685, 1, 1, 1, 1, 1,
-0.5368275, -0.09740122, -1.896822, 1, 1, 1, 1, 1,
-0.5331489, -1.071818, -1.693716, 1, 1, 1, 1, 1,
-0.5266884, -1.475471, -2.786542, 0, 0, 1, 1, 1,
-0.5253608, -0.5086894, -2.359019, 1, 0, 0, 1, 1,
-0.524035, 0.2069596, -0.8904643, 1, 0, 0, 1, 1,
-0.5213401, -0.2923569, -1.661009, 1, 0, 0, 1, 1,
-0.518145, -0.358455, -2.310787, 1, 0, 0, 1, 1,
-0.5149962, 0.6454515, 0.6846346, 1, 0, 0, 1, 1,
-0.5128681, -0.423956, -2.199537, 0, 0, 0, 1, 1,
-0.5119216, 0.5456652, 1.221147, 0, 0, 0, 1, 1,
-0.5102342, 1.520895, 0.2557824, 0, 0, 0, 1, 1,
-0.5086885, -1.277497, -0.5775782, 0, 0, 0, 1, 1,
-0.495028, -0.2792222, -2.369995, 0, 0, 0, 1, 1,
-0.493373, -0.1951121, -2.345814, 0, 0, 0, 1, 1,
-0.4892559, -0.475967, -2.465671, 0, 0, 0, 1, 1,
-0.4821788, -0.2637115, -2.150394, 1, 1, 1, 1, 1,
-0.477653, 0.1662717, -2.96505, 1, 1, 1, 1, 1,
-0.4731929, -0.3849447, -3.655686, 1, 1, 1, 1, 1,
-0.4681635, 0.2658499, -2.354154, 1, 1, 1, 1, 1,
-0.4609569, -0.9073272, -4.011164, 1, 1, 1, 1, 1,
-0.4609517, -0.2326808, -3.760486, 1, 1, 1, 1, 1,
-0.4590384, -0.926999, -2.465279, 1, 1, 1, 1, 1,
-0.4581884, -1.189399, -3.650213, 1, 1, 1, 1, 1,
-0.4566814, -0.479995, -2.930568, 1, 1, 1, 1, 1,
-0.4538186, -0.03219052, -2.02341, 1, 1, 1, 1, 1,
-0.4533207, -0.04671754, -1.821938, 1, 1, 1, 1, 1,
-0.4504982, -0.5815579, -3.23842, 1, 1, 1, 1, 1,
-0.4504712, -2.719481, -1.476056, 1, 1, 1, 1, 1,
-0.4498471, -1.117553, -2.632183, 1, 1, 1, 1, 1,
-0.4418092, 0.6154267, 0.5513533, 1, 1, 1, 1, 1,
-0.4281843, -0.8822529, -2.439481, 0, 0, 1, 1, 1,
-0.428156, 0.07059864, -3.004287, 1, 0, 0, 1, 1,
-0.4272854, -0.3811564, -1.397836, 1, 0, 0, 1, 1,
-0.4269278, -0.2727091, -1.732851, 1, 0, 0, 1, 1,
-0.4232764, -0.05406987, -2.332845, 1, 0, 0, 1, 1,
-0.4199378, 0.3200775, -0.05484091, 1, 0, 0, 1, 1,
-0.4166743, -0.7992322, -2.61522, 0, 0, 0, 1, 1,
-0.4159506, 0.3350157, -1.176351, 0, 0, 0, 1, 1,
-0.4143637, -1.073806, -0.1230978, 0, 0, 0, 1, 1,
-0.4100739, -1.001885, -1.489158, 0, 0, 0, 1, 1,
-0.4073115, 0.7211807, -0.6011565, 0, 0, 0, 1, 1,
-0.4058436, -0.4753112, -2.737466, 0, 0, 0, 1, 1,
-0.4050207, 0.0950829, -0.5441365, 0, 0, 0, 1, 1,
-0.4023289, 0.8700438, 0.7748999, 1, 1, 1, 1, 1,
-0.401583, -1.310121, -0.6478483, 1, 1, 1, 1, 1,
-0.4007591, -1.158054, -2.317676, 1, 1, 1, 1, 1,
-0.3945551, 0.6918685, -1.961161, 1, 1, 1, 1, 1,
-0.3923548, 1.113661, -0.9436645, 1, 1, 1, 1, 1,
-0.390458, -1.824678, -3.074858, 1, 1, 1, 1, 1,
-0.3865746, 1.155852, -0.7143204, 1, 1, 1, 1, 1,
-0.3848373, -0.8604196, -2.533346, 1, 1, 1, 1, 1,
-0.382446, -0.8603069, -1.450776, 1, 1, 1, 1, 1,
-0.3794125, 0.7919809, -1.276097, 1, 1, 1, 1, 1,
-0.3775799, 1.173261, -2.459319, 1, 1, 1, 1, 1,
-0.3727649, 0.6750937, -1.385483, 1, 1, 1, 1, 1,
-0.3695157, 0.3931832, -1.330744, 1, 1, 1, 1, 1,
-0.3653598, -0.08854099, -0.8209781, 1, 1, 1, 1, 1,
-0.3581686, -1.177772, -1.227851, 1, 1, 1, 1, 1,
-0.3572684, 0.3359824, -2.286066, 0, 0, 1, 1, 1,
-0.3533594, 1.529778, -0.623821, 1, 0, 0, 1, 1,
-0.3529862, 0.5610235, 0.03779998, 1, 0, 0, 1, 1,
-0.3528984, -0.1275881, -2.589854, 1, 0, 0, 1, 1,
-0.3520613, -0.8722481, -3.551611, 1, 0, 0, 1, 1,
-0.3474008, -1.72045, -2.787677, 1, 0, 0, 1, 1,
-0.3459378, 0.5668396, -0.6040888, 0, 0, 0, 1, 1,
-0.3433785, -0.06309095, -0.6932796, 0, 0, 0, 1, 1,
-0.3426243, 0.2770391, -1.369241, 0, 0, 0, 1, 1,
-0.3389933, -1.664338, -3.45514, 0, 0, 0, 1, 1,
-0.3325281, -0.3564155, -2.333664, 0, 0, 0, 1, 1,
-0.3310764, -0.7388611, -1.991103, 0, 0, 0, 1, 1,
-0.3254746, -0.08304414, -1.654951, 0, 0, 0, 1, 1,
-0.3225091, 1.101038, 1.014007, 1, 1, 1, 1, 1,
-0.3217199, -0.7796521, 0.3479615, 1, 1, 1, 1, 1,
-0.3207986, -0.7152605, -1.607516, 1, 1, 1, 1, 1,
-0.3193329, -0.02806462, -3.895977, 1, 1, 1, 1, 1,
-0.3188531, 1.256177, 0.3469086, 1, 1, 1, 1, 1,
-0.315872, -1.576507, -3.700143, 1, 1, 1, 1, 1,
-0.3156675, -1.202981, -2.443126, 1, 1, 1, 1, 1,
-0.3122836, 1.156005, 0.8700354, 1, 1, 1, 1, 1,
-0.3059396, -0.2913311, -2.414375, 1, 1, 1, 1, 1,
-0.3056779, 0.418976, -2.2757, 1, 1, 1, 1, 1,
-0.3035972, 0.285581, -0.4200836, 1, 1, 1, 1, 1,
-0.3023533, -1.116613, -3.505741, 1, 1, 1, 1, 1,
-0.302224, -0.3111408, -1.532698, 1, 1, 1, 1, 1,
-0.3016826, 1.877505, 0.0862541, 1, 1, 1, 1, 1,
-0.300716, 0.09626953, -1.936705, 1, 1, 1, 1, 1,
-0.2993199, 0.4381925, -0.6814312, 0, 0, 1, 1, 1,
-0.2985606, -0.8105553, -3.183494, 1, 0, 0, 1, 1,
-0.2985185, 0.5560802, -1.107992, 1, 0, 0, 1, 1,
-0.293536, 0.2141298, -1.715869, 1, 0, 0, 1, 1,
-0.2884655, 0.5287645, -2.032511, 1, 0, 0, 1, 1,
-0.2874942, 0.967884, -0.7464511, 1, 0, 0, 1, 1,
-0.2840733, -2.036141, -3.499834, 0, 0, 0, 1, 1,
-0.2807212, -0.09366143, -2.272819, 0, 0, 0, 1, 1,
-0.2795777, -2.043144, -4.404572, 0, 0, 0, 1, 1,
-0.2776578, 1.444785, 0.501147, 0, 0, 0, 1, 1,
-0.2721716, -0.8559484, -2.668102, 0, 0, 0, 1, 1,
-0.2672331, 0.6403654, 0.4850328, 0, 0, 0, 1, 1,
-0.264174, -0.55462, -0.8985543, 0, 0, 0, 1, 1,
-0.2582312, 0.2249053, -0.7438418, 1, 1, 1, 1, 1,
-0.2580329, -1.288829, -4.066989, 1, 1, 1, 1, 1,
-0.2578938, 0.5846099, -0.5609735, 1, 1, 1, 1, 1,
-0.25692, -0.4603226, -2.566396, 1, 1, 1, 1, 1,
-0.2519817, 0.00892549, -0.7064995, 1, 1, 1, 1, 1,
-0.2514683, 0.005496113, -0.003360265, 1, 1, 1, 1, 1,
-0.2512791, 1.269769, 0.3663456, 1, 1, 1, 1, 1,
-0.250211, -0.03108189, -1.565882, 1, 1, 1, 1, 1,
-0.2499665, 0.1915881, -0.5580803, 1, 1, 1, 1, 1,
-0.2446142, 0.1412035, -1.888742, 1, 1, 1, 1, 1,
-0.2301234, -1.723114, -4.562967, 1, 1, 1, 1, 1,
-0.2295148, 0.4112487, -1.884105, 1, 1, 1, 1, 1,
-0.2267248, 0.08758949, -0.8471817, 1, 1, 1, 1, 1,
-0.2254293, -0.1152458, -1.814633, 1, 1, 1, 1, 1,
-0.2245416, -0.6291692, -2.337124, 1, 1, 1, 1, 1,
-0.2215016, -0.1702907, -3.052232, 0, 0, 1, 1, 1,
-0.2171175, 0.5395323, -0.9159467, 1, 0, 0, 1, 1,
-0.2167431, -0.8952077, -3.007669, 1, 0, 0, 1, 1,
-0.2161376, 1.093652, -0.02705202, 1, 0, 0, 1, 1,
-0.2124556, 1.802611, -1.385426, 1, 0, 0, 1, 1,
-0.2079817, -0.5872366, -1.218017, 1, 0, 0, 1, 1,
-0.2079139, -0.9676574, -4.183711, 0, 0, 0, 1, 1,
-0.2046051, 0.8401598, -1.084502, 0, 0, 0, 1, 1,
-0.20035, 1.266558, -1.418653, 0, 0, 0, 1, 1,
-0.1959189, -0.004239607, -2.220245, 0, 0, 0, 1, 1,
-0.1938497, -1.831942, -2.675637, 0, 0, 0, 1, 1,
-0.1921477, -1.109029, -3.823914, 0, 0, 0, 1, 1,
-0.1880731, 0.347141, 0.04965787, 0, 0, 0, 1, 1,
-0.1870637, 0.3984796, -0.3103355, 1, 1, 1, 1, 1,
-0.1867023, -1.898198, -2.018368, 1, 1, 1, 1, 1,
-0.1840819, 0.7097141, 1.268001, 1, 1, 1, 1, 1,
-0.1826461, -1.09277, -1.734249, 1, 1, 1, 1, 1,
-0.1812446, -0.3649089, -1.98003, 1, 1, 1, 1, 1,
-0.1802071, 0.9591864, 0.4260391, 1, 1, 1, 1, 1,
-0.1788097, -0.2719049, -1.78773, 1, 1, 1, 1, 1,
-0.1776905, -0.8476959, -3.088033, 1, 1, 1, 1, 1,
-0.1702961, 0.4673899, -0.8541039, 1, 1, 1, 1, 1,
-0.1691221, 1.751517, -1.444807, 1, 1, 1, 1, 1,
-0.1660854, 0.7957472, -0.139453, 1, 1, 1, 1, 1,
-0.164959, -0.8605627, -2.179824, 1, 1, 1, 1, 1,
-0.16201, -0.2242954, -1.92015, 1, 1, 1, 1, 1,
-0.1608283, -0.7419938, -3.349497, 1, 1, 1, 1, 1,
-0.1563938, 0.4632659, 1.660836, 1, 1, 1, 1, 1,
-0.1558022, 0.6833113, -0.8876702, 0, 0, 1, 1, 1,
-0.155775, 1.289425, -0.6355283, 1, 0, 0, 1, 1,
-0.1533158, -0.6885337, -2.772953, 1, 0, 0, 1, 1,
-0.1513066, -0.9259202, -3.383645, 1, 0, 0, 1, 1,
-0.1430797, -0.7555773, -3.86583, 1, 0, 0, 1, 1,
-0.1418666, 0.7982814, -1.882853, 1, 0, 0, 1, 1,
-0.1376841, -0.2548079, -2.111754, 0, 0, 0, 1, 1,
-0.137463, -0.5625362, -1.453142, 0, 0, 0, 1, 1,
-0.1366241, -1.158668, -3.649758, 0, 0, 0, 1, 1,
-0.136464, -0.70913, -2.365703, 0, 0, 0, 1, 1,
-0.1331052, -0.7882314, -3.929402, 0, 0, 0, 1, 1,
-0.1322439, -1.356369, -2.681448, 0, 0, 0, 1, 1,
-0.1308413, -1.865654, -4.711424, 0, 0, 0, 1, 1,
-0.1242408, 0.2180106, 0.1010113, 1, 1, 1, 1, 1,
-0.1230127, -0.09545221, -1.288991, 1, 1, 1, 1, 1,
-0.11259, -0.5128818, -2.401304, 1, 1, 1, 1, 1,
-0.110591, 0.9950143, -1.174393, 1, 1, 1, 1, 1,
-0.1057052, 0.6470151, 1.247155, 1, 1, 1, 1, 1,
-0.1036254, -0.1396635, -1.418929, 1, 1, 1, 1, 1,
-0.1034318, -2.378018, -1.389358, 1, 1, 1, 1, 1,
-0.1034317, 2.632856, -1.212054, 1, 1, 1, 1, 1,
-0.09680205, -0.1409011, -3.351483, 1, 1, 1, 1, 1,
-0.09624469, 0.3280326, 0.3498383, 1, 1, 1, 1, 1,
-0.09103254, 0.6329397, -0.8600361, 1, 1, 1, 1, 1,
-0.08742758, 0.8958349, -0.4952818, 1, 1, 1, 1, 1,
-0.08705309, 2.277382, -0.5564576, 1, 1, 1, 1, 1,
-0.0869078, -0.9334878, -3.370436, 1, 1, 1, 1, 1,
-0.08615417, 1.24741, 0.2544535, 1, 1, 1, 1, 1,
-0.08487076, 0.1675782, -0.2773823, 0, 0, 1, 1, 1,
-0.08178027, -0.9752278, -2.322471, 1, 0, 0, 1, 1,
-0.08072039, -0.233297, -4.636187, 1, 0, 0, 1, 1,
-0.0701909, 1.236706, 1.61963, 1, 0, 0, 1, 1,
-0.0645164, -2.28097, -2.376011, 1, 0, 0, 1, 1,
-0.06271137, 0.1562264, -1.155539, 1, 0, 0, 1, 1,
-0.06141969, 2.727236, -0.97898, 0, 0, 0, 1, 1,
-0.06025449, -0.7810216, -2.01144, 0, 0, 0, 1, 1,
-0.05887403, 1.419704, -0.212484, 0, 0, 0, 1, 1,
-0.05634521, 0.8967221, -1.10465, 0, 0, 0, 1, 1,
-0.05571223, -1.035682, -2.822687, 0, 0, 0, 1, 1,
-0.05479497, 0.3506438, -1.718535, 0, 0, 0, 1, 1,
-0.04926189, 0.3029727, 0.2816859, 0, 0, 0, 1, 1,
-0.03875125, -0.7225947, -4.109038, 1, 1, 1, 1, 1,
-0.0361075, 0.106034, -0.2774627, 1, 1, 1, 1, 1,
-0.03587003, 1.236117, 0.1734146, 1, 1, 1, 1, 1,
-0.03316173, -0.9005428, -5.003358, 1, 1, 1, 1, 1,
-0.03238604, -0.2096459, -3.988799, 1, 1, 1, 1, 1,
-0.03035156, -0.2803371, -1.2758, 1, 1, 1, 1, 1,
-0.03033017, 0.8450292, -0.2876269, 1, 1, 1, 1, 1,
-0.02576935, 2.050448, -1.008912, 1, 1, 1, 1, 1,
-0.02538129, -1.694271, -3.953019, 1, 1, 1, 1, 1,
-0.0251909, -1.629709, -2.438622, 1, 1, 1, 1, 1,
-0.02484702, 1.340285, -1.431699, 1, 1, 1, 1, 1,
-0.02482359, -0.3990643, -3.847926, 1, 1, 1, 1, 1,
-0.02222855, -1.188913, -2.537049, 1, 1, 1, 1, 1,
-0.02197832, 0.9841881, -0.2456485, 1, 1, 1, 1, 1,
-0.01951831, 0.3655683, -0.1748493, 1, 1, 1, 1, 1,
-0.0190811, -0.1158802, -3.627144, 0, 0, 1, 1, 1,
-0.01876944, -1.597705, -3.71392, 1, 0, 0, 1, 1,
-0.01861905, 0.3966695, -0.7800261, 1, 0, 0, 1, 1,
-0.01661877, -0.1589728, -3.211122, 1, 0, 0, 1, 1,
-0.01514752, -0.3945539, -2.414697, 1, 0, 0, 1, 1,
-0.006631448, 0.7443584, -0.06783511, 1, 0, 0, 1, 1,
-0.005814768, 1.318883, -0.1444079, 0, 0, 0, 1, 1,
-0.005217358, -0.1009173, -3.741725, 0, 0, 0, 1, 1,
-0.001953163, -0.1657711, -3.436361, 0, 0, 0, 1, 1,
0.009069679, -0.3269441, 4.477681, 0, 0, 0, 1, 1,
0.01047739, -2.938457, 3.294639, 0, 0, 0, 1, 1,
0.01063345, -1.223013, 4.108823, 0, 0, 0, 1, 1,
0.01782664, -0.6964815, 1.874396, 0, 0, 0, 1, 1,
0.01975637, 1.186886, -0.5603037, 1, 1, 1, 1, 1,
0.02388927, 0.5134909, -1.012775, 1, 1, 1, 1, 1,
0.03171374, -0.9912348, 2.703778, 1, 1, 1, 1, 1,
0.03381028, 0.9939289, 1.677729, 1, 1, 1, 1, 1,
0.03426836, 0.1059262, 0.1080292, 1, 1, 1, 1, 1,
0.03463998, -0.08096219, 4.427025, 1, 1, 1, 1, 1,
0.03512894, 0.1512007, 1.570717, 1, 1, 1, 1, 1,
0.03555994, -0.3722773, 4.654536, 1, 1, 1, 1, 1,
0.03884511, 1.367994, 1.444466, 1, 1, 1, 1, 1,
0.04364074, -0.5074489, 3.186902, 1, 1, 1, 1, 1,
0.04502679, 0.07972005, -0.122627, 1, 1, 1, 1, 1,
0.05026934, 1.220539, -0.6204821, 1, 1, 1, 1, 1,
0.05104954, -0.09095871, 2.705802, 1, 1, 1, 1, 1,
0.05110402, -0.5522613, 1.866983, 1, 1, 1, 1, 1,
0.05202752, 0.2072701, -0.3741624, 1, 1, 1, 1, 1,
0.05329058, 0.1522318, 0.2269905, 0, 0, 1, 1, 1,
0.0707247, 1.531298, 0.0824661, 1, 0, 0, 1, 1,
0.07219848, 1.237926, 1.344816, 1, 0, 0, 1, 1,
0.07391721, -0.641481, 1.955908, 1, 0, 0, 1, 1,
0.07482763, 0.6502317, 0.7073523, 1, 0, 0, 1, 1,
0.07555099, -0.7527336, 4.117572, 1, 0, 0, 1, 1,
0.07641783, -1.337224, 2.729139, 0, 0, 0, 1, 1,
0.07976545, -0.776304, 2.014435, 0, 0, 0, 1, 1,
0.08074684, -1.938665, 3.117057, 0, 0, 0, 1, 1,
0.08564286, -1.090419, 3.460437, 0, 0, 0, 1, 1,
0.08574543, 1.338272, 0.1807293, 0, 0, 0, 1, 1,
0.08620242, -1.550922, 4.039448, 0, 0, 0, 1, 1,
0.0873387, 0.5094196, -1.871872, 0, 0, 0, 1, 1,
0.0879741, -1.510427, 2.192383, 1, 1, 1, 1, 1,
0.09354198, -0.4223672, 3.230314, 1, 1, 1, 1, 1,
0.09392993, -0.5622945, 3.710197, 1, 1, 1, 1, 1,
0.0948483, -1.401214, 2.001419, 1, 1, 1, 1, 1,
0.09642572, -0.1052746, 3.376455, 1, 1, 1, 1, 1,
0.106826, 1.839215, 0.4161187, 1, 1, 1, 1, 1,
0.1075844, -0.2332016, 3.046816, 1, 1, 1, 1, 1,
0.1088273, 0.5171227, 0.3619887, 1, 1, 1, 1, 1,
0.111566, 0.7071483, 0.7355429, 1, 1, 1, 1, 1,
0.1153333, -0.447062, 3.258892, 1, 1, 1, 1, 1,
0.1191386, -1.216147, 1.998235, 1, 1, 1, 1, 1,
0.1220942, -0.03377667, 2.024933, 1, 1, 1, 1, 1,
0.1238686, 0.5123575, 0.9717248, 1, 1, 1, 1, 1,
0.1263267, 1.902224, -0.4629138, 1, 1, 1, 1, 1,
0.132096, -0.2784679, 2.752162, 1, 1, 1, 1, 1,
0.1332615, -0.8876891, 4.120067, 0, 0, 1, 1, 1,
0.1369748, -0.1812424, 2.696968, 1, 0, 0, 1, 1,
0.1375896, -1.13527, 3.402069, 1, 0, 0, 1, 1,
0.1394106, -0.4219547, 3.824742, 1, 0, 0, 1, 1,
0.1554343, -0.704459, 2.769061, 1, 0, 0, 1, 1,
0.1607662, -1.635908, 3.751403, 1, 0, 0, 1, 1,
0.1621242, -0.2349511, 1.514315, 0, 0, 0, 1, 1,
0.1652014, -2.412016, 4.198877, 0, 0, 0, 1, 1,
0.1667735, 1.272901, 0.2462126, 0, 0, 0, 1, 1,
0.1709755, -0.3876765, 2.646828, 0, 0, 0, 1, 1,
0.1768475, -0.406751, 0.3403208, 0, 0, 0, 1, 1,
0.1776578, -1.646949, 3.616893, 0, 0, 0, 1, 1,
0.1793545, -1.549974, 3.780933, 0, 0, 0, 1, 1,
0.1810607, 2.27314, 1.439277, 1, 1, 1, 1, 1,
0.1811559, -0.9237756, 4.462261, 1, 1, 1, 1, 1,
0.1829648, -0.1809239, 1.175054, 1, 1, 1, 1, 1,
0.1836119, 0.2306871, -0.2114785, 1, 1, 1, 1, 1,
0.1846057, 1.952412, 0.3545277, 1, 1, 1, 1, 1,
0.1869947, -1.250772, 2.858506, 1, 1, 1, 1, 1,
0.1878466, 0.4380967, 1.443204, 1, 1, 1, 1, 1,
0.1930064, -1.319234, 4.242037, 1, 1, 1, 1, 1,
0.1937955, -0.5695975, 4.250247, 1, 1, 1, 1, 1,
0.195273, 0.1883995, 1.823017, 1, 1, 1, 1, 1,
0.1972722, 0.0698716, 0.4539889, 1, 1, 1, 1, 1,
0.198091, 1.394987, 0.009029469, 1, 1, 1, 1, 1,
0.2000483, -1.102557, 2.093732, 1, 1, 1, 1, 1,
0.2006699, -0.4726751, 4.034091, 1, 1, 1, 1, 1,
0.2034179, -1.010339, -0.01698246, 1, 1, 1, 1, 1,
0.2052427, 0.2304395, 1.436573, 0, 0, 1, 1, 1,
0.2054489, -0.9113652, 3.434956, 1, 0, 0, 1, 1,
0.2062609, -0.657988, 3.185201, 1, 0, 0, 1, 1,
0.2067481, -0.9590885, 2.489013, 1, 0, 0, 1, 1,
0.2096558, -0.5375824, 2.72079, 1, 0, 0, 1, 1,
0.2149657, -0.7003827, 1.952372, 1, 0, 0, 1, 1,
0.2158398, -0.1001008, 1.662997, 0, 0, 0, 1, 1,
0.2228565, -0.9718967, 3.718043, 0, 0, 0, 1, 1,
0.2347641, -1.536461, 1.939664, 0, 0, 0, 1, 1,
0.2351527, 0.2933288, 1.118635, 0, 0, 0, 1, 1,
0.2368218, 0.2447668, -0.8659258, 0, 0, 0, 1, 1,
0.2372758, 1.110103, 0.8667535, 0, 0, 0, 1, 1,
0.2390762, 0.284335, 1.145989, 0, 0, 0, 1, 1,
0.2422643, -2.081062, 3.690127, 1, 1, 1, 1, 1,
0.2445334, 0.7734636, 0.9296138, 1, 1, 1, 1, 1,
0.2446302, -0.04349436, 2.742773, 1, 1, 1, 1, 1,
0.2448607, -1.177222, 2.430555, 1, 1, 1, 1, 1,
0.2452603, 1.090888, 0.9890571, 1, 1, 1, 1, 1,
0.2498063, 0.436336, 0.9368149, 1, 1, 1, 1, 1,
0.2501236, 2.08376, 0.147967, 1, 1, 1, 1, 1,
0.2503769, 0.9089549, 1.049232, 1, 1, 1, 1, 1,
0.2519896, 0.6600813, 0.7873529, 1, 1, 1, 1, 1,
0.254544, 0.0433823, 2.529706, 1, 1, 1, 1, 1,
0.2552681, -0.4101722, 2.492104, 1, 1, 1, 1, 1,
0.2593224, 0.5209851, 1.462556, 1, 1, 1, 1, 1,
0.2597782, 0.7482084, 0.13281, 1, 1, 1, 1, 1,
0.261292, 1.503269, -1.568116, 1, 1, 1, 1, 1,
0.2645085, 0.2680019, -0.01736809, 1, 1, 1, 1, 1,
0.2654459, 0.2273797, 0.441748, 0, 0, 1, 1, 1,
0.2665781, -1.054289, 3.415179, 1, 0, 0, 1, 1,
0.2675598, 0.2219733, 0.2379777, 1, 0, 0, 1, 1,
0.2702429, -0.0339698, 1.128368, 1, 0, 0, 1, 1,
0.2720112, 0.973178, -0.6953307, 1, 0, 0, 1, 1,
0.2736725, -0.02801121, 1.647693, 1, 0, 0, 1, 1,
0.274823, 0.434521, -0.01740042, 0, 0, 0, 1, 1,
0.2757083, -0.1675992, 1.555795, 0, 0, 0, 1, 1,
0.27737, 0.4934328, 0.006073204, 0, 0, 0, 1, 1,
0.2853094, 0.417904, 1.487515, 0, 0, 0, 1, 1,
0.289562, -0.7305495, 3.752252, 0, 0, 0, 1, 1,
0.28995, 1.481614, 0.6624709, 0, 0, 0, 1, 1,
0.2970185, -1.737497, 3.695209, 0, 0, 0, 1, 1,
0.2979912, 0.2266091, 1.249542, 1, 1, 1, 1, 1,
0.2998907, 0.7162648, -0.117192, 1, 1, 1, 1, 1,
0.2999727, 0.02980351, 3.336443, 1, 1, 1, 1, 1,
0.3000257, 0.3114378, 1.552562, 1, 1, 1, 1, 1,
0.3049452, -0.0006266707, 0.8938966, 1, 1, 1, 1, 1,
0.3071782, 0.5355251, 0.2232494, 1, 1, 1, 1, 1,
0.3090283, 0.2938157, 1.164463, 1, 1, 1, 1, 1,
0.3161724, 1.046756, -0.5671783, 1, 1, 1, 1, 1,
0.3165182, -0.7323722, 3.634264, 1, 1, 1, 1, 1,
0.3202929, 0.7007464, 0.542843, 1, 1, 1, 1, 1,
0.3244479, 0.4661595, -0.2277635, 1, 1, 1, 1, 1,
0.3260369, -0.6188052, 2.164948, 1, 1, 1, 1, 1,
0.3284099, -1.814831, 3.030733, 1, 1, 1, 1, 1,
0.3297433, 0.5678194, 0.2127906, 1, 1, 1, 1, 1,
0.3322739, -1.505622, 1.868639, 1, 1, 1, 1, 1,
0.3325143, 1.027993, -0.4464877, 0, 0, 1, 1, 1,
0.3333295, -0.7513752, 3.666221, 1, 0, 0, 1, 1,
0.3336865, -1.104111, 3.000568, 1, 0, 0, 1, 1,
0.3367799, -0.804985, 4.482927, 1, 0, 0, 1, 1,
0.3372883, 0.2635134, 3.208958, 1, 0, 0, 1, 1,
0.3381492, -0.6843088, 3.251982, 1, 0, 0, 1, 1,
0.3390428, 0.2499005, -1.333894, 0, 0, 0, 1, 1,
0.339136, -2.349418, 2.47769, 0, 0, 0, 1, 1,
0.3396425, -2.365222, 1.962341, 0, 0, 0, 1, 1,
0.3422282, 0.2781937, 1.196207, 0, 0, 0, 1, 1,
0.348185, -0.1471335, 2.79486, 0, 0, 0, 1, 1,
0.348681, -0.4771695, 4.241516, 0, 0, 0, 1, 1,
0.3493146, -0.1140768, 1.1337, 0, 0, 0, 1, 1,
0.3567818, -0.01955003, 1.910669, 1, 1, 1, 1, 1,
0.3569859, 0.6015723, 0.03737706, 1, 1, 1, 1, 1,
0.358678, 0.5719652, 0.7910064, 1, 1, 1, 1, 1,
0.3592441, 0.9344242, 0.6650275, 1, 1, 1, 1, 1,
0.3616833, 0.08303215, 1.830555, 1, 1, 1, 1, 1,
0.3631844, -1.690356, 2.93739, 1, 1, 1, 1, 1,
0.3674797, -0.919026, 3.972384, 1, 1, 1, 1, 1,
0.371496, -0.3438808, 4.080327, 1, 1, 1, 1, 1,
0.3738842, 0.0198341, 2.9611, 1, 1, 1, 1, 1,
0.3791445, 1.250003, 0.5163555, 1, 1, 1, 1, 1,
0.379481, 0.5818559, 0.5108512, 1, 1, 1, 1, 1,
0.3806674, 1.512714, -0.5036436, 1, 1, 1, 1, 1,
0.3807389, 1.582802, -0.0191239, 1, 1, 1, 1, 1,
0.3835412, 1.624522, -0.1555661, 1, 1, 1, 1, 1,
0.3882194, 0.5288733, -0.4987258, 1, 1, 1, 1, 1,
0.3882228, 0.9339347, 0.2190234, 0, 0, 1, 1, 1,
0.391115, 0.6911308, 0.02837458, 1, 0, 0, 1, 1,
0.394388, -0.7056816, 4.402212, 1, 0, 0, 1, 1,
0.3952498, 0.6792695, 2.319464, 1, 0, 0, 1, 1,
0.395497, 1.487069, -0.752843, 1, 0, 0, 1, 1,
0.3973305, -0.04420979, 0.8664949, 1, 0, 0, 1, 1,
0.4056725, -1.587025, 3.79135, 0, 0, 0, 1, 1,
0.4093128, -1.231848, 2.545387, 0, 0, 0, 1, 1,
0.4094125, -0.1115496, 1.911441, 0, 0, 0, 1, 1,
0.4105045, 1.423215, 0.1668, 0, 0, 0, 1, 1,
0.4190766, -0.127836, 2.464288, 0, 0, 0, 1, 1,
0.4272635, -0.4014195, 2.539289, 0, 0, 0, 1, 1,
0.4274985, -0.1368909, 1.580514, 0, 0, 0, 1, 1,
0.4290878, -0.4154257, 2.081407, 1, 1, 1, 1, 1,
0.430442, -1.098056, 1.601944, 1, 1, 1, 1, 1,
0.436747, -1.677136, 1.770537, 1, 1, 1, 1, 1,
0.4391622, -0.7111351, 1.670756, 1, 1, 1, 1, 1,
0.44254, 1.134747, -0.1200839, 1, 1, 1, 1, 1,
0.4485912, -0.8493223, 3.330266, 1, 1, 1, 1, 1,
0.4498167, -0.7173464, 2.654931, 1, 1, 1, 1, 1,
0.4540531, -0.9748239, 5.604156, 1, 1, 1, 1, 1,
0.454665, -0.4625419, 3.901341, 1, 1, 1, 1, 1,
0.4591228, -0.2957586, 1.547693, 1, 1, 1, 1, 1,
0.4595037, 0.5251604, 0.6417726, 1, 1, 1, 1, 1,
0.4602961, 1.12282, -0.8905763, 1, 1, 1, 1, 1,
0.4629414, -0.004816466, 0.706237, 1, 1, 1, 1, 1,
0.4646185, -0.2596455, 1.463618, 1, 1, 1, 1, 1,
0.4690176, -0.6839952, 3.323492, 1, 1, 1, 1, 1,
0.4702679, 1.195457, 0.6881122, 0, 0, 1, 1, 1,
0.4707143, -0.07961292, 3.278645, 1, 0, 0, 1, 1,
0.4722107, 1.301744, -0.1697195, 1, 0, 0, 1, 1,
0.4723149, 1.061753, -1.855424, 1, 0, 0, 1, 1,
0.4738299, 0.3791006, -0.1006115, 1, 0, 0, 1, 1,
0.4775687, -0.6495787, 2.163217, 1, 0, 0, 1, 1,
0.4813893, -2.055142, 4.539347, 0, 0, 0, 1, 1,
0.4832571, 0.8279732, 1.514791, 0, 0, 0, 1, 1,
0.4835458, -1.267578, 3.26047, 0, 0, 0, 1, 1,
0.4844928, -0.1869997, 2.053961, 0, 0, 0, 1, 1,
0.4871791, 0.03589162, 0.7196696, 0, 0, 0, 1, 1,
0.4884751, -1.194963, 0.6782367, 0, 0, 0, 1, 1,
0.4964598, -0.2088628, 0.7680637, 0, 0, 0, 1, 1,
0.4974729, 0.2273445, -0.5451804, 1, 1, 1, 1, 1,
0.4999849, 1.308743, 2.02855, 1, 1, 1, 1, 1,
0.5064117, -1.567924, 2.567175, 1, 1, 1, 1, 1,
0.5069783, 1.700222, 0.4973755, 1, 1, 1, 1, 1,
0.5102403, -2.301601, 3.199093, 1, 1, 1, 1, 1,
0.5107011, 0.6526, 0.6506614, 1, 1, 1, 1, 1,
0.5148655, 0.3889486, 1.952881, 1, 1, 1, 1, 1,
0.5150183, 1.333367, 0.9685655, 1, 1, 1, 1, 1,
0.5181125, -0.6706364, 1.290551, 1, 1, 1, 1, 1,
0.5198941, 0.4055063, 1.111104, 1, 1, 1, 1, 1,
0.5217808, 1.194227, 0.568804, 1, 1, 1, 1, 1,
0.5285382, -0.7627302, 2.327625, 1, 1, 1, 1, 1,
0.5292746, -0.1770986, 0.615198, 1, 1, 1, 1, 1,
0.5295184, -1.159968, 3.285292, 1, 1, 1, 1, 1,
0.5343906, -0.07868692, 1.6041, 1, 1, 1, 1, 1,
0.535624, -0.2319646, 2.64913, 0, 0, 1, 1, 1,
0.5371839, -1.027302, 2.476876, 1, 0, 0, 1, 1,
0.5395589, 1.737627, -1.364153, 1, 0, 0, 1, 1,
0.541387, -1.304623, 1.968853, 1, 0, 0, 1, 1,
0.5460237, 0.3087366, 2.221222, 1, 0, 0, 1, 1,
0.549199, -1.491531, 1.890469, 1, 0, 0, 1, 1,
0.5515773, 1.510316, 0.3399421, 0, 0, 0, 1, 1,
0.55589, 0.4807129, 1.441345, 0, 0, 0, 1, 1,
0.5578383, 1.034225, -0.509127, 0, 0, 0, 1, 1,
0.5596597, 0.4583309, -0.3907078, 0, 0, 0, 1, 1,
0.5613067, -0.3625117, 0.8880638, 0, 0, 0, 1, 1,
0.5619659, -1.954048, 0.8073508, 0, 0, 0, 1, 1,
0.5645108, 1.28501, 0.6977893, 0, 0, 0, 1, 1,
0.5658231, 0.3083873, -0.5278203, 1, 1, 1, 1, 1,
0.5663013, 0.1749263, 1.878358, 1, 1, 1, 1, 1,
0.5705343, 0.2354423, 1.404507, 1, 1, 1, 1, 1,
0.5712665, 0.3040205, 2.510266, 1, 1, 1, 1, 1,
0.5829627, -0.5712375, 1.461616, 1, 1, 1, 1, 1,
0.5866336, 0.6473343, 3.208371, 1, 1, 1, 1, 1,
0.5896102, -0.6873316, 2.644909, 1, 1, 1, 1, 1,
0.5917264, -0.1893553, 1.565593, 1, 1, 1, 1, 1,
0.594869, -0.3799363, 1.3054, 1, 1, 1, 1, 1,
0.5949975, 1.302343, 0.5506068, 1, 1, 1, 1, 1,
0.5963258, -0.7549587, 2.811317, 1, 1, 1, 1, 1,
0.5990435, -0.9016153, 2.516139, 1, 1, 1, 1, 1,
0.5993673, -1.211296, 2.641833, 1, 1, 1, 1, 1,
0.6042327, -0.6100638, 0.05687179, 1, 1, 1, 1, 1,
0.6064819, 0.2639094, 0.6401469, 1, 1, 1, 1, 1,
0.6098181, -0.8836808, 2.97352, 0, 0, 1, 1, 1,
0.6131709, 0.2352543, 0.3126098, 1, 0, 0, 1, 1,
0.6140604, -1.737403, 3.412403, 1, 0, 0, 1, 1,
0.6167264, -1.899169, 2.516737, 1, 0, 0, 1, 1,
0.6173212, 0.8455945, 1.759959, 1, 0, 0, 1, 1,
0.6286017, -0.5430846, 2.437057, 1, 0, 0, 1, 1,
0.6287069, -0.2606501, 1.04659, 0, 0, 0, 1, 1,
0.629722, -1.395452, 3.806781, 0, 0, 0, 1, 1,
0.6329594, -0.3314914, 2.062824, 0, 0, 0, 1, 1,
0.6336775, -0.2095072, 1.145628, 0, 0, 0, 1, 1,
0.6355157, -0.4196099, 3.339864, 0, 0, 0, 1, 1,
0.6395037, 0.2767254, 0.8949323, 0, 0, 0, 1, 1,
0.6497154, 0.02457239, 1.480315, 0, 0, 0, 1, 1,
0.6525838, 1.537002, 0.1004695, 1, 1, 1, 1, 1,
0.6530655, 1.196212, -0.5782946, 1, 1, 1, 1, 1,
0.6630434, -0.8610618, 1.243733, 1, 1, 1, 1, 1,
0.6661398, -1.941219, 2.123169, 1, 1, 1, 1, 1,
0.6674849, -0.1253553, 3.619294, 1, 1, 1, 1, 1,
0.6721103, -1.215199, 3.540326, 1, 1, 1, 1, 1,
0.6774864, -0.01852087, 2.91938, 1, 1, 1, 1, 1,
0.6778696, 1.205389, 0.9843323, 1, 1, 1, 1, 1,
0.6832774, -0.1405273, 1.43432, 1, 1, 1, 1, 1,
0.6863103, 0.4814828, -1.094088, 1, 1, 1, 1, 1,
0.6885741, 0.7322387, 0.01232173, 1, 1, 1, 1, 1,
0.6895474, -0.1727249, -0.1550176, 1, 1, 1, 1, 1,
0.6938695, 2.503552, 1.493735, 1, 1, 1, 1, 1,
0.6964462, -0.3320395, 1.006171, 1, 1, 1, 1, 1,
0.7014074, -0.9172734, 1.871549, 1, 1, 1, 1, 1,
0.7017698, -0.2993275, 0.6467292, 0, 0, 1, 1, 1,
0.7106269, -0.4401028, 1.036666, 1, 0, 0, 1, 1,
0.7108181, -1.102825, 2.768961, 1, 0, 0, 1, 1,
0.7117198, -0.2051037, 2.428408, 1, 0, 0, 1, 1,
0.7284644, -1.205612, 2.720871, 1, 0, 0, 1, 1,
0.73013, -0.4651695, 1.221403, 1, 0, 0, 1, 1,
0.7319384, -0.2709762, 0.7880986, 0, 0, 0, 1, 1,
0.7358746, -1.264431, 2.42393, 0, 0, 0, 1, 1,
0.7415622, -0.9389336, 2.698987, 0, 0, 0, 1, 1,
0.741846, -0.2733142, 1.042248, 0, 0, 0, 1, 1,
0.7504342, -0.06415755, 2.451475, 0, 0, 0, 1, 1,
0.7520737, 0.9581737, -0.3822866, 0, 0, 0, 1, 1,
0.7542749, -0.9549173, 1.771998, 0, 0, 0, 1, 1,
0.7543755, -0.867435, 3.125504, 1, 1, 1, 1, 1,
0.7546675, 1.102097, -0.7243186, 1, 1, 1, 1, 1,
0.7555792, 0.8619359, 0.7804641, 1, 1, 1, 1, 1,
0.7614565, 0.9688256, -0.07342852, 1, 1, 1, 1, 1,
0.7719247, -0.5412079, 2.504714, 1, 1, 1, 1, 1,
0.7731738, 0.806246, -1.010208, 1, 1, 1, 1, 1,
0.7754036, -0.235312, 3.561158, 1, 1, 1, 1, 1,
0.7816043, -1.587016, 5.11719, 1, 1, 1, 1, 1,
0.7847589, -0.22001, 2.623719, 1, 1, 1, 1, 1,
0.7858292, 1.202258, -0.7965515, 1, 1, 1, 1, 1,
0.7880453, -0.5805613, 0.8454157, 1, 1, 1, 1, 1,
0.7881761, 0.1098859, 1.587384, 1, 1, 1, 1, 1,
0.79623, 0.8482106, 2.348331, 1, 1, 1, 1, 1,
0.796404, -0.6682339, 2.556556, 1, 1, 1, 1, 1,
0.8003877, 0.7442945, 2.135304, 1, 1, 1, 1, 1,
0.8037177, 1.124074, 0.05261103, 0, 0, 1, 1, 1,
0.8059887, 1.369466, 1.370197, 1, 0, 0, 1, 1,
0.8120185, 0.3848617, 0.9272782, 1, 0, 0, 1, 1,
0.815842, 0.2667767, 1.286952, 1, 0, 0, 1, 1,
0.8205627, 1.373696, -0.2784986, 1, 0, 0, 1, 1,
0.8213176, -0.2046839, 1.773874, 1, 0, 0, 1, 1,
0.8257049, -2.045941, 1.85854, 0, 0, 0, 1, 1,
0.8262998, 0.5575866, -0.1377135, 0, 0, 0, 1, 1,
0.8323144, 0.9646777, -0.4817405, 0, 0, 0, 1, 1,
0.8332481, 0.1914471, 2.355015, 0, 0, 0, 1, 1,
0.8340693, 0.4046341, 2.02465, 0, 0, 0, 1, 1,
0.8374702, 0.2633132, 0.8955488, 0, 0, 0, 1, 1,
0.8377999, 0.1233921, 1.18309, 0, 0, 0, 1, 1,
0.8404872, -1.209315, 2.423034, 1, 1, 1, 1, 1,
0.8424072, 0.9793884, 1.392536, 1, 1, 1, 1, 1,
0.8434318, -0.1946, 1.067442, 1, 1, 1, 1, 1,
0.8482445, -1.729861, 1.739998, 1, 1, 1, 1, 1,
0.8510866, -0.6219265, 3.485691, 1, 1, 1, 1, 1,
0.8521144, 0.2914989, -0.1445896, 1, 1, 1, 1, 1,
0.8655542, -0.6256402, 0.455829, 1, 1, 1, 1, 1,
0.8710376, -1.523607, 4.261911, 1, 1, 1, 1, 1,
0.8775322, -0.5970513, 1.142403, 1, 1, 1, 1, 1,
0.8798217, -0.539991, 2.128982, 1, 1, 1, 1, 1,
0.8799289, 0.2646, 1.197258, 1, 1, 1, 1, 1,
0.8829293, 1.382158, 0.5499476, 1, 1, 1, 1, 1,
0.8939799, -1.300105, 1.805912, 1, 1, 1, 1, 1,
0.8973716, 0.2407397, 2.272409, 1, 1, 1, 1, 1,
0.8975638, -0.7357106, 2.582438, 1, 1, 1, 1, 1,
0.9021839, 1.479646, 0.8008341, 0, 0, 1, 1, 1,
0.9039522, 1.705477, -1.484888, 1, 0, 0, 1, 1,
0.9055644, -0.4429417, 1.419934, 1, 0, 0, 1, 1,
0.912859, 1.207815, 0.9062601, 1, 0, 0, 1, 1,
0.9130361, 1.366846, 1.198122, 1, 0, 0, 1, 1,
0.9134687, -0.6694528, 3.499618, 1, 0, 0, 1, 1,
0.928142, -1.179223, 4.055349, 0, 0, 0, 1, 1,
0.9295202, -0.4406677, 0.08429436, 0, 0, 0, 1, 1,
0.9347486, 0.09290796, 0.1858614, 0, 0, 0, 1, 1,
0.9372587, -0.7790423, 3.17781, 0, 0, 0, 1, 1,
0.9382979, 1.612127, 0.2955672, 0, 0, 0, 1, 1,
0.9477558, -1.119401, 1.618895, 0, 0, 0, 1, 1,
0.965992, 0.8746333, -0.553433, 0, 0, 0, 1, 1,
0.9757308, 1.407231, -0.497464, 1, 1, 1, 1, 1,
0.9763548, -0.4152407, 1.070028, 1, 1, 1, 1, 1,
0.9893043, 0.3583569, 0.4449999, 1, 1, 1, 1, 1,
0.9956495, -1.165849, 1.345569, 1, 1, 1, 1, 1,
0.9975562, 0.3297493, 2.2433, 1, 1, 1, 1, 1,
1.000208, -1.65038, 1.55482, 1, 1, 1, 1, 1,
1.002836, 0.5949942, 0.8846485, 1, 1, 1, 1, 1,
1.012833, 0.667956, 0.8627799, 1, 1, 1, 1, 1,
1.015979, 0.02451195, 1.411126, 1, 1, 1, 1, 1,
1.021288, 0.707285, 1.63671, 1, 1, 1, 1, 1,
1.023917, -0.6764089, 2.210989, 1, 1, 1, 1, 1,
1.02505, 1.363461, 0.7233815, 1, 1, 1, 1, 1,
1.02581, 0.9252664, -0.3056404, 1, 1, 1, 1, 1,
1.026183, -0.2744961, 2.311023, 1, 1, 1, 1, 1,
1.028169, -0.7150218, 3.016333, 1, 1, 1, 1, 1,
1.028173, 0.0349274, 1.236132, 0, 0, 1, 1, 1,
1.03659, 0.5698829, 0.8567913, 1, 0, 0, 1, 1,
1.041784, 2.502876, -0.7231967, 1, 0, 0, 1, 1,
1.051845, 3.106662, -0.7045805, 1, 0, 0, 1, 1,
1.052474, 0.4385778, -0.3281546, 1, 0, 0, 1, 1,
1.055372, 0.07581659, 3.724052, 1, 0, 0, 1, 1,
1.056803, -0.9094032, 2.11459, 0, 0, 0, 1, 1,
1.061981, -0.3032998, 1.188054, 0, 0, 0, 1, 1,
1.068123, 0.5603881, 1.897395, 0, 0, 0, 1, 1,
1.070195, -1.756035, 1.597158, 0, 0, 0, 1, 1,
1.072892, -0.147977, 0.2355498, 0, 0, 0, 1, 1,
1.073274, -0.2955997, 1.97891, 0, 0, 0, 1, 1,
1.083666, -0.4845269, 2.029706, 0, 0, 0, 1, 1,
1.096079, -1.610202, 1.735779, 1, 1, 1, 1, 1,
1.098179, -0.3328948, 2.2917, 1, 1, 1, 1, 1,
1.098259, -0.559278, 1.1535, 1, 1, 1, 1, 1,
1.100652, -0.5718412, 2.130993, 1, 1, 1, 1, 1,
1.121349, -0.1757016, 0.7591137, 1, 1, 1, 1, 1,
1.123734, -2.164809, 2.284152, 1, 1, 1, 1, 1,
1.126156, -0.7562825, 2.149774, 1, 1, 1, 1, 1,
1.133827, -0.9760906, 1.722118, 1, 1, 1, 1, 1,
1.140051, -0.4487433, 1.953054, 1, 1, 1, 1, 1,
1.141578, 0.1154073, 2.515532, 1, 1, 1, 1, 1,
1.150048, 0.7347154, -0.005600627, 1, 1, 1, 1, 1,
1.150964, -0.3689397, 0.5341079, 1, 1, 1, 1, 1,
1.151408, 0.05247537, 1.01357, 1, 1, 1, 1, 1,
1.160076, -0.6880015, 3.260829, 1, 1, 1, 1, 1,
1.161248, -0.1603444, 0.6144749, 1, 1, 1, 1, 1,
1.171246, -1.16234, 3.651389, 0, 0, 1, 1, 1,
1.171655, -0.2956987, 1.338585, 1, 0, 0, 1, 1,
1.178707, -1.97467, 0.687065, 1, 0, 0, 1, 1,
1.186692, 0.5755133, 1.460616, 1, 0, 0, 1, 1,
1.192593, 0.4061837, 1.599676, 1, 0, 0, 1, 1,
1.194363, -0.8038812, 0.5456576, 1, 0, 0, 1, 1,
1.194993, -1.248051, 3.185794, 0, 0, 0, 1, 1,
1.204742, -1.392263, 1.318587, 0, 0, 0, 1, 1,
1.20498, 0.6781659, -0.350635, 0, 0, 0, 1, 1,
1.212592, 0.3589484, 2.727806, 0, 0, 0, 1, 1,
1.219375, 0.8565074, 2.157315, 0, 0, 0, 1, 1,
1.22344, -1.079965, 3.155887, 0, 0, 0, 1, 1,
1.224247, -0.6363772, 2.110103, 0, 0, 0, 1, 1,
1.225067, -0.4283246, 1.772101, 1, 1, 1, 1, 1,
1.240299, -1.186619, 1.66348, 1, 1, 1, 1, 1,
1.241175, -0.1291142, 0.6298032, 1, 1, 1, 1, 1,
1.250429, -0.1414867, 2.273062, 1, 1, 1, 1, 1,
1.263696, 0.3619624, 0.3731066, 1, 1, 1, 1, 1,
1.263968, 0.3328528, -1.490291, 1, 1, 1, 1, 1,
1.265077, -2.117603, 3.079168, 1, 1, 1, 1, 1,
1.288122, -0.2873532, 0.6969693, 1, 1, 1, 1, 1,
1.291934, 0.8922822, 2.836525, 1, 1, 1, 1, 1,
1.292509, -1.01338, 2.039534, 1, 1, 1, 1, 1,
1.300743, 0.6019832, -0.2098761, 1, 1, 1, 1, 1,
1.312362, -1.066246, 1.616003, 1, 1, 1, 1, 1,
1.316805, 0.5683783, 1.922684, 1, 1, 1, 1, 1,
1.32191, -0.1254371, 0.01619089, 1, 1, 1, 1, 1,
1.33631, 0.6966414, 1.746657, 1, 1, 1, 1, 1,
1.337488, 0.3525177, 1.935706, 0, 0, 1, 1, 1,
1.339412, 0.8509744, 1.209867, 1, 0, 0, 1, 1,
1.340988, -0.5870078, 2.09542, 1, 0, 0, 1, 1,
1.360546, 0.5773799, 1.731701, 1, 0, 0, 1, 1,
1.360809, -1.474597, 1.68322, 1, 0, 0, 1, 1,
1.372529, 0.5047831, 1.244565, 1, 0, 0, 1, 1,
1.379747, -1.166819, 1.933557, 0, 0, 0, 1, 1,
1.382751, 0.6156049, 1.056899, 0, 0, 0, 1, 1,
1.386948, -0.6663244, 1.870586, 0, 0, 0, 1, 1,
1.402873, -0.7253125, 1.380383, 0, 0, 0, 1, 1,
1.409473, -0.8123313, 0.8214457, 0, 0, 0, 1, 1,
1.444343, -1.616104, 3.525062, 0, 0, 0, 1, 1,
1.494068, 0.9473668, 1.402047, 0, 0, 0, 1, 1,
1.5166, -0.109909, 2.270294, 1, 1, 1, 1, 1,
1.523494, -0.9595519, 2.447049, 1, 1, 1, 1, 1,
1.540916, 1.141482, 0.5382627, 1, 1, 1, 1, 1,
1.555899, -0.9866903, 1.310463, 1, 1, 1, 1, 1,
1.577577, 0.3460813, 0.6473004, 1, 1, 1, 1, 1,
1.580925, 1.661025, 1.154114, 1, 1, 1, 1, 1,
1.584789, -0.4122013, 1.681068, 1, 1, 1, 1, 1,
1.595175, 0.5518744, 0.9272206, 1, 1, 1, 1, 1,
1.633655, 0.415151, 0.9631618, 1, 1, 1, 1, 1,
1.642089, -1.258769, 2.367435, 1, 1, 1, 1, 1,
1.642833, 0.0734081, 1.894993, 1, 1, 1, 1, 1,
1.644283, 0.9988415, -0.7410381, 1, 1, 1, 1, 1,
1.645992, -0.5084228, 2.894754, 1, 1, 1, 1, 1,
1.650912, -0.003222439, 2.754645, 1, 1, 1, 1, 1,
1.659062, -0.4094548, 2.195518, 1, 1, 1, 1, 1,
1.664219, -1.625769, 2.254029, 0, 0, 1, 1, 1,
1.677909, -0.5908597, 2.798665, 1, 0, 0, 1, 1,
1.684719, -0.4247224, 1.221425, 1, 0, 0, 1, 1,
1.694114, 1.010916, 2.590963, 1, 0, 0, 1, 1,
1.699826, -0.2846138, 0.9030754, 1, 0, 0, 1, 1,
1.710267, -1.343231, 2.108398, 1, 0, 0, 1, 1,
1.7151, -0.04743274, 1.516055, 0, 0, 0, 1, 1,
1.71577, 0.5236075, 0.3517317, 0, 0, 0, 1, 1,
1.71611, 0.4323435, -0.7378381, 0, 0, 0, 1, 1,
1.747256, -0.6745608, 3.924886, 0, 0, 0, 1, 1,
1.747791, 1.409882, 0.4904533, 0, 0, 0, 1, 1,
1.752802, 0.4427447, 0.6353744, 0, 0, 0, 1, 1,
1.760011, -1.17855, 2.594213, 0, 0, 0, 1, 1,
1.762185, 0.1834759, 3.008061, 1, 1, 1, 1, 1,
1.767639, -0.5419121, 1.523746, 1, 1, 1, 1, 1,
1.778203, -0.9363908, 2.027926, 1, 1, 1, 1, 1,
1.790327, -0.3566689, 0.1244525, 1, 1, 1, 1, 1,
1.79335, 1.051599, -0.2974746, 1, 1, 1, 1, 1,
1.794644, 0.3085078, 2.207921, 1, 1, 1, 1, 1,
1.795301, -0.1952016, 0.5770706, 1, 1, 1, 1, 1,
1.798021, 0.9465144, 0.09236492, 1, 1, 1, 1, 1,
1.805527, -0.9330204, 2.368107, 1, 1, 1, 1, 1,
1.81473, -0.4449571, 2.088108, 1, 1, 1, 1, 1,
1.826402, -0.4015961, 2.016324, 1, 1, 1, 1, 1,
1.835342, 0.2796854, 1.835987, 1, 1, 1, 1, 1,
1.849319, -0.6088551, 2.336086, 1, 1, 1, 1, 1,
1.854367, -1.792026, 2.136528, 1, 1, 1, 1, 1,
1.861872, 0.2184511, 1.608908, 1, 1, 1, 1, 1,
1.876349, -0.7075534, 3.872669, 0, 0, 1, 1, 1,
1.877671, 0.7414989, 1.022195, 1, 0, 0, 1, 1,
1.887089, 0.9130649, 0.3346184, 1, 0, 0, 1, 1,
1.890872, -2.673767, 1.880932, 1, 0, 0, 1, 1,
1.910258, 0.3613467, 2.179242, 1, 0, 0, 1, 1,
1.911824, -0.4368972, 2.506225, 1, 0, 0, 1, 1,
1.958802, 0.8103781, 1.193916, 0, 0, 0, 1, 1,
1.963937, 0.3518843, 1.850868, 0, 0, 0, 1, 1,
1.981453, -0.3813604, 1.775508, 0, 0, 0, 1, 1,
2.020531, 1.887182, -0.3540105, 0, 0, 0, 1, 1,
2.20624, 2.083167, 0.5209574, 0, 0, 0, 1, 1,
2.208898, -0.6214317, 0.7526492, 0, 0, 0, 1, 1,
2.245864, 0.0313396, 1.152384, 0, 0, 0, 1, 1,
2.314473, 0.3278304, 0.7821663, 1, 1, 1, 1, 1,
2.330768, 0.9506387, 0.7551492, 1, 1, 1, 1, 1,
2.342639, 0.1111676, 2.47663, 1, 1, 1, 1, 1,
2.369228, 0.2820441, 1.480056, 1, 1, 1, 1, 1,
2.547306, 2.035338, 2.114929, 1, 1, 1, 1, 1,
2.580436, 1.735895, 1.427412, 1, 1, 1, 1, 1,
2.637754, 0.9929383, 0.2273293, 1, 1, 1, 1, 1
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
var radius = 9.217001;
var distance = 32.37432;
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
mvMatrix.translate( -0.06365967, 0.07090735, -0.3003988 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.37432);
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
