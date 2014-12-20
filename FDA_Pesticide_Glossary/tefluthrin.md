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
-3.54833, 0.3811749, -0.2465676, 1, 0, 0, 1,
-3.067489, 0.6192995, -2.705619, 1, 0.007843138, 0, 1,
-2.862729, -1.006691, -0.7764646, 1, 0.01176471, 0, 1,
-2.836208, -0.7326265, -3.061078, 1, 0.01960784, 0, 1,
-2.790513, 1.034823, -1.112985, 1, 0.02352941, 0, 1,
-2.681503, -1.746066, -4.52223, 1, 0.03137255, 0, 1,
-2.577837, 0.1520783, -1.845798, 1, 0.03529412, 0, 1,
-2.559446, -0.4686921, -2.986503, 1, 0.04313726, 0, 1,
-2.551265, 0.3891077, -2.179867, 1, 0.04705882, 0, 1,
-2.503277, -1.859437, -2.177778, 1, 0.05490196, 0, 1,
-2.486125, -1.090228, -3.24877, 1, 0.05882353, 0, 1,
-2.465875, -0.6372272, -2.570142, 1, 0.06666667, 0, 1,
-2.432952, -0.1362448, -2.908931, 1, 0.07058824, 0, 1,
-2.43122, 0.9269659, -0.4174008, 1, 0.07843138, 0, 1,
-2.377548, 0.01931754, -0.4947153, 1, 0.08235294, 0, 1,
-2.296895, 1.431504, -0.07238646, 1, 0.09019608, 0, 1,
-2.258158, -1.208168, -1.878151, 1, 0.09411765, 0, 1,
-2.233882, -1.263523, -1.469597, 1, 0.1019608, 0, 1,
-2.224481, 0.0309877, -2.834321, 1, 0.1098039, 0, 1,
-2.163387, 1.299967, 0.06362714, 1, 0.1137255, 0, 1,
-2.094052, 0.02415732, -2.070707, 1, 0.1215686, 0, 1,
-2.087322, -0.2454379, -1.842573, 1, 0.1254902, 0, 1,
-2.087104, -1.244335, -3.233988, 1, 0.1333333, 0, 1,
-2.081518, 1.538825, -0.5699431, 1, 0.1372549, 0, 1,
-2.063895, -0.4645646, -1.388823, 1, 0.145098, 0, 1,
-2.060275, -0.6266031, -2.544891, 1, 0.1490196, 0, 1,
-2.02442, -0.8741514, -1.684103, 1, 0.1568628, 0, 1,
-2.018898, 1.820788, 1.053139, 1, 0.1607843, 0, 1,
-1.972053, 0.6956402, 0.2222382, 1, 0.1686275, 0, 1,
-1.944821, 0.5552239, -3.339901, 1, 0.172549, 0, 1,
-1.92657, -0.002359497, -2.676642, 1, 0.1803922, 0, 1,
-1.923812, 0.8982444, -0.08281014, 1, 0.1843137, 0, 1,
-1.901948, 0.5456231, -2.416688, 1, 0.1921569, 0, 1,
-1.897211, -0.5836169, -0.7333124, 1, 0.1960784, 0, 1,
-1.895013, 0.5540109, -2.187543, 1, 0.2039216, 0, 1,
-1.849604, 1.52202, -0.8537859, 1, 0.2117647, 0, 1,
-1.844931, -1.553193, -2.540101, 1, 0.2156863, 0, 1,
-1.836326, 0.1886279, -0.3826163, 1, 0.2235294, 0, 1,
-1.836027, -0.6944976, -1.224579, 1, 0.227451, 0, 1,
-1.822339, 1.283834, -2.871514, 1, 0.2352941, 0, 1,
-1.808621, -1.092879, -2.024868, 1, 0.2392157, 0, 1,
-1.791545, 0.382303, 0.07919623, 1, 0.2470588, 0, 1,
-1.782567, -0.9881657, -1.848704, 1, 0.2509804, 0, 1,
-1.774579, 0.229948, -1.507043, 1, 0.2588235, 0, 1,
-1.755346, -1.492466, -0.6476875, 1, 0.2627451, 0, 1,
-1.74651, -0.06167779, -0.8178762, 1, 0.2705882, 0, 1,
-1.722398, -0.01180758, -2.129123, 1, 0.2745098, 0, 1,
-1.716101, -0.7595856, -2.094444, 1, 0.282353, 0, 1,
-1.712864, 0.1800997, -1.052412, 1, 0.2862745, 0, 1,
-1.68722, 1.053831, -1.16451, 1, 0.2941177, 0, 1,
-1.667503, -0.2280141, -2.024209, 1, 0.3019608, 0, 1,
-1.655454, -0.7586012, -2.24227, 1, 0.3058824, 0, 1,
-1.631859, -0.8265145, -0.4601571, 1, 0.3137255, 0, 1,
-1.62014, -0.4449611, -2.289315, 1, 0.3176471, 0, 1,
-1.604373, -0.0267857, -1.894943, 1, 0.3254902, 0, 1,
-1.59228, -0.7307218, -2.880379, 1, 0.3294118, 0, 1,
-1.586955, -0.2532524, -0.4763603, 1, 0.3372549, 0, 1,
-1.577462, -0.6407738, -3.150586, 1, 0.3411765, 0, 1,
-1.576306, 2.4292, -1.497185, 1, 0.3490196, 0, 1,
-1.545118, 0.7808543, -0.6320057, 1, 0.3529412, 0, 1,
-1.544859, -1.276265, -1.665878, 1, 0.3607843, 0, 1,
-1.539413, 2.390332, -1.559502, 1, 0.3647059, 0, 1,
-1.531371, 1.421923, -2.261968, 1, 0.372549, 0, 1,
-1.522428, -1.754709, -1.973667, 1, 0.3764706, 0, 1,
-1.511569, -1.044283, -1.625532, 1, 0.3843137, 0, 1,
-1.499171, -0.3055215, 0.1197865, 1, 0.3882353, 0, 1,
-1.496132, 0.1887882, -3.860785, 1, 0.3960784, 0, 1,
-1.479416, -0.311843, -1.708662, 1, 0.4039216, 0, 1,
-1.463028, -1.80307, -3.172888, 1, 0.4078431, 0, 1,
-1.443854, -0.8732838, -2.195225, 1, 0.4156863, 0, 1,
-1.438459, 1.290381, 0.1286081, 1, 0.4196078, 0, 1,
-1.435362, -0.221584, -2.409635, 1, 0.427451, 0, 1,
-1.434598, -0.2533543, 0.004897085, 1, 0.4313726, 0, 1,
-1.423759, 0.5760193, -0.05398743, 1, 0.4392157, 0, 1,
-1.418596, -0.3799208, -0.6439169, 1, 0.4431373, 0, 1,
-1.408741, -0.3966827, -0.9858921, 1, 0.4509804, 0, 1,
-1.399363, 0.4109943, -1.227041, 1, 0.454902, 0, 1,
-1.398321, 0.4412396, -0.8168015, 1, 0.4627451, 0, 1,
-1.396003, 0.2006023, -1.807134, 1, 0.4666667, 0, 1,
-1.390832, -0.4483306, 0.8581132, 1, 0.4745098, 0, 1,
-1.389638, -1.130991, -2.951266, 1, 0.4784314, 0, 1,
-1.383438, -0.01579808, -3.331949, 1, 0.4862745, 0, 1,
-1.381941, 1.059842, -1.394795, 1, 0.4901961, 0, 1,
-1.379409, 0.5337885, -2.109468, 1, 0.4980392, 0, 1,
-1.369501, -0.05482463, -0.4538587, 1, 0.5058824, 0, 1,
-1.368118, 0.7527202, 0.5134597, 1, 0.509804, 0, 1,
-1.365344, -0.2191344, -3.260464, 1, 0.5176471, 0, 1,
-1.35377, -0.2828367, -0.9962304, 1, 0.5215687, 0, 1,
-1.349018, -1.305359, -1.721888, 1, 0.5294118, 0, 1,
-1.339238, -0.1311021, -0.7827448, 1, 0.5333334, 0, 1,
-1.327203, 1.340368, -0.100215, 1, 0.5411765, 0, 1,
-1.321838, -1.275446, -3.521804, 1, 0.5450981, 0, 1,
-1.317352, -0.2326156, -1.467912, 1, 0.5529412, 0, 1,
-1.3172, 1.421421, -1.49011, 1, 0.5568628, 0, 1,
-1.314166, -0.5222592, 0.1492139, 1, 0.5647059, 0, 1,
-1.310319, -0.2554018, -3.50214, 1, 0.5686275, 0, 1,
-1.310216, -0.6164532, -2.601436, 1, 0.5764706, 0, 1,
-1.309939, -0.4111702, -2.618507, 1, 0.5803922, 0, 1,
-1.309596, 1.45333, -0.5425417, 1, 0.5882353, 0, 1,
-1.297503, -0.1708815, -0.5837504, 1, 0.5921569, 0, 1,
-1.296514, -0.8740554, -2.706996, 1, 0.6, 0, 1,
-1.28924, 1.046529, -0.08090068, 1, 0.6078432, 0, 1,
-1.287873, 1.344239, -0.6134411, 1, 0.6117647, 0, 1,
-1.274558, -0.6166488, -2.230023, 1, 0.6196079, 0, 1,
-1.260146, 0.5120424, -2.494541, 1, 0.6235294, 0, 1,
-1.256402, 0.1061718, -1.674386, 1, 0.6313726, 0, 1,
-1.254812, 0.3054101, -2.381807, 1, 0.6352941, 0, 1,
-1.247566, 1.156936, -1.279739, 1, 0.6431373, 0, 1,
-1.241452, 0.6051108, -2.188694, 1, 0.6470588, 0, 1,
-1.239938, -0.3302052, -1.442039, 1, 0.654902, 0, 1,
-1.23672, -1.090366, -2.594426, 1, 0.6588235, 0, 1,
-1.220635, -0.6925787, -1.812636, 1, 0.6666667, 0, 1,
-1.212773, 1.014141, -1.518413, 1, 0.6705883, 0, 1,
-1.205195, -0.09950378, -2.03155, 1, 0.6784314, 0, 1,
-1.197138, 0.09749641, -1.716543, 1, 0.682353, 0, 1,
-1.189141, -0.05738582, -3.19894, 1, 0.6901961, 0, 1,
-1.18696, 0.4636916, -0.2584036, 1, 0.6941177, 0, 1,
-1.162232, -0.6983219, -1.819656, 1, 0.7019608, 0, 1,
-1.161985, -0.9670796, -1.797005, 1, 0.7098039, 0, 1,
-1.157957, 0.3977067, -0.8809938, 1, 0.7137255, 0, 1,
-1.148281, -0.8350585, -2.068191, 1, 0.7215686, 0, 1,
-1.146246, 1.063501, -0.393862, 1, 0.7254902, 0, 1,
-1.145958, -2.614378, -2.900193, 1, 0.7333333, 0, 1,
-1.140451, 0.5806308, -2.483625, 1, 0.7372549, 0, 1,
-1.137076, 1.25113, -1.170947, 1, 0.7450981, 0, 1,
-1.128928, 0.8334622, -1.775704, 1, 0.7490196, 0, 1,
-1.118611, -0.1201837, -1.775636, 1, 0.7568628, 0, 1,
-1.099728, -0.9089838, -2.268587, 1, 0.7607843, 0, 1,
-1.090135, -0.6149824, -2.360419, 1, 0.7686275, 0, 1,
-1.087952, -0.4294259, 0.1769646, 1, 0.772549, 0, 1,
-1.085276, -2.185385, -2.771212, 1, 0.7803922, 0, 1,
-1.085066, -0.2758813, -0.8415503, 1, 0.7843137, 0, 1,
-1.060093, 1.292356, 0.09859078, 1, 0.7921569, 0, 1,
-1.048649, 1.812512, -0.7609465, 1, 0.7960784, 0, 1,
-1.047003, -0.2643413, -1.103614, 1, 0.8039216, 0, 1,
-1.045963, 0.09829816, -0.9678085, 1, 0.8117647, 0, 1,
-1.042565, 0.1522978, -0.85545, 1, 0.8156863, 0, 1,
-1.03874, -0.7074186, -1.694523, 1, 0.8235294, 0, 1,
-1.034223, -0.05909576, 0.08279749, 1, 0.827451, 0, 1,
-1.022609, 1.234933, 0.06736927, 1, 0.8352941, 0, 1,
-1.016771, 0.1703072, -1.84377, 1, 0.8392157, 0, 1,
-1.016117, 0.752591, -0.5276555, 1, 0.8470588, 0, 1,
-1.014876, 0.06225398, -2.316293, 1, 0.8509804, 0, 1,
-1.013736, -0.08024242, -1.613327, 1, 0.8588235, 0, 1,
-1.010225, 0.9398466, -0.7843548, 1, 0.8627451, 0, 1,
-1.009297, 0.2937936, -0.6631148, 1, 0.8705882, 0, 1,
-1.00406, -2.082386, -0.7924005, 1, 0.8745098, 0, 1,
-0.9995064, 0.1703001, -3.296962, 1, 0.8823529, 0, 1,
-0.9883047, 0.4904024, -1.549895, 1, 0.8862745, 0, 1,
-0.9850176, -0.7370541, -3.145382, 1, 0.8941177, 0, 1,
-0.9786708, 1.272467, -1.381962, 1, 0.8980392, 0, 1,
-0.9772496, 0.04469438, -0.1538603, 1, 0.9058824, 0, 1,
-0.9771191, 1.654182, -0.6691546, 1, 0.9137255, 0, 1,
-0.9758744, -0.1189741, -2.529583, 1, 0.9176471, 0, 1,
-0.9744602, 0.1033029, -3.344004, 1, 0.9254902, 0, 1,
-0.9698768, -0.04206955, -1.717272, 1, 0.9294118, 0, 1,
-0.9689448, -0.804868, -3.572261, 1, 0.9372549, 0, 1,
-0.9652348, 0.1936304, -0.3025364, 1, 0.9411765, 0, 1,
-0.9635767, 0.7838035, -2.256681, 1, 0.9490196, 0, 1,
-0.9456106, -1.044336, -2.422381, 1, 0.9529412, 0, 1,
-0.9456065, 1.712929, 0.2546575, 1, 0.9607843, 0, 1,
-0.9453539, -1.076869, -1.912464, 1, 0.9647059, 0, 1,
-0.942983, -1.3289, -3.159175, 1, 0.972549, 0, 1,
-0.9404132, -1.471079, -1.720474, 1, 0.9764706, 0, 1,
-0.9393569, 0.6618664, -0.6298994, 1, 0.9843137, 0, 1,
-0.9385446, 1.817758, -0.45253, 1, 0.9882353, 0, 1,
-0.9377089, 0.9135228, -1.718251, 1, 0.9960784, 0, 1,
-0.9341485, -0.4891523, -2.650507, 0.9960784, 1, 0, 1,
-0.9296507, -0.5439755, -1.326443, 0.9921569, 1, 0, 1,
-0.9121017, -0.1371948, -1.132375, 0.9843137, 1, 0, 1,
-0.908686, 0.05858716, -1.494129, 0.9803922, 1, 0, 1,
-0.9067835, 0.7518572, -0.4837214, 0.972549, 1, 0, 1,
-0.9028676, -0.9165329, -4.710457, 0.9686275, 1, 0, 1,
-0.9020661, 0.08188371, -2.614309, 0.9607843, 1, 0, 1,
-0.8949875, -0.5575743, -1.781895, 0.9568627, 1, 0, 1,
-0.8890974, 0.5466772, -2.389844, 0.9490196, 1, 0, 1,
-0.8806612, -0.5714304, -0.4145375, 0.945098, 1, 0, 1,
-0.8805481, -1.314738, -2.566867, 0.9372549, 1, 0, 1,
-0.8783127, -0.682832, -2.401472, 0.9333333, 1, 0, 1,
-0.8780544, -0.6175426, -2.139431, 0.9254902, 1, 0, 1,
-0.8708177, 0.5166535, -2.789684, 0.9215686, 1, 0, 1,
-0.8658984, 0.2060968, -2.138013, 0.9137255, 1, 0, 1,
-0.8633341, -1.488888, -4.41662, 0.9098039, 1, 0, 1,
-0.8610427, -0.7199633, -2.59575, 0.9019608, 1, 0, 1,
-0.8588104, 0.1628422, -1.510061, 0.8941177, 1, 0, 1,
-0.8436955, 0.01320084, -2.778394, 0.8901961, 1, 0, 1,
-0.8432362, -1.12489, -3.72864, 0.8823529, 1, 0, 1,
-0.8314222, 0.8880845, -0.2861681, 0.8784314, 1, 0, 1,
-0.8301347, 1.229384, 0.5957222, 0.8705882, 1, 0, 1,
-0.8297138, -0.1905311, -2.440517, 0.8666667, 1, 0, 1,
-0.8290423, 0.4471459, -0.4276029, 0.8588235, 1, 0, 1,
-0.8272598, -1.778989, -2.957549, 0.854902, 1, 0, 1,
-0.8204998, 0.6049116, 0.1107945, 0.8470588, 1, 0, 1,
-0.8179136, 0.5084766, -0.3880735, 0.8431373, 1, 0, 1,
-0.8152, -0.5743493, -2.691653, 0.8352941, 1, 0, 1,
-0.8120976, 0.7584987, -0.640329, 0.8313726, 1, 0, 1,
-0.8118305, -0.7678988, -1.249891, 0.8235294, 1, 0, 1,
-0.810163, 1.000984, 0.1133064, 0.8196079, 1, 0, 1,
-0.809612, 0.1371082, -1.318482, 0.8117647, 1, 0, 1,
-0.8092856, -0.9980352, -1.849333, 0.8078431, 1, 0, 1,
-0.8076316, 1.262206, 1.394097, 0.8, 1, 0, 1,
-0.8057752, 0.4926209, -0.2131867, 0.7921569, 1, 0, 1,
-0.8027137, -1.125235, -2.343493, 0.7882353, 1, 0, 1,
-0.8000567, -0.09693935, -2.982147, 0.7803922, 1, 0, 1,
-0.794461, -1.603369, -3.84287, 0.7764706, 1, 0, 1,
-0.7926913, 0.3577774, -0.884517, 0.7686275, 1, 0, 1,
-0.7914737, -0.9768248, -2.678872, 0.7647059, 1, 0, 1,
-0.7873564, 1.371937, 2.150384, 0.7568628, 1, 0, 1,
-0.7866106, 0.4106794, -2.268123, 0.7529412, 1, 0, 1,
-0.7806884, 0.7373041, -0.2633248, 0.7450981, 1, 0, 1,
-0.7739455, -2.726882, -4.08832, 0.7411765, 1, 0, 1,
-0.7737014, 1.591489, -0.4686884, 0.7333333, 1, 0, 1,
-0.7718503, 0.1659139, -1.156156, 0.7294118, 1, 0, 1,
-0.7652078, 1.608251, -1.264045, 0.7215686, 1, 0, 1,
-0.7642618, 0.03424861, -0.9038703, 0.7176471, 1, 0, 1,
-0.7630188, -0.8092711, -2.507149, 0.7098039, 1, 0, 1,
-0.7538321, 0.5093926, -2.093085, 0.7058824, 1, 0, 1,
-0.7513894, 0.4078262, -1.147255, 0.6980392, 1, 0, 1,
-0.7495883, -0.01293823, -3.742457, 0.6901961, 1, 0, 1,
-0.7495376, 0.4677049, -0.9776941, 0.6862745, 1, 0, 1,
-0.7466837, 0.3344028, -0.4018822, 0.6784314, 1, 0, 1,
-0.7411705, 0.6348377, -2.708544, 0.6745098, 1, 0, 1,
-0.7397789, -0.08825155, -2.14847, 0.6666667, 1, 0, 1,
-0.7348784, -0.39519, -1.435698, 0.6627451, 1, 0, 1,
-0.7342058, 0.6659542, -1.421398, 0.654902, 1, 0, 1,
-0.7339948, -1.287162, -2.19895, 0.6509804, 1, 0, 1,
-0.7313899, 1.201656, -0.1231572, 0.6431373, 1, 0, 1,
-0.7226427, 0.7627378, -1.994284, 0.6392157, 1, 0, 1,
-0.7203839, -1.458716, -2.222821, 0.6313726, 1, 0, 1,
-0.7201253, 0.05226809, -0.8413711, 0.627451, 1, 0, 1,
-0.7167695, 0.4062419, -1.069877, 0.6196079, 1, 0, 1,
-0.7096231, -1.360705, -1.526435, 0.6156863, 1, 0, 1,
-0.6963631, -0.05412932, -2.231602, 0.6078432, 1, 0, 1,
-0.6949539, 0.8418394, -0.6015089, 0.6039216, 1, 0, 1,
-0.6929317, -1.76274, -4.366118, 0.5960785, 1, 0, 1,
-0.6876944, -1.800883, -2.727688, 0.5882353, 1, 0, 1,
-0.6865463, 1.284609, 0.4884819, 0.5843138, 1, 0, 1,
-0.6848359, 0.8097228, -1.046465, 0.5764706, 1, 0, 1,
-0.6843897, -0.5644242, -0.6501034, 0.572549, 1, 0, 1,
-0.6777595, -0.3126245, -3.317337, 0.5647059, 1, 0, 1,
-0.6737195, 0.6264561, -1.374453, 0.5607843, 1, 0, 1,
-0.6725831, 0.6204357, -0.4831533, 0.5529412, 1, 0, 1,
-0.6714156, 0.2744028, -1.451058, 0.5490196, 1, 0, 1,
-0.668038, -0.4537672, -1.979712, 0.5411765, 1, 0, 1,
-0.6626281, -0.3213446, -3.146032, 0.5372549, 1, 0, 1,
-0.662555, 0.3507964, -0.248813, 0.5294118, 1, 0, 1,
-0.6614935, 1.13683, 0.4531355, 0.5254902, 1, 0, 1,
-0.6581961, 1.658828, -0.8665705, 0.5176471, 1, 0, 1,
-0.6576192, 0.4120407, -1.575742, 0.5137255, 1, 0, 1,
-0.6524789, 1.4155, -0.143421, 0.5058824, 1, 0, 1,
-0.6493144, -0.125858, -0.8689702, 0.5019608, 1, 0, 1,
-0.6475579, 0.7863253, -0.7451228, 0.4941176, 1, 0, 1,
-0.6467206, 0.4590813, -1.314382, 0.4862745, 1, 0, 1,
-0.6400005, 0.4473569, -0.1665975, 0.4823529, 1, 0, 1,
-0.6391156, 0.6574136, -1.957579, 0.4745098, 1, 0, 1,
-0.6342629, 0.161303, -2.712902, 0.4705882, 1, 0, 1,
-0.6333781, -0.7784216, -2.538372, 0.4627451, 1, 0, 1,
-0.6207259, 0.3350981, -2.850713, 0.4588235, 1, 0, 1,
-0.6203048, -1.107805, -1.477543, 0.4509804, 1, 0, 1,
-0.6173965, 1.345539, -1.149109, 0.4470588, 1, 0, 1,
-0.6162941, 0.3825292, -0.8717202, 0.4392157, 1, 0, 1,
-0.6118572, 0.1575439, 0.4064149, 0.4352941, 1, 0, 1,
-0.6080164, 1.01544, -1.19393, 0.427451, 1, 0, 1,
-0.6054499, -0.4640224, -2.660618, 0.4235294, 1, 0, 1,
-0.6032326, 0.3162268, -0.4006901, 0.4156863, 1, 0, 1,
-0.5975612, -0.7244625, -2.405831, 0.4117647, 1, 0, 1,
-0.5929319, 0.1761706, -1.401826, 0.4039216, 1, 0, 1,
-0.5904499, -0.4212297, -1.478846, 0.3960784, 1, 0, 1,
-0.5884405, -0.1455092, -2.270669, 0.3921569, 1, 0, 1,
-0.5866443, 1.657291, -2.310293, 0.3843137, 1, 0, 1,
-0.5832516, -0.1688661, -1.179534, 0.3803922, 1, 0, 1,
-0.5811892, 0.4626051, -1.513579, 0.372549, 1, 0, 1,
-0.5784401, -1.027571, -1.725253, 0.3686275, 1, 0, 1,
-0.5748496, -1.080424, -3.654816, 0.3607843, 1, 0, 1,
-0.5690401, -0.4144254, -3.41574, 0.3568628, 1, 0, 1,
-0.5663151, -0.8750538, -2.120102, 0.3490196, 1, 0, 1,
-0.5658005, 0.9451351, -1.897216, 0.345098, 1, 0, 1,
-0.5543754, 0.801915, -1.345772, 0.3372549, 1, 0, 1,
-0.5540492, 0.6331156, -0.5905156, 0.3333333, 1, 0, 1,
-0.5532969, 1.429266, -1.020927, 0.3254902, 1, 0, 1,
-0.5523499, -0.9615097, -4.622871, 0.3215686, 1, 0, 1,
-0.5476069, 0.8288731, 0.7671288, 0.3137255, 1, 0, 1,
-0.5467259, -0.6115955, -2.497311, 0.3098039, 1, 0, 1,
-0.5417078, 1.323349, -0.2360376, 0.3019608, 1, 0, 1,
-0.5404915, 0.8883929, -0.4452266, 0.2941177, 1, 0, 1,
-0.5333004, 0.2584417, -1.355859, 0.2901961, 1, 0, 1,
-0.5324149, -0.6630529, -3.010726, 0.282353, 1, 0, 1,
-0.5316311, -1.048973, -1.589245, 0.2784314, 1, 0, 1,
-0.526003, -0.7106407, -3.929049, 0.2705882, 1, 0, 1,
-0.5255141, -1.85343, -3.885409, 0.2666667, 1, 0, 1,
-0.525373, 1.140044, 0.1157829, 0.2588235, 1, 0, 1,
-0.5233234, -1.295708, -4.089399, 0.254902, 1, 0, 1,
-0.5224724, -0.01728149, -2.535455, 0.2470588, 1, 0, 1,
-0.5195877, 1.678747, -0.1748413, 0.2431373, 1, 0, 1,
-0.5184677, 2.153196, -0.7484784, 0.2352941, 1, 0, 1,
-0.5141193, -0.3621112, -0.8188913, 0.2313726, 1, 0, 1,
-0.5027251, -3.196722, -1.414787, 0.2235294, 1, 0, 1,
-0.50174, 0.4423687, -0.08164133, 0.2196078, 1, 0, 1,
-0.4999573, 0.1067867, -2.94184, 0.2117647, 1, 0, 1,
-0.4981505, -0.5460179, -4.4173, 0.2078431, 1, 0, 1,
-0.4981427, -0.8981183, -1.970767, 0.2, 1, 0, 1,
-0.4960282, 2.954273, -1.013904, 0.1921569, 1, 0, 1,
-0.4955182, -1.442853, -3.884995, 0.1882353, 1, 0, 1,
-0.4938055, 0.04254034, -2.826177, 0.1803922, 1, 0, 1,
-0.4935017, -0.8669227, -2.505636, 0.1764706, 1, 0, 1,
-0.4906043, 0.3777908, 0.2822165, 0.1686275, 1, 0, 1,
-0.4803486, 0.1863934, -1.674838, 0.1647059, 1, 0, 1,
-0.4776931, -0.5157067, -2.521683, 0.1568628, 1, 0, 1,
-0.4743468, -0.141059, -2.282517, 0.1529412, 1, 0, 1,
-0.4633669, 1.308863, 0.3603125, 0.145098, 1, 0, 1,
-0.4624413, 1.672103, -1.983081, 0.1411765, 1, 0, 1,
-0.4551027, -1.142706, -3.907201, 0.1333333, 1, 0, 1,
-0.447621, 0.9011775, 0.5238622, 0.1294118, 1, 0, 1,
-0.4447521, 0.4445511, 0.3990265, 0.1215686, 1, 0, 1,
-0.4429594, -0.8796092, -4.379877, 0.1176471, 1, 0, 1,
-0.4420831, -0.8061056, -3.810914, 0.1098039, 1, 0, 1,
-0.4412217, 0.9393526, -0.1002713, 0.1058824, 1, 0, 1,
-0.4378239, 1.460745, -1.121896, 0.09803922, 1, 0, 1,
-0.4362747, 0.825672, 0.04712449, 0.09019608, 1, 0, 1,
-0.4354244, 2.571874, 0.7490169, 0.08627451, 1, 0, 1,
-0.4323394, -0.6692156, -1.978055, 0.07843138, 1, 0, 1,
-0.4321787, -0.7000782, -4.137347, 0.07450981, 1, 0, 1,
-0.4314508, 0.439401, -1.70547, 0.06666667, 1, 0, 1,
-0.4301264, -0.4040623, -0.6628546, 0.0627451, 1, 0, 1,
-0.4287829, 0.4939535, -1.406329, 0.05490196, 1, 0, 1,
-0.4275092, -1.018643, -2.885313, 0.05098039, 1, 0, 1,
-0.4247808, -1.541666, -1.375226, 0.04313726, 1, 0, 1,
-0.4214028, -0.8543199, -3.545168, 0.03921569, 1, 0, 1,
-0.418003, 0.2734725, -2.528989, 0.03137255, 1, 0, 1,
-0.4160735, -0.1657883, -0.3985634, 0.02745098, 1, 0, 1,
-0.4150498, -0.2504005, -1.8386, 0.01960784, 1, 0, 1,
-0.4103226, -0.7329899, -3.6685, 0.01568628, 1, 0, 1,
-0.4096665, 0.048161, 0.04040397, 0.007843138, 1, 0, 1,
-0.4052701, 1.8656, -0.1620737, 0.003921569, 1, 0, 1,
-0.4050118, 0.222929, -1.785861, 0, 1, 0.003921569, 1,
-0.4036307, -0.9287871, -3.148878, 0, 1, 0.01176471, 1,
-0.4024744, 0.6126755, 1.56326, 0, 1, 0.01568628, 1,
-0.4018264, -0.8336362, -1.506004, 0, 1, 0.02352941, 1,
-0.4015936, 0.2917852, -1.942686, 0, 1, 0.02745098, 1,
-0.3953961, 0.05540068, -1.709825, 0, 1, 0.03529412, 1,
-0.3949287, -0.06363469, -2.437172, 0, 1, 0.03921569, 1,
-0.3937815, 0.8494323, -0.8528783, 0, 1, 0.04705882, 1,
-0.392895, 0.4182813, 0.4724233, 0, 1, 0.05098039, 1,
-0.3918383, 0.3443227, -0.1089007, 0, 1, 0.05882353, 1,
-0.3900518, -0.06072712, -3.641149, 0, 1, 0.0627451, 1,
-0.3859697, 0.06737776, 0.9104825, 0, 1, 0.07058824, 1,
-0.3851405, 1.57673, 0.9506328, 0, 1, 0.07450981, 1,
-0.3737223, 0.009992829, 0.02639438, 0, 1, 0.08235294, 1,
-0.3665234, -2.154356, -4.229452, 0, 1, 0.08627451, 1,
-0.3655444, 0.850535, -0.1783044, 0, 1, 0.09411765, 1,
-0.3609022, -1.009024, -2.851715, 0, 1, 0.1019608, 1,
-0.3558281, -0.2364408, -2.213701, 0, 1, 0.1058824, 1,
-0.3538239, 0.3570669, 1.119818, 0, 1, 0.1137255, 1,
-0.3475313, 0.9665934, -0.07256864, 0, 1, 0.1176471, 1,
-0.3456622, 2.710648, 1.251808, 0, 1, 0.1254902, 1,
-0.3450575, -1.372237, -3.410946, 0, 1, 0.1294118, 1,
-0.3447288, -0.2513122, -2.007821, 0, 1, 0.1372549, 1,
-0.3430482, 0.466425, -2.40743, 0, 1, 0.1411765, 1,
-0.3423836, -1.550139, -4.436186, 0, 1, 0.1490196, 1,
-0.3396964, 0.327048, 1.844723, 0, 1, 0.1529412, 1,
-0.3368183, -0.309938, -3.217389, 0, 1, 0.1607843, 1,
-0.3364792, 0.4096665, 0.5602685, 0, 1, 0.1647059, 1,
-0.3362859, -1.398401, -2.313854, 0, 1, 0.172549, 1,
-0.3348111, -0.715297, -1.214944, 0, 1, 0.1764706, 1,
-0.3323388, -0.3245872, -1.566057, 0, 1, 0.1843137, 1,
-0.3318296, 1.775929, -0.1864534, 0, 1, 0.1882353, 1,
-0.3216315, 0.01479901, -2.770048, 0, 1, 0.1960784, 1,
-0.3162229, 0.4315031, 0.05611348, 0, 1, 0.2039216, 1,
-0.3157086, -0.6092969, -2.567149, 0, 1, 0.2078431, 1,
-0.3153049, -2.032706, -3.631029, 0, 1, 0.2156863, 1,
-0.3129571, -0.8319346, -2.817032, 0, 1, 0.2196078, 1,
-0.3126005, -0.5243456, -3.430964, 0, 1, 0.227451, 1,
-0.3119248, 1.029072, 0.4635662, 0, 1, 0.2313726, 1,
-0.3116921, -0.4417289, -3.649224, 0, 1, 0.2392157, 1,
-0.3084254, -0.4306865, -1.467513, 0, 1, 0.2431373, 1,
-0.3065221, 1.608091, 0.3581492, 0, 1, 0.2509804, 1,
-0.3061962, 1.459124, 0.1778546, 0, 1, 0.254902, 1,
-0.3049153, 0.781638, -0.03022599, 0, 1, 0.2627451, 1,
-0.3032595, 0.291834, -0.1262243, 0, 1, 0.2666667, 1,
-0.3011473, 1.740113, -0.8113242, 0, 1, 0.2745098, 1,
-0.3010784, -0.1873089, -4.516448, 0, 1, 0.2784314, 1,
-0.2998969, -0.01611261, 0.65473, 0, 1, 0.2862745, 1,
-0.2987736, 1.349799, -0.2558252, 0, 1, 0.2901961, 1,
-0.2960399, 0.2407173, -1.668768, 0, 1, 0.2980392, 1,
-0.2951274, 0.5066067, 0.1046162, 0, 1, 0.3058824, 1,
-0.2945796, -1.212303, -2.797034, 0, 1, 0.3098039, 1,
-0.2923312, -2.256102, -4.440944, 0, 1, 0.3176471, 1,
-0.2915412, 0.1243148, -0.5918399, 0, 1, 0.3215686, 1,
-0.2906895, 0.2491573, -0.3892001, 0, 1, 0.3294118, 1,
-0.2878959, -0.6296724, -2.480231, 0, 1, 0.3333333, 1,
-0.284042, -1.564346, -1.633619, 0, 1, 0.3411765, 1,
-0.2826738, 0.2370252, -0.5262372, 0, 1, 0.345098, 1,
-0.2750618, 0.3685367, -1.170552, 0, 1, 0.3529412, 1,
-0.2726576, -0.2891217, -1.447834, 0, 1, 0.3568628, 1,
-0.272094, 0.8199048, 0.3039691, 0, 1, 0.3647059, 1,
-0.2720643, 1.792089, 0.3773776, 0, 1, 0.3686275, 1,
-0.268929, 1.929475, 0.2940799, 0, 1, 0.3764706, 1,
-0.2659222, -0.4358155, -2.780179, 0, 1, 0.3803922, 1,
-0.2657883, -0.6199002, -1.111872, 0, 1, 0.3882353, 1,
-0.2611443, 1.134885, -0.1846695, 0, 1, 0.3921569, 1,
-0.2602996, -0.6980563, -2.068756, 0, 1, 0.4, 1,
-0.259757, -0.06562458, -1.213566, 0, 1, 0.4078431, 1,
-0.2533828, -0.2222875, -2.730208, 0, 1, 0.4117647, 1,
-0.2527857, 0.332492, -0.4995675, 0, 1, 0.4196078, 1,
-0.2527401, -0.3318349, -4.076003, 0, 1, 0.4235294, 1,
-0.2522025, 0.5245386, -1.096863, 0, 1, 0.4313726, 1,
-0.2502987, -1.342954, -3.296454, 0, 1, 0.4352941, 1,
-0.249625, -1.012261, -1.73631, 0, 1, 0.4431373, 1,
-0.2483557, 1.632292, 0.667707, 0, 1, 0.4470588, 1,
-0.2435117, -0.01354778, -2.684689, 0, 1, 0.454902, 1,
-0.2427714, -0.8812783, -1.896677, 0, 1, 0.4588235, 1,
-0.2425051, -1.389851, -3.114588, 0, 1, 0.4666667, 1,
-0.2402451, 0.4995932, -0.3641976, 0, 1, 0.4705882, 1,
-0.2396994, -0.4808129, -1.671717, 0, 1, 0.4784314, 1,
-0.2373647, 0.9610329, -2.66595, 0, 1, 0.4823529, 1,
-0.2317645, -0.9398658, -3.551869, 0, 1, 0.4901961, 1,
-0.2242256, -0.8694859, -4.467083, 0, 1, 0.4941176, 1,
-0.2223552, 0.5454305, 0.4762802, 0, 1, 0.5019608, 1,
-0.2185638, -1.069379, -2.789986, 0, 1, 0.509804, 1,
-0.2185362, 0.314084, -1.893936, 0, 1, 0.5137255, 1,
-0.2163129, -2.537414, -3.065785, 0, 1, 0.5215687, 1,
-0.2150248, 1.914359, 1.075319, 0, 1, 0.5254902, 1,
-0.214962, 1.269182, -0.5098371, 0, 1, 0.5333334, 1,
-0.2143998, -0.5990356, -1.148457, 0, 1, 0.5372549, 1,
-0.2133104, 2.190352, 1.611563, 0, 1, 0.5450981, 1,
-0.2131175, 0.3125959, -1.910462, 0, 1, 0.5490196, 1,
-0.2130725, 0.3318609, -1.975474, 0, 1, 0.5568628, 1,
-0.2128153, 0.3177429, 1.125873, 0, 1, 0.5607843, 1,
-0.2081931, 0.7106425, -2.579453, 0, 1, 0.5686275, 1,
-0.2056273, 0.04719415, -0.1703152, 0, 1, 0.572549, 1,
-0.203922, 0.4777229, 1.26579, 0, 1, 0.5803922, 1,
-0.2012734, -0.809913, -2.332591, 0, 1, 0.5843138, 1,
-0.1972768, 0.9462321, 0.6629996, 0, 1, 0.5921569, 1,
-0.19628, -0.3964694, -1.803423, 0, 1, 0.5960785, 1,
-0.1878953, 0.08377175, -1.016278, 0, 1, 0.6039216, 1,
-0.1858223, -0.9641958, -3.154666, 0, 1, 0.6117647, 1,
-0.1737888, 1.229141, -0.01808165, 0, 1, 0.6156863, 1,
-0.1727129, -0.6824389, -2.435972, 0, 1, 0.6235294, 1,
-0.1725318, -0.423099, -4.417577, 0, 1, 0.627451, 1,
-0.1664833, 1.74281, 0.4133695, 0, 1, 0.6352941, 1,
-0.1655854, 1.332895, 0.59531, 0, 1, 0.6392157, 1,
-0.1633355, -0.5518129, -3.627757, 0, 1, 0.6470588, 1,
-0.1626415, 1.111306, -0.912582, 0, 1, 0.6509804, 1,
-0.1620173, 0.9647626, -1.031606, 0, 1, 0.6588235, 1,
-0.1619917, 1.294264, 0.6025938, 0, 1, 0.6627451, 1,
-0.161244, -0.148524, -2.480789, 0, 1, 0.6705883, 1,
-0.1580392, -2.670387, -1.650771, 0, 1, 0.6745098, 1,
-0.1570474, 0.1655048, 0.2229547, 0, 1, 0.682353, 1,
-0.1450219, -0.6606869, -2.735831, 0, 1, 0.6862745, 1,
-0.1417829, 0.7073386, 0.465528, 0, 1, 0.6941177, 1,
-0.1413798, -0.6223099, -3.062874, 0, 1, 0.7019608, 1,
-0.1358006, 0.7252144, 0.5238823, 0, 1, 0.7058824, 1,
-0.1345302, -0.7544376, -2.847879, 0, 1, 0.7137255, 1,
-0.133684, 0.8000659, -1.662493, 0, 1, 0.7176471, 1,
-0.1334406, -0.1920163, -1.782849, 0, 1, 0.7254902, 1,
-0.1325614, -0.5740777, -1.755238, 0, 1, 0.7294118, 1,
-0.1306145, -0.1039264, -2.764413, 0, 1, 0.7372549, 1,
-0.1290455, 0.3180265, 1.760496, 0, 1, 0.7411765, 1,
-0.1282622, 1.259388, -1.419764, 0, 1, 0.7490196, 1,
-0.1246346, 1.841915, 0.6883194, 0, 1, 0.7529412, 1,
-0.1209045, -0.5161619, -2.294771, 0, 1, 0.7607843, 1,
-0.117415, 0.1801307, -1.650497, 0, 1, 0.7647059, 1,
-0.1170135, 1.67956, -0.1653611, 0, 1, 0.772549, 1,
-0.1161314, 0.3694846, 0.041375, 0, 1, 0.7764706, 1,
-0.1138485, 1.836776, 0.6538152, 0, 1, 0.7843137, 1,
-0.1125844, 0.2987634, 0.4648461, 0, 1, 0.7882353, 1,
-0.1122359, -2.002641, -3.631389, 0, 1, 0.7960784, 1,
-0.1075695, 0.9860772, 1.741879, 0, 1, 0.8039216, 1,
-0.1059749, -1.546522, -3.098492, 0, 1, 0.8078431, 1,
-0.1055911, -0.4383482, -1.718452, 0, 1, 0.8156863, 1,
-0.10292, -0.8206904, -3.394977, 0, 1, 0.8196079, 1,
-0.1003136, -0.449789, -2.971639, 0, 1, 0.827451, 1,
-0.09973649, -1.753334, -3.95093, 0, 1, 0.8313726, 1,
-0.0979217, 0.8668309, 0.876889, 0, 1, 0.8392157, 1,
-0.09715239, 1.290427, -1.414179, 0, 1, 0.8431373, 1,
-0.09681851, -0.4530888, -3.404243, 0, 1, 0.8509804, 1,
-0.09480339, 1.682936, 1.020186, 0, 1, 0.854902, 1,
-0.0924275, -1.631441, -1.868268, 0, 1, 0.8627451, 1,
-0.0865537, -0.4787439, -2.159666, 0, 1, 0.8666667, 1,
-0.08566904, 0.02128653, -1.201247, 0, 1, 0.8745098, 1,
-0.08469359, -0.7480522, -3.252506, 0, 1, 0.8784314, 1,
-0.08189607, 0.3093993, 0.09054802, 0, 1, 0.8862745, 1,
-0.08175467, 0.3529792, -1.137505, 0, 1, 0.8901961, 1,
-0.07957682, 0.8208361, 2.122498, 0, 1, 0.8980392, 1,
-0.07315751, 0.9219129, 0.07203001, 0, 1, 0.9058824, 1,
-0.06789873, -0.0474259, -1.641234, 0, 1, 0.9098039, 1,
-0.06726309, -1.534554, -3.191836, 0, 1, 0.9176471, 1,
-0.06144436, -0.003432062, -2.479226, 0, 1, 0.9215686, 1,
-0.06111445, 0.232357, 0.4094611, 0, 1, 0.9294118, 1,
-0.05777788, -0.2801772, -2.504887, 0, 1, 0.9333333, 1,
-0.05615546, -1.188471, -2.750819, 0, 1, 0.9411765, 1,
-0.05562522, -0.3373503, -3.22174, 0, 1, 0.945098, 1,
-0.05489179, 1.572838, 0.8580847, 0, 1, 0.9529412, 1,
-0.05059547, 0.4973431, -0.26921, 0, 1, 0.9568627, 1,
-0.04862721, 0.6315343, 1.534842, 0, 1, 0.9647059, 1,
-0.04849558, 0.01035594, -1.134839, 0, 1, 0.9686275, 1,
-0.04812336, -0.6695321, -3.797144, 0, 1, 0.9764706, 1,
-0.04811219, -0.2101134, -2.620934, 0, 1, 0.9803922, 1,
-0.04600986, 0.3597356, -1.023007, 0, 1, 0.9882353, 1,
-0.04541726, 0.8061002, -0.4701341, 0, 1, 0.9921569, 1,
-0.04514569, 0.4413261, -0.6076862, 0, 1, 1, 1,
-0.04441568, 0.9136312, -1.829983, 0, 0.9921569, 1, 1,
-0.04334212, -0.5364968, -2.896588, 0, 0.9882353, 1, 1,
-0.03897006, -0.4892733, -0.9700525, 0, 0.9803922, 1, 1,
-0.03250705, -0.7817462, -3.86358, 0, 0.9764706, 1, 1,
-0.03004176, 2.556567, -0.8571585, 0, 0.9686275, 1, 1,
-0.02421541, 0.4760176, 0.6080537, 0, 0.9647059, 1, 1,
-0.02417429, 0.3598654, -0.03314611, 0, 0.9568627, 1, 1,
-0.02325699, -0.5760699, -1.432678, 0, 0.9529412, 1, 1,
-0.02025924, -0.2998685, -2.393357, 0, 0.945098, 1, 1,
-0.01736917, -0.1383725, -3.731176, 0, 0.9411765, 1, 1,
-0.01626961, -2.092566, -4.371592, 0, 0.9333333, 1, 1,
-0.01231613, 1.593229, 0.4564677, 0, 0.9294118, 1, 1,
-0.00232351, -0.6387214, -3.697172, 0, 0.9215686, 1, 1,
0.001997639, -0.3712115, 3.502685, 0, 0.9176471, 1, 1,
0.003300681, 1.152444, 1.05317, 0, 0.9098039, 1, 1,
0.008187924, 0.6644979, 0.2419763, 0, 0.9058824, 1, 1,
0.01131357, 0.9505509, 1.945327, 0, 0.8980392, 1, 1,
0.01400713, -2.861851, 3.641961, 0, 0.8901961, 1, 1,
0.01995488, 0.5585054, -0.06547709, 0, 0.8862745, 1, 1,
0.02057521, -0.2726887, 3.021067, 0, 0.8784314, 1, 1,
0.020859, 0.23979, -0.4831517, 0, 0.8745098, 1, 1,
0.02149107, -0.493774, 2.416139, 0, 0.8666667, 1, 1,
0.02161457, 0.01902847, 1.285903, 0, 0.8627451, 1, 1,
0.02237499, 0.01422963, 0.1253676, 0, 0.854902, 1, 1,
0.02592758, 0.2120427, -1.020706, 0, 0.8509804, 1, 1,
0.02661574, -0.7271732, 2.128894, 0, 0.8431373, 1, 1,
0.02948584, -0.6491591, 3.010421, 0, 0.8392157, 1, 1,
0.03171799, 0.743544, -1.080287, 0, 0.8313726, 1, 1,
0.03308933, -2.144388, 2.886971, 0, 0.827451, 1, 1,
0.04023382, -0.06109462, 3.759062, 0, 0.8196079, 1, 1,
0.04768452, 0.6387574, 0.4906231, 0, 0.8156863, 1, 1,
0.05315441, -1.393081, 4.756691, 0, 0.8078431, 1, 1,
0.05419904, -0.2117494, 3.634192, 0, 0.8039216, 1, 1,
0.05780298, -0.1185905, 2.60401, 0, 0.7960784, 1, 1,
0.05786097, 0.3767441, -1.821862, 0, 0.7882353, 1, 1,
0.05885438, -0.5325246, 2.424951, 0, 0.7843137, 1, 1,
0.05903104, 0.08103245, -0.03075473, 0, 0.7764706, 1, 1,
0.05962698, -0.1901414, 2.938153, 0, 0.772549, 1, 1,
0.06050337, -0.5023642, 3.431324, 0, 0.7647059, 1, 1,
0.06476488, -0.8699761, 2.970677, 0, 0.7607843, 1, 1,
0.06601249, 0.1729581, 0.08003397, 0, 0.7529412, 1, 1,
0.06634091, 0.4461755, 1.136477, 0, 0.7490196, 1, 1,
0.06945974, -1.018018, 3.435766, 0, 0.7411765, 1, 1,
0.06982475, -0.6024042, 2.541338, 0, 0.7372549, 1, 1,
0.07197808, -0.9040948, 4.117463, 0, 0.7294118, 1, 1,
0.07769771, 0.3162853, 2.932748, 0, 0.7254902, 1, 1,
0.0777954, -0.710224, 3.519668, 0, 0.7176471, 1, 1,
0.07935226, 0.03628781, -0.07221355, 0, 0.7137255, 1, 1,
0.08171087, 0.8498442, -0.6293615, 0, 0.7058824, 1, 1,
0.08408879, -0.2217081, 2.574301, 0, 0.6980392, 1, 1,
0.08700393, -0.1149229, 1.556316, 0, 0.6941177, 1, 1,
0.09244752, 1.293554, 0.2558059, 0, 0.6862745, 1, 1,
0.09318776, 0.9395046, -0.398282, 0, 0.682353, 1, 1,
0.09415966, -0.7616905, 2.77034, 0, 0.6745098, 1, 1,
0.09602094, -0.6703403, 1.761653, 0, 0.6705883, 1, 1,
0.09677488, 1.164315, -0.118759, 0, 0.6627451, 1, 1,
0.09979516, -1.304708, 2.336792, 0, 0.6588235, 1, 1,
0.1013101, 0.3552409, -0.05316515, 0, 0.6509804, 1, 1,
0.1080477, 1.044263, 0.2485988, 0, 0.6470588, 1, 1,
0.1082451, 0.02160105, 1.454312, 0, 0.6392157, 1, 1,
0.1106627, -0.3684908, 4.867447, 0, 0.6352941, 1, 1,
0.1125247, -0.2566744, 3.548895, 0, 0.627451, 1, 1,
0.1137784, 0.9731528, 1.620014, 0, 0.6235294, 1, 1,
0.1178653, -0.348691, 3.298659, 0, 0.6156863, 1, 1,
0.1220322, 0.064402, 0.1215732, 0, 0.6117647, 1, 1,
0.1220888, 0.642527, 1.471618, 0, 0.6039216, 1, 1,
0.1235089, -0.7249054, 2.750932, 0, 0.5960785, 1, 1,
0.1235925, -0.0209734, 0.2895747, 0, 0.5921569, 1, 1,
0.1269957, -0.8172095, 3.412401, 0, 0.5843138, 1, 1,
0.1276211, 2.419131, -0.7336078, 0, 0.5803922, 1, 1,
0.1291815, 1.71177, -1.416455, 0, 0.572549, 1, 1,
0.1292269, 0.7780573, -1.761129, 0, 0.5686275, 1, 1,
0.1323148, -0.3644072, 1.943551, 0, 0.5607843, 1, 1,
0.1435811, -0.8111005, 2.913115, 0, 0.5568628, 1, 1,
0.14611, -0.6531848, 3.735075, 0, 0.5490196, 1, 1,
0.1542667, 0.2935209, 0.4232653, 0, 0.5450981, 1, 1,
0.1556023, -0.6732818, 1.872504, 0, 0.5372549, 1, 1,
0.1558793, 0.265659, -0.3195109, 0, 0.5333334, 1, 1,
0.1590199, 0.1297369, 2.978805, 0, 0.5254902, 1, 1,
0.160941, 0.2600307, 0.5432807, 0, 0.5215687, 1, 1,
0.1615571, -0.4991787, 1.561856, 0, 0.5137255, 1, 1,
0.1623681, -1.058362, 4.183701, 0, 0.509804, 1, 1,
0.1645715, -1.064391, 3.700848, 0, 0.5019608, 1, 1,
0.1655979, 0.4570117, -0.8394848, 0, 0.4941176, 1, 1,
0.1669458, 0.5853636, 1.187191, 0, 0.4901961, 1, 1,
0.1786462, -0.285726, 1.132541, 0, 0.4823529, 1, 1,
0.1796523, 0.5113632, 1.752062, 0, 0.4784314, 1, 1,
0.182658, 1.97839, 0.3107578, 0, 0.4705882, 1, 1,
0.1853834, 0.1328145, 0.8997311, 0, 0.4666667, 1, 1,
0.1871323, -1.701558, 1.124012, 0, 0.4588235, 1, 1,
0.1925386, -0.2467662, 2.048621, 0, 0.454902, 1, 1,
0.1957143, -0.2072198, 2.107078, 0, 0.4470588, 1, 1,
0.1993319, -0.04187191, 2.157382, 0, 0.4431373, 1, 1,
0.2001249, 1.240627, 2.089278, 0, 0.4352941, 1, 1,
0.2083116, 0.7913074, 0.8879175, 0, 0.4313726, 1, 1,
0.2090721, -0.1651443, 2.398662, 0, 0.4235294, 1, 1,
0.2217369, 0.7517508, -0.5136315, 0, 0.4196078, 1, 1,
0.2250351, 0.1841813, 1.231722, 0, 0.4117647, 1, 1,
0.2282368, 0.2530705, 2.212182, 0, 0.4078431, 1, 1,
0.2313261, -1.300708, 2.607181, 0, 0.4, 1, 1,
0.2315509, 0.0329233, 0.4571088, 0, 0.3921569, 1, 1,
0.2352062, 0.8594418, 0.9038426, 0, 0.3882353, 1, 1,
0.2393442, 0.5179723, 1.901431, 0, 0.3803922, 1, 1,
0.2410228, -1.208836, 2.277373, 0, 0.3764706, 1, 1,
0.2512762, -0.5790474, 3.497897, 0, 0.3686275, 1, 1,
0.2593862, 0.5725891, 0.1066338, 0, 0.3647059, 1, 1,
0.2635905, -0.9000548, 3.864038, 0, 0.3568628, 1, 1,
0.2663215, 0.6344716, 1.695182, 0, 0.3529412, 1, 1,
0.2792529, 0.2958059, 0.4331418, 0, 0.345098, 1, 1,
0.2856585, -1.701091, 3.334548, 0, 0.3411765, 1, 1,
0.2887675, -1.67649, 1.906779, 0, 0.3333333, 1, 1,
0.2911259, -1.827088, 4.551336, 0, 0.3294118, 1, 1,
0.2954392, 0.5297903, 0.1530489, 0, 0.3215686, 1, 1,
0.3027162, 1.898865, 1.037707, 0, 0.3176471, 1, 1,
0.3054521, 1.360019, 1.536835, 0, 0.3098039, 1, 1,
0.3121247, -0.6845444, 3.271376, 0, 0.3058824, 1, 1,
0.3129234, -0.06111724, 1.611905, 0, 0.2980392, 1, 1,
0.3141258, -0.5776336, 2.984608, 0, 0.2901961, 1, 1,
0.3193183, -0.5760204, 2.796512, 0, 0.2862745, 1, 1,
0.321276, -0.7894067, 4.154278, 0, 0.2784314, 1, 1,
0.3231347, -0.9249995, 2.510181, 0, 0.2745098, 1, 1,
0.3236765, -0.7111121, 3.530343, 0, 0.2666667, 1, 1,
0.3271395, -1.124582, 2.335009, 0, 0.2627451, 1, 1,
0.3277296, -0.3472828, 1.957697, 0, 0.254902, 1, 1,
0.3350297, 1.159065, 0.8026132, 0, 0.2509804, 1, 1,
0.3383657, -0.35373, 2.413867, 0, 0.2431373, 1, 1,
0.3390759, -2.152023, 2.519181, 0, 0.2392157, 1, 1,
0.3404958, -0.7531453, 2.871472, 0, 0.2313726, 1, 1,
0.3418609, 1.096471, 0.6535439, 0, 0.227451, 1, 1,
0.3422453, 0.6042584, 0.9511922, 0, 0.2196078, 1, 1,
0.3441552, 0.521997, 0.7645173, 0, 0.2156863, 1, 1,
0.3464623, 0.8906716, 1.762977, 0, 0.2078431, 1, 1,
0.3488149, 0.7281331, 0.237714, 0, 0.2039216, 1, 1,
0.3505867, -0.9909976, 3.322606, 0, 0.1960784, 1, 1,
0.3511294, -1.597745, 4.039313, 0, 0.1882353, 1, 1,
0.3534262, 3.581965, 2.729961, 0, 0.1843137, 1, 1,
0.3549434, -1.888813, 3.531287, 0, 0.1764706, 1, 1,
0.3568807, 1.966448, -0.2897513, 0, 0.172549, 1, 1,
0.3647138, -0.6656058, 5.187831, 0, 0.1647059, 1, 1,
0.3760137, 0.6655226, 1.905754, 0, 0.1607843, 1, 1,
0.3765701, -2.951118, 3.677258, 0, 0.1529412, 1, 1,
0.3773146, -0.9735876, 3.539883, 0, 0.1490196, 1, 1,
0.3838959, 1.405564, 0.9004197, 0, 0.1411765, 1, 1,
0.3885189, -0.5219277, 1.748881, 0, 0.1372549, 1, 1,
0.3898463, -1.205915, 2.952508, 0, 0.1294118, 1, 1,
0.3930033, 1.159991, 0.6244884, 0, 0.1254902, 1, 1,
0.3959098, -0.2035902, 1.857152, 0, 0.1176471, 1, 1,
0.3983279, 1.376033, 2.103872, 0, 0.1137255, 1, 1,
0.3992445, -0.7412121, 2.225816, 0, 0.1058824, 1, 1,
0.4000256, -0.1195839, 1.046562, 0, 0.09803922, 1, 1,
0.4017343, -0.1826477, -0.1364785, 0, 0.09411765, 1, 1,
0.4050072, -0.0259451, 2.938118, 0, 0.08627451, 1, 1,
0.4062402, -0.7532659, 3.222506, 0, 0.08235294, 1, 1,
0.4122227, 1.939352, 1.757853, 0, 0.07450981, 1, 1,
0.4177739, 0.69556, 0.1782363, 0, 0.07058824, 1, 1,
0.4261396, -0.6282921, 2.634516, 0, 0.0627451, 1, 1,
0.4264873, 0.2043864, 0.8377861, 0, 0.05882353, 1, 1,
0.4296988, 0.1536572, 1.359723, 0, 0.05098039, 1, 1,
0.4342903, -0.4821681, 1.488828, 0, 0.04705882, 1, 1,
0.4360752, 1.065518, 0.1169353, 0, 0.03921569, 1, 1,
0.4370265, 0.637675, -0.3882754, 0, 0.03529412, 1, 1,
0.4448235, -0.6877665, 2.530568, 0, 0.02745098, 1, 1,
0.4466606, 1.752254, -0.7739987, 0, 0.02352941, 1, 1,
0.447213, 1.456111, 0.007960844, 0, 0.01568628, 1, 1,
0.4525011, -1.496714, 4.186036, 0, 0.01176471, 1, 1,
0.4535161, -0.07083075, 1.721187, 0, 0.003921569, 1, 1,
0.4601137, -1.058241, 3.151446, 0.003921569, 0, 1, 1,
0.4653882, 1.346278, -0.06488211, 0.007843138, 0, 1, 1,
0.4688157, -0.7126046, 1.825521, 0.01568628, 0, 1, 1,
0.474728, 1.347887, 0.03153116, 0.01960784, 0, 1, 1,
0.4762932, 1.654102, -0.4540152, 0.02745098, 0, 1, 1,
0.4824714, -0.2121707, 1.355194, 0.03137255, 0, 1, 1,
0.4843315, -0.2431285, 2.827234, 0.03921569, 0, 1, 1,
0.4852349, 0.7558126, -0.2481386, 0.04313726, 0, 1, 1,
0.4866785, 0.7848579, -0.7560955, 0.05098039, 0, 1, 1,
0.489256, -0.9630424, 3.763928, 0.05490196, 0, 1, 1,
0.5023407, 0.04056389, 2.43865, 0.0627451, 0, 1, 1,
0.5026286, 0.5470422, -0.5048237, 0.06666667, 0, 1, 1,
0.5046759, -0.7278295, 5.42851, 0.07450981, 0, 1, 1,
0.5075346, 0.8380682, 1.272189, 0.07843138, 0, 1, 1,
0.5128132, 1.64402, 1.923475, 0.08627451, 0, 1, 1,
0.5194203, -1.545664, 1.331019, 0.09019608, 0, 1, 1,
0.5251302, -0.7811688, 3.671231, 0.09803922, 0, 1, 1,
0.5309873, 0.3807276, -0.1498346, 0.1058824, 0, 1, 1,
0.5332903, 0.02682888, 1.029572, 0.1098039, 0, 1, 1,
0.5387867, -0.6562294, 4.307692, 0.1176471, 0, 1, 1,
0.5399262, -0.5565463, 4.041653, 0.1215686, 0, 1, 1,
0.5422601, -0.1206827, 2.654184, 0.1294118, 0, 1, 1,
0.5437137, 1.815698, -0.1913681, 0.1333333, 0, 1, 1,
0.5452614, 0.4197026, -0.4539368, 0.1411765, 0, 1, 1,
0.5526332, 0.1097691, 1.458326, 0.145098, 0, 1, 1,
0.5535953, -0.3285754, 3.894767, 0.1529412, 0, 1, 1,
0.5566422, 0.722876, 0.9163224, 0.1568628, 0, 1, 1,
0.558573, -1.183867, 1.836263, 0.1647059, 0, 1, 1,
0.561335, 1.064485, -1.11204, 0.1686275, 0, 1, 1,
0.5624102, -0.4537763, 1.294647, 0.1764706, 0, 1, 1,
0.5638003, -1.009693, 3.441453, 0.1803922, 0, 1, 1,
0.5722811, -2.451024, 3.061719, 0.1882353, 0, 1, 1,
0.5766554, 0.85492, 0.09792983, 0.1921569, 0, 1, 1,
0.577606, 1.916304, 0.754998, 0.2, 0, 1, 1,
0.5805417, 0.08169398, 1.623868, 0.2078431, 0, 1, 1,
0.583347, -1.340254, 3.11183, 0.2117647, 0, 1, 1,
0.5910977, -0.1217442, 1.355125, 0.2196078, 0, 1, 1,
0.5936196, 0.5452616, 0.4228283, 0.2235294, 0, 1, 1,
0.5936507, -0.6977499, 1.770022, 0.2313726, 0, 1, 1,
0.5963098, -0.6440807, 1.581303, 0.2352941, 0, 1, 1,
0.5995512, -0.5172019, 1.505483, 0.2431373, 0, 1, 1,
0.6018526, -1.032085, 1.92365, 0.2470588, 0, 1, 1,
0.6019768, 1.383959, -0.8409519, 0.254902, 0, 1, 1,
0.6054134, 1.920561, -0.4383985, 0.2588235, 0, 1, 1,
0.6067957, 0.7821712, 1.049046, 0.2666667, 0, 1, 1,
0.6114164, 0.3180413, 0.41306, 0.2705882, 0, 1, 1,
0.6155086, 1.680444, 1.106763, 0.2784314, 0, 1, 1,
0.6228257, 1.025295, 0.05904103, 0.282353, 0, 1, 1,
0.6241242, 0.6221361, 1.301402, 0.2901961, 0, 1, 1,
0.6245916, 0.5880408, -0.4494185, 0.2941177, 0, 1, 1,
0.6247419, 0.7292427, 0.5965896, 0.3019608, 0, 1, 1,
0.6253852, -1.186013, 3.540258, 0.3098039, 0, 1, 1,
0.6283559, -0.2760611, 3.050953, 0.3137255, 0, 1, 1,
0.6289975, 0.9901932, 1.504975, 0.3215686, 0, 1, 1,
0.6295266, -0.5569516, 2.086698, 0.3254902, 0, 1, 1,
0.6305642, 0.04151835, 0.8486739, 0.3333333, 0, 1, 1,
0.6313013, 0.05609316, 1.506498, 0.3372549, 0, 1, 1,
0.6321045, 0.2124895, 0.3364386, 0.345098, 0, 1, 1,
0.6337913, -0.2734756, 1.455294, 0.3490196, 0, 1, 1,
0.6411431, 1.391195, -0.5201944, 0.3568628, 0, 1, 1,
0.649545, -0.2927287, 1.998007, 0.3607843, 0, 1, 1,
0.6571822, 0.5711113, 2.821052, 0.3686275, 0, 1, 1,
0.6573074, -0.9211268, 2.685616, 0.372549, 0, 1, 1,
0.664785, 0.1368631, 2.332723, 0.3803922, 0, 1, 1,
0.6691689, 0.4352967, -0.07940313, 0.3843137, 0, 1, 1,
0.6704752, -1.299527, 2.427626, 0.3921569, 0, 1, 1,
0.6719363, -1.278113, 1.822762, 0.3960784, 0, 1, 1,
0.6732004, 1.420982, -0.392229, 0.4039216, 0, 1, 1,
0.674917, 2.337556, -0.737389, 0.4117647, 0, 1, 1,
0.6763837, 0.1103709, 0.6246924, 0.4156863, 0, 1, 1,
0.6794063, 0.3306131, 1.31171, 0.4235294, 0, 1, 1,
0.6804866, 0.2896722, 1.46898, 0.427451, 0, 1, 1,
0.6805811, -1.080509, 2.326939, 0.4352941, 0, 1, 1,
0.683021, -0.5324084, 4.282105, 0.4392157, 0, 1, 1,
0.6839632, 1.032866, 0.8901558, 0.4470588, 0, 1, 1,
0.6865323, -0.1458178, 2.985376, 0.4509804, 0, 1, 1,
0.6895804, 0.4313118, 1.652077, 0.4588235, 0, 1, 1,
0.6929275, 2.089069, -0.9225816, 0.4627451, 0, 1, 1,
0.6941125, 0.1821577, 0.3952177, 0.4705882, 0, 1, 1,
0.6942345, 2.249999, 0.9789102, 0.4745098, 0, 1, 1,
0.6951833, -1.992676, 2.271421, 0.4823529, 0, 1, 1,
0.6978916, -0.65229, 1.168757, 0.4862745, 0, 1, 1,
0.6981981, 2.353201, 0.321773, 0.4941176, 0, 1, 1,
0.7022818, -0.0625212, 0.6116125, 0.5019608, 0, 1, 1,
0.7024435, 1.771548, 0.8762403, 0.5058824, 0, 1, 1,
0.7030903, -0.09208055, 1.660846, 0.5137255, 0, 1, 1,
0.7058349, -0.874562, 2.675566, 0.5176471, 0, 1, 1,
0.7066268, -0.7328455, -0.9785532, 0.5254902, 0, 1, 1,
0.709717, 0.494428, 0.615491, 0.5294118, 0, 1, 1,
0.711167, -1.153381, 3.782485, 0.5372549, 0, 1, 1,
0.7177024, -0.9662426, 1.64667, 0.5411765, 0, 1, 1,
0.7206548, -0.1944131, 1.982648, 0.5490196, 0, 1, 1,
0.7255661, 1.27983, 0.04426613, 0.5529412, 0, 1, 1,
0.727551, 1.231138, -0.6336477, 0.5607843, 0, 1, 1,
0.7357398, -1.068835, 1.458538, 0.5647059, 0, 1, 1,
0.7423705, -2.811777, 2.170441, 0.572549, 0, 1, 1,
0.7466208, 0.2783959, 1.578408, 0.5764706, 0, 1, 1,
0.7497866, 0.4144991, 1.35529, 0.5843138, 0, 1, 1,
0.7587065, -0.4191392, 1.174081, 0.5882353, 0, 1, 1,
0.7607299, -0.5179839, 3.886787, 0.5960785, 0, 1, 1,
0.7677348, 0.9048569, 0.3181721, 0.6039216, 0, 1, 1,
0.7720297, -0.4737889, 2.380844, 0.6078432, 0, 1, 1,
0.7726982, -0.7665994, -0.6813649, 0.6156863, 0, 1, 1,
0.7829126, -0.2671933, 0.2292921, 0.6196079, 0, 1, 1,
0.7866554, 0.7611809, 1.761845, 0.627451, 0, 1, 1,
0.7883626, -1.488714, 1.867734, 0.6313726, 0, 1, 1,
0.7988539, -1.210306, 3.756255, 0.6392157, 0, 1, 1,
0.8018614, -0.3739788, 0.02797144, 0.6431373, 0, 1, 1,
0.8022934, 0.1295418, 1.196988, 0.6509804, 0, 1, 1,
0.8025863, 0.5650371, 0.3430557, 0.654902, 0, 1, 1,
0.8053383, 0.6991802, 0.7332238, 0.6627451, 0, 1, 1,
0.8058344, 0.1790749, 1.164046, 0.6666667, 0, 1, 1,
0.8060148, -0.7208427, 3.180775, 0.6745098, 0, 1, 1,
0.8076854, -1.383759, 3.38041, 0.6784314, 0, 1, 1,
0.8105896, 0.5336913, 2.655487, 0.6862745, 0, 1, 1,
0.8199009, -0.2658309, 0.2951362, 0.6901961, 0, 1, 1,
0.8208316, -0.694675, 3.202749, 0.6980392, 0, 1, 1,
0.8212218, -1.274686, 3.653715, 0.7058824, 0, 1, 1,
0.8214697, -0.1146997, 3.420246, 0.7098039, 0, 1, 1,
0.8242676, 0.5767273, 2.040705, 0.7176471, 0, 1, 1,
0.8245274, -0.006406955, 2.641465, 0.7215686, 0, 1, 1,
0.8301722, 0.4672821, 0.3699757, 0.7294118, 0, 1, 1,
0.8308844, 0.7353957, 1.844328, 0.7333333, 0, 1, 1,
0.8317561, 0.383326, 0.1812496, 0.7411765, 0, 1, 1,
0.8347254, 1.535015, 1.570188, 0.7450981, 0, 1, 1,
0.8350884, 0.4661832, 2.352237, 0.7529412, 0, 1, 1,
0.838927, -0.01638446, 1.19706, 0.7568628, 0, 1, 1,
0.8427938, -1.420372, 3.932114, 0.7647059, 0, 1, 1,
0.8478082, 0.1631462, 1.632304, 0.7686275, 0, 1, 1,
0.8481578, -0.4156534, 2.339412, 0.7764706, 0, 1, 1,
0.848756, 1.069452, 0.5154136, 0.7803922, 0, 1, 1,
0.8521596, 0.9450643, 1.230114, 0.7882353, 0, 1, 1,
0.8532315, -0.2073171, 3.365798, 0.7921569, 0, 1, 1,
0.8612235, -1.295647, 2.987355, 0.8, 0, 1, 1,
0.8618847, 0.3702515, 2.00392, 0.8078431, 0, 1, 1,
0.8652121, 0.979008, 3.34591, 0.8117647, 0, 1, 1,
0.8706164, -0.05760698, 2.184391, 0.8196079, 0, 1, 1,
0.8742901, -0.404188, 2.215996, 0.8235294, 0, 1, 1,
0.8857239, 1.978224, -1.220218, 0.8313726, 0, 1, 1,
0.8972842, -1.560587, 2.516975, 0.8352941, 0, 1, 1,
0.9050866, -0.7466395, 2.915056, 0.8431373, 0, 1, 1,
0.9058878, -0.9954393, 2.807073, 0.8470588, 0, 1, 1,
0.9062513, 0.8014145, 0.8331513, 0.854902, 0, 1, 1,
0.9076675, -0.6077728, 3.305489, 0.8588235, 0, 1, 1,
0.9103504, 0.9447179, 0.01403061, 0.8666667, 0, 1, 1,
0.9113806, 1.36591, -0.5816587, 0.8705882, 0, 1, 1,
0.9121897, 0.1222893, 0.6963137, 0.8784314, 0, 1, 1,
0.91491, -0.8229282, 3.79618, 0.8823529, 0, 1, 1,
0.9269494, -0.6160803, 3.046882, 0.8901961, 0, 1, 1,
0.9278435, 1.952932, -0.2338125, 0.8941177, 0, 1, 1,
0.9298345, -1.497923, 1.864802, 0.9019608, 0, 1, 1,
0.9315318, 0.9706209, 2.174211, 0.9098039, 0, 1, 1,
0.9393858, 0.4484704, -0.2151366, 0.9137255, 0, 1, 1,
0.9436243, 1.153619, -0.8003131, 0.9215686, 0, 1, 1,
0.9449924, -0.1187412, 0.8193225, 0.9254902, 0, 1, 1,
0.9471265, 0.2883746, -0.2182616, 0.9333333, 0, 1, 1,
0.9543498, -1.822556, 1.818983, 0.9372549, 0, 1, 1,
0.9638661, -0.798001, 1.964131, 0.945098, 0, 1, 1,
0.9646704, -1.029639, 1.605533, 0.9490196, 0, 1, 1,
0.9687484, -0.3046, 3.329152, 0.9568627, 0, 1, 1,
0.9714129, -2.615683, 1.605346, 0.9607843, 0, 1, 1,
0.9755018, 0.1860441, 0.9836577, 0.9686275, 0, 1, 1,
0.9779579, 0.2765322, 0.9268171, 0.972549, 0, 1, 1,
0.9800405, -0.5631734, 1.382113, 0.9803922, 0, 1, 1,
0.9858304, -0.9490204, 1.474492, 0.9843137, 0, 1, 1,
0.9968886, -0.5234345, 4.564022, 0.9921569, 0, 1, 1,
1.003657, -0.7912492, 2.163091, 0.9960784, 0, 1, 1,
1.005108, 0.5359011, 1.034151, 1, 0, 0.9960784, 1,
1.005743, 0.08786952, 1.27076, 1, 0, 0.9882353, 1,
1.010761, 0.1688851, -0.2672164, 1, 0, 0.9843137, 1,
1.013333, 1.557205, -0.2976847, 1, 0, 0.9764706, 1,
1.017808, -0.0779232, 4.114854, 1, 0, 0.972549, 1,
1.0194, 2.460319, 0.6976531, 1, 0, 0.9647059, 1,
1.021606, 1.173316, 1.151866, 1, 0, 0.9607843, 1,
1.027743, -0.8744534, 2.643101, 1, 0, 0.9529412, 1,
1.02905, 0.02695887, 1.725731, 1, 0, 0.9490196, 1,
1.029455, 1.017847, 0.9999703, 1, 0, 0.9411765, 1,
1.02964, -0.7668476, 2.971073, 1, 0, 0.9372549, 1,
1.033414, 0.3660026, 1.217743, 1, 0, 0.9294118, 1,
1.040282, 1.11372, 0.1351277, 1, 0, 0.9254902, 1,
1.042652, -1.352211, 3.29034, 1, 0, 0.9176471, 1,
1.043575, 0.1515303, -0.695335, 1, 0, 0.9137255, 1,
1.048826, 0.4903299, 0.783725, 1, 0, 0.9058824, 1,
1.052858, -0.1085931, 2.889959, 1, 0, 0.9019608, 1,
1.054189, -1.083265, 1.526992, 1, 0, 0.8941177, 1,
1.060578, -0.8990582, 2.575213, 1, 0, 0.8862745, 1,
1.062111, 2.341177, -0.3195717, 1, 0, 0.8823529, 1,
1.065531, -0.9800156, 1.471162, 1, 0, 0.8745098, 1,
1.077129, -1.108478, 2.433609, 1, 0, 0.8705882, 1,
1.082149, 1.249504, 0.4003021, 1, 0, 0.8627451, 1,
1.08684, -0.6426293, 3.119077, 1, 0, 0.8588235, 1,
1.092583, -0.5249375, 1.800783, 1, 0, 0.8509804, 1,
1.09675, 0.8044168, 0.2992001, 1, 0, 0.8470588, 1,
1.099836, -0.08403549, -0.5118153, 1, 0, 0.8392157, 1,
1.113035, -0.1504918, 0.9170866, 1, 0, 0.8352941, 1,
1.119118, -0.476463, 1.898927, 1, 0, 0.827451, 1,
1.119897, 0.2422879, 0.3261442, 1, 0, 0.8235294, 1,
1.123366, 0.8073192, 2.058672, 1, 0, 0.8156863, 1,
1.127056, -0.3759623, 3.181716, 1, 0, 0.8117647, 1,
1.127961, -0.1216079, 2.298253, 1, 0, 0.8039216, 1,
1.137127, -0.1622437, 1.814544, 1, 0, 0.7960784, 1,
1.147038, 1.360924, -0.3459998, 1, 0, 0.7921569, 1,
1.147674, -0.9890889, 1.499941, 1, 0, 0.7843137, 1,
1.159408, 1.040777, 0.5940709, 1, 0, 0.7803922, 1,
1.159415, 0.6259477, 2.078882, 1, 0, 0.772549, 1,
1.165859, -1.235184, 1.617964, 1, 0, 0.7686275, 1,
1.171519, -0.3114051, 0.3091774, 1, 0, 0.7607843, 1,
1.176878, -0.5919109, 0.8482649, 1, 0, 0.7568628, 1,
1.179509, 0.5436629, -1.755579, 1, 0, 0.7490196, 1,
1.180198, -1.152463, -0.1141828, 1, 0, 0.7450981, 1,
1.18175, -1.607039, 2.168875, 1, 0, 0.7372549, 1,
1.182384, 0.2660201, 0.2376578, 1, 0, 0.7333333, 1,
1.184014, 0.8106817, 1.640041, 1, 0, 0.7254902, 1,
1.197953, -0.7078264, 1.749121, 1, 0, 0.7215686, 1,
1.200066, 0.1461097, 0.9020081, 1, 0, 0.7137255, 1,
1.202259, 0.7979464, -0.39564, 1, 0, 0.7098039, 1,
1.203528, 0.6953644, 1.486005, 1, 0, 0.7019608, 1,
1.203659, -0.9499106, 1.125118, 1, 0, 0.6941177, 1,
1.207334, -0.3400066, 2.602354, 1, 0, 0.6901961, 1,
1.218297, -1.621258, 2.666645, 1, 0, 0.682353, 1,
1.223883, -1.675404, 2.91999, 1, 0, 0.6784314, 1,
1.224369, 0.1815598, 1.139328, 1, 0, 0.6705883, 1,
1.224418, 1.320959, 1.907001, 1, 0, 0.6666667, 1,
1.227152, -0.7923911, 2.129232, 1, 0, 0.6588235, 1,
1.2325, -0.1308754, 1.921059, 1, 0, 0.654902, 1,
1.236966, 0.1577194, 2.549532, 1, 0, 0.6470588, 1,
1.238498, -0.1518895, 1.719006, 1, 0, 0.6431373, 1,
1.239144, -1.304723, 2.019562, 1, 0, 0.6352941, 1,
1.241096, -1.009901, 1.41745, 1, 0, 0.6313726, 1,
1.24248, 0.09574854, 0.9566642, 1, 0, 0.6235294, 1,
1.253633, -0.4937857, 2.675261, 1, 0, 0.6196079, 1,
1.254184, -0.6530217, 1.678082, 1, 0, 0.6117647, 1,
1.257954, -0.1703324, 0.450636, 1, 0, 0.6078432, 1,
1.269807, -0.08659738, 1.028938, 1, 0, 0.6, 1,
1.27116, 0.5597229, 0.6891527, 1, 0, 0.5921569, 1,
1.277655, -1.513455, 2.48668, 1, 0, 0.5882353, 1,
1.294234, -0.9158298, 3.699802, 1, 0, 0.5803922, 1,
1.294597, -1.343413, 2.170092, 1, 0, 0.5764706, 1,
1.306363, -0.6892448, 2.826375, 1, 0, 0.5686275, 1,
1.318244, -0.901399, 3.354284, 1, 0, 0.5647059, 1,
1.321799, 0.6768203, -0.1586926, 1, 0, 0.5568628, 1,
1.327512, 1.497844, 1.518825, 1, 0, 0.5529412, 1,
1.35554, 0.934676, 1.296561, 1, 0, 0.5450981, 1,
1.361772, -1.716629, 2.083225, 1, 0, 0.5411765, 1,
1.375313, 0.8778046, 1.37997, 1, 0, 0.5333334, 1,
1.378719, -0.5053104, 0.6203225, 1, 0, 0.5294118, 1,
1.38039, -0.6879093, 4.331148, 1, 0, 0.5215687, 1,
1.382599, -1.559955, 2.892937, 1, 0, 0.5176471, 1,
1.387548, -1.652472, 2.29368, 1, 0, 0.509804, 1,
1.393102, 0.6591532, 1.082674, 1, 0, 0.5058824, 1,
1.395864, -0.5114819, 2.910053, 1, 0, 0.4980392, 1,
1.4024, 0.8873111, 1.443351, 1, 0, 0.4901961, 1,
1.43203, 0.2168031, 0.9020858, 1, 0, 0.4862745, 1,
1.436936, -0.4845394, 2.347173, 1, 0, 0.4784314, 1,
1.448813, -1.957154, 3.710677, 1, 0, 0.4745098, 1,
1.451567, 0.4601114, 2.107417, 1, 0, 0.4666667, 1,
1.469394, -1.911198, 1.823687, 1, 0, 0.4627451, 1,
1.469523, -1.133834, 3.975799, 1, 0, 0.454902, 1,
1.475547, -0.3599225, 1.88202, 1, 0, 0.4509804, 1,
1.482681, 0.4872518, 2.765711, 1, 0, 0.4431373, 1,
1.483479, 0.02870479, 2.393604, 1, 0, 0.4392157, 1,
1.486334, 0.6341952, 0.4088791, 1, 0, 0.4313726, 1,
1.500699, -0.1529844, 0.8530836, 1, 0, 0.427451, 1,
1.509398, -0.3767972, 2.69839, 1, 0, 0.4196078, 1,
1.517836, 1.064697, 1.33169, 1, 0, 0.4156863, 1,
1.526455, 0.8961177, 1.541456, 1, 0, 0.4078431, 1,
1.526523, -0.7441791, 3.72482, 1, 0, 0.4039216, 1,
1.540213, 0.003190948, 1.230078, 1, 0, 0.3960784, 1,
1.54791, 0.8457655, 1.930467, 1, 0, 0.3882353, 1,
1.556392, 1.395533, -0.2810729, 1, 0, 0.3843137, 1,
1.558454, -0.4063689, 1.5069, 1, 0, 0.3764706, 1,
1.583634, -0.0139161, 2.443, 1, 0, 0.372549, 1,
1.600337, 0.7525734, 1.047742, 1, 0, 0.3647059, 1,
1.61759, 0.7330393, -0.2255048, 1, 0, 0.3607843, 1,
1.621318, -0.1728383, 2.435096, 1, 0, 0.3529412, 1,
1.62688, -0.6999316, 0.8666965, 1, 0, 0.3490196, 1,
1.630919, 1.664585, 1.200303, 1, 0, 0.3411765, 1,
1.644163, 0.7824244, 1.726839, 1, 0, 0.3372549, 1,
1.65104, -1.380906, 2.315399, 1, 0, 0.3294118, 1,
1.651738, -1.992098, 1.565104, 1, 0, 0.3254902, 1,
1.666174, -1.604832, 3.153931, 1, 0, 0.3176471, 1,
1.671894, -0.1601481, 1.018649, 1, 0, 0.3137255, 1,
1.680958, -1.15182, 3.166144, 1, 0, 0.3058824, 1,
1.683171, -0.02090621, 2.636242, 1, 0, 0.2980392, 1,
1.693813, -1.502174, 1.999046, 1, 0, 0.2941177, 1,
1.69755, -0.269311, 2.285762, 1, 0, 0.2862745, 1,
1.720047, -0.02282131, 0.3879082, 1, 0, 0.282353, 1,
1.725391, -1.463101, 2.084795, 1, 0, 0.2745098, 1,
1.739461, 1.364905, 0.7153206, 1, 0, 0.2705882, 1,
1.74625, 0.6427792, 2.127299, 1, 0, 0.2627451, 1,
1.759095, 0.544368, 2.409629, 1, 0, 0.2588235, 1,
1.760903, 1.452664, 3.588764, 1, 0, 0.2509804, 1,
1.763209, 0.1971286, 1.046794, 1, 0, 0.2470588, 1,
1.77173, 0.006276035, 1.871297, 1, 0, 0.2392157, 1,
1.821842, -0.6966664, 1.421655, 1, 0, 0.2352941, 1,
1.824423, 0.3220963, 1.060361, 1, 0, 0.227451, 1,
1.825557, -0.1512173, 2.586643, 1, 0, 0.2235294, 1,
1.885245, 1.876414, 1.643625, 1, 0, 0.2156863, 1,
1.896457, -0.006625146, 1.627877, 1, 0, 0.2117647, 1,
1.897525, -0.4934262, 1.551209, 1, 0, 0.2039216, 1,
1.905993, -1.962437, 1.3986, 1, 0, 0.1960784, 1,
1.906686, 0.737152, 0.6840676, 1, 0, 0.1921569, 1,
1.908911, 0.7937235, 1.235421, 1, 0, 0.1843137, 1,
1.912168, 0.8074354, 0.9688132, 1, 0, 0.1803922, 1,
1.920143, 1.332758, 1.418793, 1, 0, 0.172549, 1,
1.924531, 0.284801, 1.064942, 1, 0, 0.1686275, 1,
1.932341, -0.2943974, 1.887762, 1, 0, 0.1607843, 1,
1.961526, -1.736761, 2.328669, 1, 0, 0.1568628, 1,
1.983983, -0.3081373, 1.898968, 1, 0, 0.1490196, 1,
1.998325, -1.66628, 2.384353, 1, 0, 0.145098, 1,
2.008532, -0.06839941, 2.361989, 1, 0, 0.1372549, 1,
2.012644, -0.2678251, 2.45029, 1, 0, 0.1333333, 1,
2.014999, 0.563841, 0.3164091, 1, 0, 0.1254902, 1,
2.017449, -0.07736267, 3.331409, 1, 0, 0.1215686, 1,
2.02553, 0.707664, 1.668231, 1, 0, 0.1137255, 1,
2.070591, -1.453741, 1.976792, 1, 0, 0.1098039, 1,
2.105719, 0.336473, 1.393653, 1, 0, 0.1019608, 1,
2.135353, 0.5403079, 1.264534, 1, 0, 0.09411765, 1,
2.158579, -0.8745643, 1.703068, 1, 0, 0.09019608, 1,
2.20993, -0.06124444, 2.12918, 1, 0, 0.08235294, 1,
2.227843, -1.384989, 1.120066, 1, 0, 0.07843138, 1,
2.238622, -1.122116, 1.11115, 1, 0, 0.07058824, 1,
2.282105, 0.6807911, 3.031116, 1, 0, 0.06666667, 1,
2.384281, -0.4600498, 3.74526, 1, 0, 0.05882353, 1,
2.433736, -0.1622409, 2.050265, 1, 0, 0.05490196, 1,
2.456024, -1.719604, 0.526999, 1, 0, 0.04705882, 1,
2.470265, -1.173684, 3.018092, 1, 0, 0.04313726, 1,
2.538357, 0.04963611, 2.239197, 1, 0, 0.03529412, 1,
2.745778, 0.3640485, 1.491785, 1, 0, 0.03137255, 1,
2.785699, -1.285082, 1.503652, 1, 0, 0.02352941, 1,
2.902384, -0.8851984, -0.08215322, 1, 0, 0.01960784, 1,
2.909182, -1.52609, 1.420593, 1, 0, 0.01176471, 1,
3.407624, 0.6588638, 0.9593306, 1, 0, 0.007843138, 1
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
-0.07035315, -4.345709, -6.429012, 0, -0.5, 0.5, 0.5,
-0.07035315, -4.345709, -6.429012, 1, -0.5, 0.5, 0.5,
-0.07035315, -4.345709, -6.429012, 1, 1.5, 0.5, 0.5,
-0.07035315, -4.345709, -6.429012, 0, 1.5, 0.5, 0.5
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
-4.727364, 0.1926218, -6.429012, 0, -0.5, 0.5, 0.5,
-4.727364, 0.1926218, -6.429012, 1, -0.5, 0.5, 0.5,
-4.727364, 0.1926218, -6.429012, 1, 1.5, 0.5, 0.5,
-4.727364, 0.1926218, -6.429012, 0, 1.5, 0.5, 0.5
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
-4.727364, -4.345709, 0.3590267, 0, -0.5, 0.5, 0.5,
-4.727364, -4.345709, 0.3590267, 1, -0.5, 0.5, 0.5,
-4.727364, -4.345709, 0.3590267, 1, 1.5, 0.5, 0.5,
-4.727364, -4.345709, 0.3590267, 0, 1.5, 0.5, 0.5
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
-3, -3.298402, -4.862541,
3, -3.298402, -4.862541,
-3, -3.298402, -4.862541,
-3, -3.472953, -5.12362,
-2, -3.298402, -4.862541,
-2, -3.472953, -5.12362,
-1, -3.298402, -4.862541,
-1, -3.472953, -5.12362,
0, -3.298402, -4.862541,
0, -3.472953, -5.12362,
1, -3.298402, -4.862541,
1, -3.472953, -5.12362,
2, -3.298402, -4.862541,
2, -3.472953, -5.12362,
3, -3.298402, -4.862541,
3, -3.472953, -5.12362
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
-3, -3.822056, -5.645777, 0, -0.5, 0.5, 0.5,
-3, -3.822056, -5.645777, 1, -0.5, 0.5, 0.5,
-3, -3.822056, -5.645777, 1, 1.5, 0.5, 0.5,
-3, -3.822056, -5.645777, 0, 1.5, 0.5, 0.5,
-2, -3.822056, -5.645777, 0, -0.5, 0.5, 0.5,
-2, -3.822056, -5.645777, 1, -0.5, 0.5, 0.5,
-2, -3.822056, -5.645777, 1, 1.5, 0.5, 0.5,
-2, -3.822056, -5.645777, 0, 1.5, 0.5, 0.5,
-1, -3.822056, -5.645777, 0, -0.5, 0.5, 0.5,
-1, -3.822056, -5.645777, 1, -0.5, 0.5, 0.5,
-1, -3.822056, -5.645777, 1, 1.5, 0.5, 0.5,
-1, -3.822056, -5.645777, 0, 1.5, 0.5, 0.5,
0, -3.822056, -5.645777, 0, -0.5, 0.5, 0.5,
0, -3.822056, -5.645777, 1, -0.5, 0.5, 0.5,
0, -3.822056, -5.645777, 1, 1.5, 0.5, 0.5,
0, -3.822056, -5.645777, 0, 1.5, 0.5, 0.5,
1, -3.822056, -5.645777, 0, -0.5, 0.5, 0.5,
1, -3.822056, -5.645777, 1, -0.5, 0.5, 0.5,
1, -3.822056, -5.645777, 1, 1.5, 0.5, 0.5,
1, -3.822056, -5.645777, 0, 1.5, 0.5, 0.5,
2, -3.822056, -5.645777, 0, -0.5, 0.5, 0.5,
2, -3.822056, -5.645777, 1, -0.5, 0.5, 0.5,
2, -3.822056, -5.645777, 1, 1.5, 0.5, 0.5,
2, -3.822056, -5.645777, 0, 1.5, 0.5, 0.5,
3, -3.822056, -5.645777, 0, -0.5, 0.5, 0.5,
3, -3.822056, -5.645777, 1, -0.5, 0.5, 0.5,
3, -3.822056, -5.645777, 1, 1.5, 0.5, 0.5,
3, -3.822056, -5.645777, 0, 1.5, 0.5, 0.5
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
-3.652669, -3, -4.862541,
-3.652669, 3, -4.862541,
-3.652669, -3, -4.862541,
-3.831785, -3, -5.12362,
-3.652669, -2, -4.862541,
-3.831785, -2, -5.12362,
-3.652669, -1, -4.862541,
-3.831785, -1, -5.12362,
-3.652669, 0, -4.862541,
-3.831785, 0, -5.12362,
-3.652669, 1, -4.862541,
-3.831785, 1, -5.12362,
-3.652669, 2, -4.862541,
-3.831785, 2, -5.12362,
-3.652669, 3, -4.862541,
-3.831785, 3, -5.12362
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
-4.190017, -3, -5.645777, 0, -0.5, 0.5, 0.5,
-4.190017, -3, -5.645777, 1, -0.5, 0.5, 0.5,
-4.190017, -3, -5.645777, 1, 1.5, 0.5, 0.5,
-4.190017, -3, -5.645777, 0, 1.5, 0.5, 0.5,
-4.190017, -2, -5.645777, 0, -0.5, 0.5, 0.5,
-4.190017, -2, -5.645777, 1, -0.5, 0.5, 0.5,
-4.190017, -2, -5.645777, 1, 1.5, 0.5, 0.5,
-4.190017, -2, -5.645777, 0, 1.5, 0.5, 0.5,
-4.190017, -1, -5.645777, 0, -0.5, 0.5, 0.5,
-4.190017, -1, -5.645777, 1, -0.5, 0.5, 0.5,
-4.190017, -1, -5.645777, 1, 1.5, 0.5, 0.5,
-4.190017, -1, -5.645777, 0, 1.5, 0.5, 0.5,
-4.190017, 0, -5.645777, 0, -0.5, 0.5, 0.5,
-4.190017, 0, -5.645777, 1, -0.5, 0.5, 0.5,
-4.190017, 0, -5.645777, 1, 1.5, 0.5, 0.5,
-4.190017, 0, -5.645777, 0, 1.5, 0.5, 0.5,
-4.190017, 1, -5.645777, 0, -0.5, 0.5, 0.5,
-4.190017, 1, -5.645777, 1, -0.5, 0.5, 0.5,
-4.190017, 1, -5.645777, 1, 1.5, 0.5, 0.5,
-4.190017, 1, -5.645777, 0, 1.5, 0.5, 0.5,
-4.190017, 2, -5.645777, 0, -0.5, 0.5, 0.5,
-4.190017, 2, -5.645777, 1, -0.5, 0.5, 0.5,
-4.190017, 2, -5.645777, 1, 1.5, 0.5, 0.5,
-4.190017, 2, -5.645777, 0, 1.5, 0.5, 0.5,
-4.190017, 3, -5.645777, 0, -0.5, 0.5, 0.5,
-4.190017, 3, -5.645777, 1, -0.5, 0.5, 0.5,
-4.190017, 3, -5.645777, 1, 1.5, 0.5, 0.5,
-4.190017, 3, -5.645777, 0, 1.5, 0.5, 0.5
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
-3.652669, -3.298402, -4,
-3.652669, -3.298402, 4,
-3.652669, -3.298402, -4,
-3.831785, -3.472953, -4,
-3.652669, -3.298402, -2,
-3.831785, -3.472953, -2,
-3.652669, -3.298402, 0,
-3.831785, -3.472953, 0,
-3.652669, -3.298402, 2,
-3.831785, -3.472953, 2,
-3.652669, -3.298402, 4,
-3.831785, -3.472953, 4
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
-4.190017, -3.822056, -4, 0, -0.5, 0.5, 0.5,
-4.190017, -3.822056, -4, 1, -0.5, 0.5, 0.5,
-4.190017, -3.822056, -4, 1, 1.5, 0.5, 0.5,
-4.190017, -3.822056, -4, 0, 1.5, 0.5, 0.5,
-4.190017, -3.822056, -2, 0, -0.5, 0.5, 0.5,
-4.190017, -3.822056, -2, 1, -0.5, 0.5, 0.5,
-4.190017, -3.822056, -2, 1, 1.5, 0.5, 0.5,
-4.190017, -3.822056, -2, 0, 1.5, 0.5, 0.5,
-4.190017, -3.822056, 0, 0, -0.5, 0.5, 0.5,
-4.190017, -3.822056, 0, 1, -0.5, 0.5, 0.5,
-4.190017, -3.822056, 0, 1, 1.5, 0.5, 0.5,
-4.190017, -3.822056, 0, 0, 1.5, 0.5, 0.5,
-4.190017, -3.822056, 2, 0, -0.5, 0.5, 0.5,
-4.190017, -3.822056, 2, 1, -0.5, 0.5, 0.5,
-4.190017, -3.822056, 2, 1, 1.5, 0.5, 0.5,
-4.190017, -3.822056, 2, 0, 1.5, 0.5, 0.5,
-4.190017, -3.822056, 4, 0, -0.5, 0.5, 0.5,
-4.190017, -3.822056, 4, 1, -0.5, 0.5, 0.5,
-4.190017, -3.822056, 4, 1, 1.5, 0.5, 0.5,
-4.190017, -3.822056, 4, 0, 1.5, 0.5, 0.5
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
-3.652669, -3.298402, -4.862541,
-3.652669, 3.683646, -4.862541,
-3.652669, -3.298402, 5.580595,
-3.652669, 3.683646, 5.580595,
-3.652669, -3.298402, -4.862541,
-3.652669, -3.298402, 5.580595,
-3.652669, 3.683646, -4.862541,
-3.652669, 3.683646, 5.580595,
-3.652669, -3.298402, -4.862541,
3.511963, -3.298402, -4.862541,
-3.652669, -3.298402, 5.580595,
3.511963, -3.298402, 5.580595,
-3.652669, 3.683646, -4.862541,
3.511963, 3.683646, -4.862541,
-3.652669, 3.683646, 5.580595,
3.511963, 3.683646, 5.580595,
3.511963, -3.298402, -4.862541,
3.511963, 3.683646, -4.862541,
3.511963, -3.298402, 5.580595,
3.511963, 3.683646, 5.580595,
3.511963, -3.298402, -4.862541,
3.511963, -3.298402, 5.580595,
3.511963, 3.683646, -4.862541,
3.511963, 3.683646, 5.580595
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
var radius = 7.722254;
var distance = 34.35718;
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
mvMatrix.translate( 0.07035315, -0.1926218, -0.3590267 );
mvMatrix.scale( 1.165371, 1.195846, 0.7995157 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.35718);
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
tefluthrin<-read.table("tefluthrin.xyz")
```

```
## Error in read.table("tefluthrin.xyz"): no lines available in input
```

```r
x<-tefluthrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'tefluthrin' not found
```

```r
y<-tefluthrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'tefluthrin' not found
```

```r
z<-tefluthrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'tefluthrin' not found
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
-3.54833, 0.3811749, -0.2465676, 0, 0, 1, 1, 1,
-3.067489, 0.6192995, -2.705619, 1, 0, 0, 1, 1,
-2.862729, -1.006691, -0.7764646, 1, 0, 0, 1, 1,
-2.836208, -0.7326265, -3.061078, 1, 0, 0, 1, 1,
-2.790513, 1.034823, -1.112985, 1, 0, 0, 1, 1,
-2.681503, -1.746066, -4.52223, 1, 0, 0, 1, 1,
-2.577837, 0.1520783, -1.845798, 0, 0, 0, 1, 1,
-2.559446, -0.4686921, -2.986503, 0, 0, 0, 1, 1,
-2.551265, 0.3891077, -2.179867, 0, 0, 0, 1, 1,
-2.503277, -1.859437, -2.177778, 0, 0, 0, 1, 1,
-2.486125, -1.090228, -3.24877, 0, 0, 0, 1, 1,
-2.465875, -0.6372272, -2.570142, 0, 0, 0, 1, 1,
-2.432952, -0.1362448, -2.908931, 0, 0, 0, 1, 1,
-2.43122, 0.9269659, -0.4174008, 1, 1, 1, 1, 1,
-2.377548, 0.01931754, -0.4947153, 1, 1, 1, 1, 1,
-2.296895, 1.431504, -0.07238646, 1, 1, 1, 1, 1,
-2.258158, -1.208168, -1.878151, 1, 1, 1, 1, 1,
-2.233882, -1.263523, -1.469597, 1, 1, 1, 1, 1,
-2.224481, 0.0309877, -2.834321, 1, 1, 1, 1, 1,
-2.163387, 1.299967, 0.06362714, 1, 1, 1, 1, 1,
-2.094052, 0.02415732, -2.070707, 1, 1, 1, 1, 1,
-2.087322, -0.2454379, -1.842573, 1, 1, 1, 1, 1,
-2.087104, -1.244335, -3.233988, 1, 1, 1, 1, 1,
-2.081518, 1.538825, -0.5699431, 1, 1, 1, 1, 1,
-2.063895, -0.4645646, -1.388823, 1, 1, 1, 1, 1,
-2.060275, -0.6266031, -2.544891, 1, 1, 1, 1, 1,
-2.02442, -0.8741514, -1.684103, 1, 1, 1, 1, 1,
-2.018898, 1.820788, 1.053139, 1, 1, 1, 1, 1,
-1.972053, 0.6956402, 0.2222382, 0, 0, 1, 1, 1,
-1.944821, 0.5552239, -3.339901, 1, 0, 0, 1, 1,
-1.92657, -0.002359497, -2.676642, 1, 0, 0, 1, 1,
-1.923812, 0.8982444, -0.08281014, 1, 0, 0, 1, 1,
-1.901948, 0.5456231, -2.416688, 1, 0, 0, 1, 1,
-1.897211, -0.5836169, -0.7333124, 1, 0, 0, 1, 1,
-1.895013, 0.5540109, -2.187543, 0, 0, 0, 1, 1,
-1.849604, 1.52202, -0.8537859, 0, 0, 0, 1, 1,
-1.844931, -1.553193, -2.540101, 0, 0, 0, 1, 1,
-1.836326, 0.1886279, -0.3826163, 0, 0, 0, 1, 1,
-1.836027, -0.6944976, -1.224579, 0, 0, 0, 1, 1,
-1.822339, 1.283834, -2.871514, 0, 0, 0, 1, 1,
-1.808621, -1.092879, -2.024868, 0, 0, 0, 1, 1,
-1.791545, 0.382303, 0.07919623, 1, 1, 1, 1, 1,
-1.782567, -0.9881657, -1.848704, 1, 1, 1, 1, 1,
-1.774579, 0.229948, -1.507043, 1, 1, 1, 1, 1,
-1.755346, -1.492466, -0.6476875, 1, 1, 1, 1, 1,
-1.74651, -0.06167779, -0.8178762, 1, 1, 1, 1, 1,
-1.722398, -0.01180758, -2.129123, 1, 1, 1, 1, 1,
-1.716101, -0.7595856, -2.094444, 1, 1, 1, 1, 1,
-1.712864, 0.1800997, -1.052412, 1, 1, 1, 1, 1,
-1.68722, 1.053831, -1.16451, 1, 1, 1, 1, 1,
-1.667503, -0.2280141, -2.024209, 1, 1, 1, 1, 1,
-1.655454, -0.7586012, -2.24227, 1, 1, 1, 1, 1,
-1.631859, -0.8265145, -0.4601571, 1, 1, 1, 1, 1,
-1.62014, -0.4449611, -2.289315, 1, 1, 1, 1, 1,
-1.604373, -0.0267857, -1.894943, 1, 1, 1, 1, 1,
-1.59228, -0.7307218, -2.880379, 1, 1, 1, 1, 1,
-1.586955, -0.2532524, -0.4763603, 0, 0, 1, 1, 1,
-1.577462, -0.6407738, -3.150586, 1, 0, 0, 1, 1,
-1.576306, 2.4292, -1.497185, 1, 0, 0, 1, 1,
-1.545118, 0.7808543, -0.6320057, 1, 0, 0, 1, 1,
-1.544859, -1.276265, -1.665878, 1, 0, 0, 1, 1,
-1.539413, 2.390332, -1.559502, 1, 0, 0, 1, 1,
-1.531371, 1.421923, -2.261968, 0, 0, 0, 1, 1,
-1.522428, -1.754709, -1.973667, 0, 0, 0, 1, 1,
-1.511569, -1.044283, -1.625532, 0, 0, 0, 1, 1,
-1.499171, -0.3055215, 0.1197865, 0, 0, 0, 1, 1,
-1.496132, 0.1887882, -3.860785, 0, 0, 0, 1, 1,
-1.479416, -0.311843, -1.708662, 0, 0, 0, 1, 1,
-1.463028, -1.80307, -3.172888, 0, 0, 0, 1, 1,
-1.443854, -0.8732838, -2.195225, 1, 1, 1, 1, 1,
-1.438459, 1.290381, 0.1286081, 1, 1, 1, 1, 1,
-1.435362, -0.221584, -2.409635, 1, 1, 1, 1, 1,
-1.434598, -0.2533543, 0.004897085, 1, 1, 1, 1, 1,
-1.423759, 0.5760193, -0.05398743, 1, 1, 1, 1, 1,
-1.418596, -0.3799208, -0.6439169, 1, 1, 1, 1, 1,
-1.408741, -0.3966827, -0.9858921, 1, 1, 1, 1, 1,
-1.399363, 0.4109943, -1.227041, 1, 1, 1, 1, 1,
-1.398321, 0.4412396, -0.8168015, 1, 1, 1, 1, 1,
-1.396003, 0.2006023, -1.807134, 1, 1, 1, 1, 1,
-1.390832, -0.4483306, 0.8581132, 1, 1, 1, 1, 1,
-1.389638, -1.130991, -2.951266, 1, 1, 1, 1, 1,
-1.383438, -0.01579808, -3.331949, 1, 1, 1, 1, 1,
-1.381941, 1.059842, -1.394795, 1, 1, 1, 1, 1,
-1.379409, 0.5337885, -2.109468, 1, 1, 1, 1, 1,
-1.369501, -0.05482463, -0.4538587, 0, 0, 1, 1, 1,
-1.368118, 0.7527202, 0.5134597, 1, 0, 0, 1, 1,
-1.365344, -0.2191344, -3.260464, 1, 0, 0, 1, 1,
-1.35377, -0.2828367, -0.9962304, 1, 0, 0, 1, 1,
-1.349018, -1.305359, -1.721888, 1, 0, 0, 1, 1,
-1.339238, -0.1311021, -0.7827448, 1, 0, 0, 1, 1,
-1.327203, 1.340368, -0.100215, 0, 0, 0, 1, 1,
-1.321838, -1.275446, -3.521804, 0, 0, 0, 1, 1,
-1.317352, -0.2326156, -1.467912, 0, 0, 0, 1, 1,
-1.3172, 1.421421, -1.49011, 0, 0, 0, 1, 1,
-1.314166, -0.5222592, 0.1492139, 0, 0, 0, 1, 1,
-1.310319, -0.2554018, -3.50214, 0, 0, 0, 1, 1,
-1.310216, -0.6164532, -2.601436, 0, 0, 0, 1, 1,
-1.309939, -0.4111702, -2.618507, 1, 1, 1, 1, 1,
-1.309596, 1.45333, -0.5425417, 1, 1, 1, 1, 1,
-1.297503, -0.1708815, -0.5837504, 1, 1, 1, 1, 1,
-1.296514, -0.8740554, -2.706996, 1, 1, 1, 1, 1,
-1.28924, 1.046529, -0.08090068, 1, 1, 1, 1, 1,
-1.287873, 1.344239, -0.6134411, 1, 1, 1, 1, 1,
-1.274558, -0.6166488, -2.230023, 1, 1, 1, 1, 1,
-1.260146, 0.5120424, -2.494541, 1, 1, 1, 1, 1,
-1.256402, 0.1061718, -1.674386, 1, 1, 1, 1, 1,
-1.254812, 0.3054101, -2.381807, 1, 1, 1, 1, 1,
-1.247566, 1.156936, -1.279739, 1, 1, 1, 1, 1,
-1.241452, 0.6051108, -2.188694, 1, 1, 1, 1, 1,
-1.239938, -0.3302052, -1.442039, 1, 1, 1, 1, 1,
-1.23672, -1.090366, -2.594426, 1, 1, 1, 1, 1,
-1.220635, -0.6925787, -1.812636, 1, 1, 1, 1, 1,
-1.212773, 1.014141, -1.518413, 0, 0, 1, 1, 1,
-1.205195, -0.09950378, -2.03155, 1, 0, 0, 1, 1,
-1.197138, 0.09749641, -1.716543, 1, 0, 0, 1, 1,
-1.189141, -0.05738582, -3.19894, 1, 0, 0, 1, 1,
-1.18696, 0.4636916, -0.2584036, 1, 0, 0, 1, 1,
-1.162232, -0.6983219, -1.819656, 1, 0, 0, 1, 1,
-1.161985, -0.9670796, -1.797005, 0, 0, 0, 1, 1,
-1.157957, 0.3977067, -0.8809938, 0, 0, 0, 1, 1,
-1.148281, -0.8350585, -2.068191, 0, 0, 0, 1, 1,
-1.146246, 1.063501, -0.393862, 0, 0, 0, 1, 1,
-1.145958, -2.614378, -2.900193, 0, 0, 0, 1, 1,
-1.140451, 0.5806308, -2.483625, 0, 0, 0, 1, 1,
-1.137076, 1.25113, -1.170947, 0, 0, 0, 1, 1,
-1.128928, 0.8334622, -1.775704, 1, 1, 1, 1, 1,
-1.118611, -0.1201837, -1.775636, 1, 1, 1, 1, 1,
-1.099728, -0.9089838, -2.268587, 1, 1, 1, 1, 1,
-1.090135, -0.6149824, -2.360419, 1, 1, 1, 1, 1,
-1.087952, -0.4294259, 0.1769646, 1, 1, 1, 1, 1,
-1.085276, -2.185385, -2.771212, 1, 1, 1, 1, 1,
-1.085066, -0.2758813, -0.8415503, 1, 1, 1, 1, 1,
-1.060093, 1.292356, 0.09859078, 1, 1, 1, 1, 1,
-1.048649, 1.812512, -0.7609465, 1, 1, 1, 1, 1,
-1.047003, -0.2643413, -1.103614, 1, 1, 1, 1, 1,
-1.045963, 0.09829816, -0.9678085, 1, 1, 1, 1, 1,
-1.042565, 0.1522978, -0.85545, 1, 1, 1, 1, 1,
-1.03874, -0.7074186, -1.694523, 1, 1, 1, 1, 1,
-1.034223, -0.05909576, 0.08279749, 1, 1, 1, 1, 1,
-1.022609, 1.234933, 0.06736927, 1, 1, 1, 1, 1,
-1.016771, 0.1703072, -1.84377, 0, 0, 1, 1, 1,
-1.016117, 0.752591, -0.5276555, 1, 0, 0, 1, 1,
-1.014876, 0.06225398, -2.316293, 1, 0, 0, 1, 1,
-1.013736, -0.08024242, -1.613327, 1, 0, 0, 1, 1,
-1.010225, 0.9398466, -0.7843548, 1, 0, 0, 1, 1,
-1.009297, 0.2937936, -0.6631148, 1, 0, 0, 1, 1,
-1.00406, -2.082386, -0.7924005, 0, 0, 0, 1, 1,
-0.9995064, 0.1703001, -3.296962, 0, 0, 0, 1, 1,
-0.9883047, 0.4904024, -1.549895, 0, 0, 0, 1, 1,
-0.9850176, -0.7370541, -3.145382, 0, 0, 0, 1, 1,
-0.9786708, 1.272467, -1.381962, 0, 0, 0, 1, 1,
-0.9772496, 0.04469438, -0.1538603, 0, 0, 0, 1, 1,
-0.9771191, 1.654182, -0.6691546, 0, 0, 0, 1, 1,
-0.9758744, -0.1189741, -2.529583, 1, 1, 1, 1, 1,
-0.9744602, 0.1033029, -3.344004, 1, 1, 1, 1, 1,
-0.9698768, -0.04206955, -1.717272, 1, 1, 1, 1, 1,
-0.9689448, -0.804868, -3.572261, 1, 1, 1, 1, 1,
-0.9652348, 0.1936304, -0.3025364, 1, 1, 1, 1, 1,
-0.9635767, 0.7838035, -2.256681, 1, 1, 1, 1, 1,
-0.9456106, -1.044336, -2.422381, 1, 1, 1, 1, 1,
-0.9456065, 1.712929, 0.2546575, 1, 1, 1, 1, 1,
-0.9453539, -1.076869, -1.912464, 1, 1, 1, 1, 1,
-0.942983, -1.3289, -3.159175, 1, 1, 1, 1, 1,
-0.9404132, -1.471079, -1.720474, 1, 1, 1, 1, 1,
-0.9393569, 0.6618664, -0.6298994, 1, 1, 1, 1, 1,
-0.9385446, 1.817758, -0.45253, 1, 1, 1, 1, 1,
-0.9377089, 0.9135228, -1.718251, 1, 1, 1, 1, 1,
-0.9341485, -0.4891523, -2.650507, 1, 1, 1, 1, 1,
-0.9296507, -0.5439755, -1.326443, 0, 0, 1, 1, 1,
-0.9121017, -0.1371948, -1.132375, 1, 0, 0, 1, 1,
-0.908686, 0.05858716, -1.494129, 1, 0, 0, 1, 1,
-0.9067835, 0.7518572, -0.4837214, 1, 0, 0, 1, 1,
-0.9028676, -0.9165329, -4.710457, 1, 0, 0, 1, 1,
-0.9020661, 0.08188371, -2.614309, 1, 0, 0, 1, 1,
-0.8949875, -0.5575743, -1.781895, 0, 0, 0, 1, 1,
-0.8890974, 0.5466772, -2.389844, 0, 0, 0, 1, 1,
-0.8806612, -0.5714304, -0.4145375, 0, 0, 0, 1, 1,
-0.8805481, -1.314738, -2.566867, 0, 0, 0, 1, 1,
-0.8783127, -0.682832, -2.401472, 0, 0, 0, 1, 1,
-0.8780544, -0.6175426, -2.139431, 0, 0, 0, 1, 1,
-0.8708177, 0.5166535, -2.789684, 0, 0, 0, 1, 1,
-0.8658984, 0.2060968, -2.138013, 1, 1, 1, 1, 1,
-0.8633341, -1.488888, -4.41662, 1, 1, 1, 1, 1,
-0.8610427, -0.7199633, -2.59575, 1, 1, 1, 1, 1,
-0.8588104, 0.1628422, -1.510061, 1, 1, 1, 1, 1,
-0.8436955, 0.01320084, -2.778394, 1, 1, 1, 1, 1,
-0.8432362, -1.12489, -3.72864, 1, 1, 1, 1, 1,
-0.8314222, 0.8880845, -0.2861681, 1, 1, 1, 1, 1,
-0.8301347, 1.229384, 0.5957222, 1, 1, 1, 1, 1,
-0.8297138, -0.1905311, -2.440517, 1, 1, 1, 1, 1,
-0.8290423, 0.4471459, -0.4276029, 1, 1, 1, 1, 1,
-0.8272598, -1.778989, -2.957549, 1, 1, 1, 1, 1,
-0.8204998, 0.6049116, 0.1107945, 1, 1, 1, 1, 1,
-0.8179136, 0.5084766, -0.3880735, 1, 1, 1, 1, 1,
-0.8152, -0.5743493, -2.691653, 1, 1, 1, 1, 1,
-0.8120976, 0.7584987, -0.640329, 1, 1, 1, 1, 1,
-0.8118305, -0.7678988, -1.249891, 0, 0, 1, 1, 1,
-0.810163, 1.000984, 0.1133064, 1, 0, 0, 1, 1,
-0.809612, 0.1371082, -1.318482, 1, 0, 0, 1, 1,
-0.8092856, -0.9980352, -1.849333, 1, 0, 0, 1, 1,
-0.8076316, 1.262206, 1.394097, 1, 0, 0, 1, 1,
-0.8057752, 0.4926209, -0.2131867, 1, 0, 0, 1, 1,
-0.8027137, -1.125235, -2.343493, 0, 0, 0, 1, 1,
-0.8000567, -0.09693935, -2.982147, 0, 0, 0, 1, 1,
-0.794461, -1.603369, -3.84287, 0, 0, 0, 1, 1,
-0.7926913, 0.3577774, -0.884517, 0, 0, 0, 1, 1,
-0.7914737, -0.9768248, -2.678872, 0, 0, 0, 1, 1,
-0.7873564, 1.371937, 2.150384, 0, 0, 0, 1, 1,
-0.7866106, 0.4106794, -2.268123, 0, 0, 0, 1, 1,
-0.7806884, 0.7373041, -0.2633248, 1, 1, 1, 1, 1,
-0.7739455, -2.726882, -4.08832, 1, 1, 1, 1, 1,
-0.7737014, 1.591489, -0.4686884, 1, 1, 1, 1, 1,
-0.7718503, 0.1659139, -1.156156, 1, 1, 1, 1, 1,
-0.7652078, 1.608251, -1.264045, 1, 1, 1, 1, 1,
-0.7642618, 0.03424861, -0.9038703, 1, 1, 1, 1, 1,
-0.7630188, -0.8092711, -2.507149, 1, 1, 1, 1, 1,
-0.7538321, 0.5093926, -2.093085, 1, 1, 1, 1, 1,
-0.7513894, 0.4078262, -1.147255, 1, 1, 1, 1, 1,
-0.7495883, -0.01293823, -3.742457, 1, 1, 1, 1, 1,
-0.7495376, 0.4677049, -0.9776941, 1, 1, 1, 1, 1,
-0.7466837, 0.3344028, -0.4018822, 1, 1, 1, 1, 1,
-0.7411705, 0.6348377, -2.708544, 1, 1, 1, 1, 1,
-0.7397789, -0.08825155, -2.14847, 1, 1, 1, 1, 1,
-0.7348784, -0.39519, -1.435698, 1, 1, 1, 1, 1,
-0.7342058, 0.6659542, -1.421398, 0, 0, 1, 1, 1,
-0.7339948, -1.287162, -2.19895, 1, 0, 0, 1, 1,
-0.7313899, 1.201656, -0.1231572, 1, 0, 0, 1, 1,
-0.7226427, 0.7627378, -1.994284, 1, 0, 0, 1, 1,
-0.7203839, -1.458716, -2.222821, 1, 0, 0, 1, 1,
-0.7201253, 0.05226809, -0.8413711, 1, 0, 0, 1, 1,
-0.7167695, 0.4062419, -1.069877, 0, 0, 0, 1, 1,
-0.7096231, -1.360705, -1.526435, 0, 0, 0, 1, 1,
-0.6963631, -0.05412932, -2.231602, 0, 0, 0, 1, 1,
-0.6949539, 0.8418394, -0.6015089, 0, 0, 0, 1, 1,
-0.6929317, -1.76274, -4.366118, 0, 0, 0, 1, 1,
-0.6876944, -1.800883, -2.727688, 0, 0, 0, 1, 1,
-0.6865463, 1.284609, 0.4884819, 0, 0, 0, 1, 1,
-0.6848359, 0.8097228, -1.046465, 1, 1, 1, 1, 1,
-0.6843897, -0.5644242, -0.6501034, 1, 1, 1, 1, 1,
-0.6777595, -0.3126245, -3.317337, 1, 1, 1, 1, 1,
-0.6737195, 0.6264561, -1.374453, 1, 1, 1, 1, 1,
-0.6725831, 0.6204357, -0.4831533, 1, 1, 1, 1, 1,
-0.6714156, 0.2744028, -1.451058, 1, 1, 1, 1, 1,
-0.668038, -0.4537672, -1.979712, 1, 1, 1, 1, 1,
-0.6626281, -0.3213446, -3.146032, 1, 1, 1, 1, 1,
-0.662555, 0.3507964, -0.248813, 1, 1, 1, 1, 1,
-0.6614935, 1.13683, 0.4531355, 1, 1, 1, 1, 1,
-0.6581961, 1.658828, -0.8665705, 1, 1, 1, 1, 1,
-0.6576192, 0.4120407, -1.575742, 1, 1, 1, 1, 1,
-0.6524789, 1.4155, -0.143421, 1, 1, 1, 1, 1,
-0.6493144, -0.125858, -0.8689702, 1, 1, 1, 1, 1,
-0.6475579, 0.7863253, -0.7451228, 1, 1, 1, 1, 1,
-0.6467206, 0.4590813, -1.314382, 0, 0, 1, 1, 1,
-0.6400005, 0.4473569, -0.1665975, 1, 0, 0, 1, 1,
-0.6391156, 0.6574136, -1.957579, 1, 0, 0, 1, 1,
-0.6342629, 0.161303, -2.712902, 1, 0, 0, 1, 1,
-0.6333781, -0.7784216, -2.538372, 1, 0, 0, 1, 1,
-0.6207259, 0.3350981, -2.850713, 1, 0, 0, 1, 1,
-0.6203048, -1.107805, -1.477543, 0, 0, 0, 1, 1,
-0.6173965, 1.345539, -1.149109, 0, 0, 0, 1, 1,
-0.6162941, 0.3825292, -0.8717202, 0, 0, 0, 1, 1,
-0.6118572, 0.1575439, 0.4064149, 0, 0, 0, 1, 1,
-0.6080164, 1.01544, -1.19393, 0, 0, 0, 1, 1,
-0.6054499, -0.4640224, -2.660618, 0, 0, 0, 1, 1,
-0.6032326, 0.3162268, -0.4006901, 0, 0, 0, 1, 1,
-0.5975612, -0.7244625, -2.405831, 1, 1, 1, 1, 1,
-0.5929319, 0.1761706, -1.401826, 1, 1, 1, 1, 1,
-0.5904499, -0.4212297, -1.478846, 1, 1, 1, 1, 1,
-0.5884405, -0.1455092, -2.270669, 1, 1, 1, 1, 1,
-0.5866443, 1.657291, -2.310293, 1, 1, 1, 1, 1,
-0.5832516, -0.1688661, -1.179534, 1, 1, 1, 1, 1,
-0.5811892, 0.4626051, -1.513579, 1, 1, 1, 1, 1,
-0.5784401, -1.027571, -1.725253, 1, 1, 1, 1, 1,
-0.5748496, -1.080424, -3.654816, 1, 1, 1, 1, 1,
-0.5690401, -0.4144254, -3.41574, 1, 1, 1, 1, 1,
-0.5663151, -0.8750538, -2.120102, 1, 1, 1, 1, 1,
-0.5658005, 0.9451351, -1.897216, 1, 1, 1, 1, 1,
-0.5543754, 0.801915, -1.345772, 1, 1, 1, 1, 1,
-0.5540492, 0.6331156, -0.5905156, 1, 1, 1, 1, 1,
-0.5532969, 1.429266, -1.020927, 1, 1, 1, 1, 1,
-0.5523499, -0.9615097, -4.622871, 0, 0, 1, 1, 1,
-0.5476069, 0.8288731, 0.7671288, 1, 0, 0, 1, 1,
-0.5467259, -0.6115955, -2.497311, 1, 0, 0, 1, 1,
-0.5417078, 1.323349, -0.2360376, 1, 0, 0, 1, 1,
-0.5404915, 0.8883929, -0.4452266, 1, 0, 0, 1, 1,
-0.5333004, 0.2584417, -1.355859, 1, 0, 0, 1, 1,
-0.5324149, -0.6630529, -3.010726, 0, 0, 0, 1, 1,
-0.5316311, -1.048973, -1.589245, 0, 0, 0, 1, 1,
-0.526003, -0.7106407, -3.929049, 0, 0, 0, 1, 1,
-0.5255141, -1.85343, -3.885409, 0, 0, 0, 1, 1,
-0.525373, 1.140044, 0.1157829, 0, 0, 0, 1, 1,
-0.5233234, -1.295708, -4.089399, 0, 0, 0, 1, 1,
-0.5224724, -0.01728149, -2.535455, 0, 0, 0, 1, 1,
-0.5195877, 1.678747, -0.1748413, 1, 1, 1, 1, 1,
-0.5184677, 2.153196, -0.7484784, 1, 1, 1, 1, 1,
-0.5141193, -0.3621112, -0.8188913, 1, 1, 1, 1, 1,
-0.5027251, -3.196722, -1.414787, 1, 1, 1, 1, 1,
-0.50174, 0.4423687, -0.08164133, 1, 1, 1, 1, 1,
-0.4999573, 0.1067867, -2.94184, 1, 1, 1, 1, 1,
-0.4981505, -0.5460179, -4.4173, 1, 1, 1, 1, 1,
-0.4981427, -0.8981183, -1.970767, 1, 1, 1, 1, 1,
-0.4960282, 2.954273, -1.013904, 1, 1, 1, 1, 1,
-0.4955182, -1.442853, -3.884995, 1, 1, 1, 1, 1,
-0.4938055, 0.04254034, -2.826177, 1, 1, 1, 1, 1,
-0.4935017, -0.8669227, -2.505636, 1, 1, 1, 1, 1,
-0.4906043, 0.3777908, 0.2822165, 1, 1, 1, 1, 1,
-0.4803486, 0.1863934, -1.674838, 1, 1, 1, 1, 1,
-0.4776931, -0.5157067, -2.521683, 1, 1, 1, 1, 1,
-0.4743468, -0.141059, -2.282517, 0, 0, 1, 1, 1,
-0.4633669, 1.308863, 0.3603125, 1, 0, 0, 1, 1,
-0.4624413, 1.672103, -1.983081, 1, 0, 0, 1, 1,
-0.4551027, -1.142706, -3.907201, 1, 0, 0, 1, 1,
-0.447621, 0.9011775, 0.5238622, 1, 0, 0, 1, 1,
-0.4447521, 0.4445511, 0.3990265, 1, 0, 0, 1, 1,
-0.4429594, -0.8796092, -4.379877, 0, 0, 0, 1, 1,
-0.4420831, -0.8061056, -3.810914, 0, 0, 0, 1, 1,
-0.4412217, 0.9393526, -0.1002713, 0, 0, 0, 1, 1,
-0.4378239, 1.460745, -1.121896, 0, 0, 0, 1, 1,
-0.4362747, 0.825672, 0.04712449, 0, 0, 0, 1, 1,
-0.4354244, 2.571874, 0.7490169, 0, 0, 0, 1, 1,
-0.4323394, -0.6692156, -1.978055, 0, 0, 0, 1, 1,
-0.4321787, -0.7000782, -4.137347, 1, 1, 1, 1, 1,
-0.4314508, 0.439401, -1.70547, 1, 1, 1, 1, 1,
-0.4301264, -0.4040623, -0.6628546, 1, 1, 1, 1, 1,
-0.4287829, 0.4939535, -1.406329, 1, 1, 1, 1, 1,
-0.4275092, -1.018643, -2.885313, 1, 1, 1, 1, 1,
-0.4247808, -1.541666, -1.375226, 1, 1, 1, 1, 1,
-0.4214028, -0.8543199, -3.545168, 1, 1, 1, 1, 1,
-0.418003, 0.2734725, -2.528989, 1, 1, 1, 1, 1,
-0.4160735, -0.1657883, -0.3985634, 1, 1, 1, 1, 1,
-0.4150498, -0.2504005, -1.8386, 1, 1, 1, 1, 1,
-0.4103226, -0.7329899, -3.6685, 1, 1, 1, 1, 1,
-0.4096665, 0.048161, 0.04040397, 1, 1, 1, 1, 1,
-0.4052701, 1.8656, -0.1620737, 1, 1, 1, 1, 1,
-0.4050118, 0.222929, -1.785861, 1, 1, 1, 1, 1,
-0.4036307, -0.9287871, -3.148878, 1, 1, 1, 1, 1,
-0.4024744, 0.6126755, 1.56326, 0, 0, 1, 1, 1,
-0.4018264, -0.8336362, -1.506004, 1, 0, 0, 1, 1,
-0.4015936, 0.2917852, -1.942686, 1, 0, 0, 1, 1,
-0.3953961, 0.05540068, -1.709825, 1, 0, 0, 1, 1,
-0.3949287, -0.06363469, -2.437172, 1, 0, 0, 1, 1,
-0.3937815, 0.8494323, -0.8528783, 1, 0, 0, 1, 1,
-0.392895, 0.4182813, 0.4724233, 0, 0, 0, 1, 1,
-0.3918383, 0.3443227, -0.1089007, 0, 0, 0, 1, 1,
-0.3900518, -0.06072712, -3.641149, 0, 0, 0, 1, 1,
-0.3859697, 0.06737776, 0.9104825, 0, 0, 0, 1, 1,
-0.3851405, 1.57673, 0.9506328, 0, 0, 0, 1, 1,
-0.3737223, 0.009992829, 0.02639438, 0, 0, 0, 1, 1,
-0.3665234, -2.154356, -4.229452, 0, 0, 0, 1, 1,
-0.3655444, 0.850535, -0.1783044, 1, 1, 1, 1, 1,
-0.3609022, -1.009024, -2.851715, 1, 1, 1, 1, 1,
-0.3558281, -0.2364408, -2.213701, 1, 1, 1, 1, 1,
-0.3538239, 0.3570669, 1.119818, 1, 1, 1, 1, 1,
-0.3475313, 0.9665934, -0.07256864, 1, 1, 1, 1, 1,
-0.3456622, 2.710648, 1.251808, 1, 1, 1, 1, 1,
-0.3450575, -1.372237, -3.410946, 1, 1, 1, 1, 1,
-0.3447288, -0.2513122, -2.007821, 1, 1, 1, 1, 1,
-0.3430482, 0.466425, -2.40743, 1, 1, 1, 1, 1,
-0.3423836, -1.550139, -4.436186, 1, 1, 1, 1, 1,
-0.3396964, 0.327048, 1.844723, 1, 1, 1, 1, 1,
-0.3368183, -0.309938, -3.217389, 1, 1, 1, 1, 1,
-0.3364792, 0.4096665, 0.5602685, 1, 1, 1, 1, 1,
-0.3362859, -1.398401, -2.313854, 1, 1, 1, 1, 1,
-0.3348111, -0.715297, -1.214944, 1, 1, 1, 1, 1,
-0.3323388, -0.3245872, -1.566057, 0, 0, 1, 1, 1,
-0.3318296, 1.775929, -0.1864534, 1, 0, 0, 1, 1,
-0.3216315, 0.01479901, -2.770048, 1, 0, 0, 1, 1,
-0.3162229, 0.4315031, 0.05611348, 1, 0, 0, 1, 1,
-0.3157086, -0.6092969, -2.567149, 1, 0, 0, 1, 1,
-0.3153049, -2.032706, -3.631029, 1, 0, 0, 1, 1,
-0.3129571, -0.8319346, -2.817032, 0, 0, 0, 1, 1,
-0.3126005, -0.5243456, -3.430964, 0, 0, 0, 1, 1,
-0.3119248, 1.029072, 0.4635662, 0, 0, 0, 1, 1,
-0.3116921, -0.4417289, -3.649224, 0, 0, 0, 1, 1,
-0.3084254, -0.4306865, -1.467513, 0, 0, 0, 1, 1,
-0.3065221, 1.608091, 0.3581492, 0, 0, 0, 1, 1,
-0.3061962, 1.459124, 0.1778546, 0, 0, 0, 1, 1,
-0.3049153, 0.781638, -0.03022599, 1, 1, 1, 1, 1,
-0.3032595, 0.291834, -0.1262243, 1, 1, 1, 1, 1,
-0.3011473, 1.740113, -0.8113242, 1, 1, 1, 1, 1,
-0.3010784, -0.1873089, -4.516448, 1, 1, 1, 1, 1,
-0.2998969, -0.01611261, 0.65473, 1, 1, 1, 1, 1,
-0.2987736, 1.349799, -0.2558252, 1, 1, 1, 1, 1,
-0.2960399, 0.2407173, -1.668768, 1, 1, 1, 1, 1,
-0.2951274, 0.5066067, 0.1046162, 1, 1, 1, 1, 1,
-0.2945796, -1.212303, -2.797034, 1, 1, 1, 1, 1,
-0.2923312, -2.256102, -4.440944, 1, 1, 1, 1, 1,
-0.2915412, 0.1243148, -0.5918399, 1, 1, 1, 1, 1,
-0.2906895, 0.2491573, -0.3892001, 1, 1, 1, 1, 1,
-0.2878959, -0.6296724, -2.480231, 1, 1, 1, 1, 1,
-0.284042, -1.564346, -1.633619, 1, 1, 1, 1, 1,
-0.2826738, 0.2370252, -0.5262372, 1, 1, 1, 1, 1,
-0.2750618, 0.3685367, -1.170552, 0, 0, 1, 1, 1,
-0.2726576, -0.2891217, -1.447834, 1, 0, 0, 1, 1,
-0.272094, 0.8199048, 0.3039691, 1, 0, 0, 1, 1,
-0.2720643, 1.792089, 0.3773776, 1, 0, 0, 1, 1,
-0.268929, 1.929475, 0.2940799, 1, 0, 0, 1, 1,
-0.2659222, -0.4358155, -2.780179, 1, 0, 0, 1, 1,
-0.2657883, -0.6199002, -1.111872, 0, 0, 0, 1, 1,
-0.2611443, 1.134885, -0.1846695, 0, 0, 0, 1, 1,
-0.2602996, -0.6980563, -2.068756, 0, 0, 0, 1, 1,
-0.259757, -0.06562458, -1.213566, 0, 0, 0, 1, 1,
-0.2533828, -0.2222875, -2.730208, 0, 0, 0, 1, 1,
-0.2527857, 0.332492, -0.4995675, 0, 0, 0, 1, 1,
-0.2527401, -0.3318349, -4.076003, 0, 0, 0, 1, 1,
-0.2522025, 0.5245386, -1.096863, 1, 1, 1, 1, 1,
-0.2502987, -1.342954, -3.296454, 1, 1, 1, 1, 1,
-0.249625, -1.012261, -1.73631, 1, 1, 1, 1, 1,
-0.2483557, 1.632292, 0.667707, 1, 1, 1, 1, 1,
-0.2435117, -0.01354778, -2.684689, 1, 1, 1, 1, 1,
-0.2427714, -0.8812783, -1.896677, 1, 1, 1, 1, 1,
-0.2425051, -1.389851, -3.114588, 1, 1, 1, 1, 1,
-0.2402451, 0.4995932, -0.3641976, 1, 1, 1, 1, 1,
-0.2396994, -0.4808129, -1.671717, 1, 1, 1, 1, 1,
-0.2373647, 0.9610329, -2.66595, 1, 1, 1, 1, 1,
-0.2317645, -0.9398658, -3.551869, 1, 1, 1, 1, 1,
-0.2242256, -0.8694859, -4.467083, 1, 1, 1, 1, 1,
-0.2223552, 0.5454305, 0.4762802, 1, 1, 1, 1, 1,
-0.2185638, -1.069379, -2.789986, 1, 1, 1, 1, 1,
-0.2185362, 0.314084, -1.893936, 1, 1, 1, 1, 1,
-0.2163129, -2.537414, -3.065785, 0, 0, 1, 1, 1,
-0.2150248, 1.914359, 1.075319, 1, 0, 0, 1, 1,
-0.214962, 1.269182, -0.5098371, 1, 0, 0, 1, 1,
-0.2143998, -0.5990356, -1.148457, 1, 0, 0, 1, 1,
-0.2133104, 2.190352, 1.611563, 1, 0, 0, 1, 1,
-0.2131175, 0.3125959, -1.910462, 1, 0, 0, 1, 1,
-0.2130725, 0.3318609, -1.975474, 0, 0, 0, 1, 1,
-0.2128153, 0.3177429, 1.125873, 0, 0, 0, 1, 1,
-0.2081931, 0.7106425, -2.579453, 0, 0, 0, 1, 1,
-0.2056273, 0.04719415, -0.1703152, 0, 0, 0, 1, 1,
-0.203922, 0.4777229, 1.26579, 0, 0, 0, 1, 1,
-0.2012734, -0.809913, -2.332591, 0, 0, 0, 1, 1,
-0.1972768, 0.9462321, 0.6629996, 0, 0, 0, 1, 1,
-0.19628, -0.3964694, -1.803423, 1, 1, 1, 1, 1,
-0.1878953, 0.08377175, -1.016278, 1, 1, 1, 1, 1,
-0.1858223, -0.9641958, -3.154666, 1, 1, 1, 1, 1,
-0.1737888, 1.229141, -0.01808165, 1, 1, 1, 1, 1,
-0.1727129, -0.6824389, -2.435972, 1, 1, 1, 1, 1,
-0.1725318, -0.423099, -4.417577, 1, 1, 1, 1, 1,
-0.1664833, 1.74281, 0.4133695, 1, 1, 1, 1, 1,
-0.1655854, 1.332895, 0.59531, 1, 1, 1, 1, 1,
-0.1633355, -0.5518129, -3.627757, 1, 1, 1, 1, 1,
-0.1626415, 1.111306, -0.912582, 1, 1, 1, 1, 1,
-0.1620173, 0.9647626, -1.031606, 1, 1, 1, 1, 1,
-0.1619917, 1.294264, 0.6025938, 1, 1, 1, 1, 1,
-0.161244, -0.148524, -2.480789, 1, 1, 1, 1, 1,
-0.1580392, -2.670387, -1.650771, 1, 1, 1, 1, 1,
-0.1570474, 0.1655048, 0.2229547, 1, 1, 1, 1, 1,
-0.1450219, -0.6606869, -2.735831, 0, 0, 1, 1, 1,
-0.1417829, 0.7073386, 0.465528, 1, 0, 0, 1, 1,
-0.1413798, -0.6223099, -3.062874, 1, 0, 0, 1, 1,
-0.1358006, 0.7252144, 0.5238823, 1, 0, 0, 1, 1,
-0.1345302, -0.7544376, -2.847879, 1, 0, 0, 1, 1,
-0.133684, 0.8000659, -1.662493, 1, 0, 0, 1, 1,
-0.1334406, -0.1920163, -1.782849, 0, 0, 0, 1, 1,
-0.1325614, -0.5740777, -1.755238, 0, 0, 0, 1, 1,
-0.1306145, -0.1039264, -2.764413, 0, 0, 0, 1, 1,
-0.1290455, 0.3180265, 1.760496, 0, 0, 0, 1, 1,
-0.1282622, 1.259388, -1.419764, 0, 0, 0, 1, 1,
-0.1246346, 1.841915, 0.6883194, 0, 0, 0, 1, 1,
-0.1209045, -0.5161619, -2.294771, 0, 0, 0, 1, 1,
-0.117415, 0.1801307, -1.650497, 1, 1, 1, 1, 1,
-0.1170135, 1.67956, -0.1653611, 1, 1, 1, 1, 1,
-0.1161314, 0.3694846, 0.041375, 1, 1, 1, 1, 1,
-0.1138485, 1.836776, 0.6538152, 1, 1, 1, 1, 1,
-0.1125844, 0.2987634, 0.4648461, 1, 1, 1, 1, 1,
-0.1122359, -2.002641, -3.631389, 1, 1, 1, 1, 1,
-0.1075695, 0.9860772, 1.741879, 1, 1, 1, 1, 1,
-0.1059749, -1.546522, -3.098492, 1, 1, 1, 1, 1,
-0.1055911, -0.4383482, -1.718452, 1, 1, 1, 1, 1,
-0.10292, -0.8206904, -3.394977, 1, 1, 1, 1, 1,
-0.1003136, -0.449789, -2.971639, 1, 1, 1, 1, 1,
-0.09973649, -1.753334, -3.95093, 1, 1, 1, 1, 1,
-0.0979217, 0.8668309, 0.876889, 1, 1, 1, 1, 1,
-0.09715239, 1.290427, -1.414179, 1, 1, 1, 1, 1,
-0.09681851, -0.4530888, -3.404243, 1, 1, 1, 1, 1,
-0.09480339, 1.682936, 1.020186, 0, 0, 1, 1, 1,
-0.0924275, -1.631441, -1.868268, 1, 0, 0, 1, 1,
-0.0865537, -0.4787439, -2.159666, 1, 0, 0, 1, 1,
-0.08566904, 0.02128653, -1.201247, 1, 0, 0, 1, 1,
-0.08469359, -0.7480522, -3.252506, 1, 0, 0, 1, 1,
-0.08189607, 0.3093993, 0.09054802, 1, 0, 0, 1, 1,
-0.08175467, 0.3529792, -1.137505, 0, 0, 0, 1, 1,
-0.07957682, 0.8208361, 2.122498, 0, 0, 0, 1, 1,
-0.07315751, 0.9219129, 0.07203001, 0, 0, 0, 1, 1,
-0.06789873, -0.0474259, -1.641234, 0, 0, 0, 1, 1,
-0.06726309, -1.534554, -3.191836, 0, 0, 0, 1, 1,
-0.06144436, -0.003432062, -2.479226, 0, 0, 0, 1, 1,
-0.06111445, 0.232357, 0.4094611, 0, 0, 0, 1, 1,
-0.05777788, -0.2801772, -2.504887, 1, 1, 1, 1, 1,
-0.05615546, -1.188471, -2.750819, 1, 1, 1, 1, 1,
-0.05562522, -0.3373503, -3.22174, 1, 1, 1, 1, 1,
-0.05489179, 1.572838, 0.8580847, 1, 1, 1, 1, 1,
-0.05059547, 0.4973431, -0.26921, 1, 1, 1, 1, 1,
-0.04862721, 0.6315343, 1.534842, 1, 1, 1, 1, 1,
-0.04849558, 0.01035594, -1.134839, 1, 1, 1, 1, 1,
-0.04812336, -0.6695321, -3.797144, 1, 1, 1, 1, 1,
-0.04811219, -0.2101134, -2.620934, 1, 1, 1, 1, 1,
-0.04600986, 0.3597356, -1.023007, 1, 1, 1, 1, 1,
-0.04541726, 0.8061002, -0.4701341, 1, 1, 1, 1, 1,
-0.04514569, 0.4413261, -0.6076862, 1, 1, 1, 1, 1,
-0.04441568, 0.9136312, -1.829983, 1, 1, 1, 1, 1,
-0.04334212, -0.5364968, -2.896588, 1, 1, 1, 1, 1,
-0.03897006, -0.4892733, -0.9700525, 1, 1, 1, 1, 1,
-0.03250705, -0.7817462, -3.86358, 0, 0, 1, 1, 1,
-0.03004176, 2.556567, -0.8571585, 1, 0, 0, 1, 1,
-0.02421541, 0.4760176, 0.6080537, 1, 0, 0, 1, 1,
-0.02417429, 0.3598654, -0.03314611, 1, 0, 0, 1, 1,
-0.02325699, -0.5760699, -1.432678, 1, 0, 0, 1, 1,
-0.02025924, -0.2998685, -2.393357, 1, 0, 0, 1, 1,
-0.01736917, -0.1383725, -3.731176, 0, 0, 0, 1, 1,
-0.01626961, -2.092566, -4.371592, 0, 0, 0, 1, 1,
-0.01231613, 1.593229, 0.4564677, 0, 0, 0, 1, 1,
-0.00232351, -0.6387214, -3.697172, 0, 0, 0, 1, 1,
0.001997639, -0.3712115, 3.502685, 0, 0, 0, 1, 1,
0.003300681, 1.152444, 1.05317, 0, 0, 0, 1, 1,
0.008187924, 0.6644979, 0.2419763, 0, 0, 0, 1, 1,
0.01131357, 0.9505509, 1.945327, 1, 1, 1, 1, 1,
0.01400713, -2.861851, 3.641961, 1, 1, 1, 1, 1,
0.01995488, 0.5585054, -0.06547709, 1, 1, 1, 1, 1,
0.02057521, -0.2726887, 3.021067, 1, 1, 1, 1, 1,
0.020859, 0.23979, -0.4831517, 1, 1, 1, 1, 1,
0.02149107, -0.493774, 2.416139, 1, 1, 1, 1, 1,
0.02161457, 0.01902847, 1.285903, 1, 1, 1, 1, 1,
0.02237499, 0.01422963, 0.1253676, 1, 1, 1, 1, 1,
0.02592758, 0.2120427, -1.020706, 1, 1, 1, 1, 1,
0.02661574, -0.7271732, 2.128894, 1, 1, 1, 1, 1,
0.02948584, -0.6491591, 3.010421, 1, 1, 1, 1, 1,
0.03171799, 0.743544, -1.080287, 1, 1, 1, 1, 1,
0.03308933, -2.144388, 2.886971, 1, 1, 1, 1, 1,
0.04023382, -0.06109462, 3.759062, 1, 1, 1, 1, 1,
0.04768452, 0.6387574, 0.4906231, 1, 1, 1, 1, 1,
0.05315441, -1.393081, 4.756691, 0, 0, 1, 1, 1,
0.05419904, -0.2117494, 3.634192, 1, 0, 0, 1, 1,
0.05780298, -0.1185905, 2.60401, 1, 0, 0, 1, 1,
0.05786097, 0.3767441, -1.821862, 1, 0, 0, 1, 1,
0.05885438, -0.5325246, 2.424951, 1, 0, 0, 1, 1,
0.05903104, 0.08103245, -0.03075473, 1, 0, 0, 1, 1,
0.05962698, -0.1901414, 2.938153, 0, 0, 0, 1, 1,
0.06050337, -0.5023642, 3.431324, 0, 0, 0, 1, 1,
0.06476488, -0.8699761, 2.970677, 0, 0, 0, 1, 1,
0.06601249, 0.1729581, 0.08003397, 0, 0, 0, 1, 1,
0.06634091, 0.4461755, 1.136477, 0, 0, 0, 1, 1,
0.06945974, -1.018018, 3.435766, 0, 0, 0, 1, 1,
0.06982475, -0.6024042, 2.541338, 0, 0, 0, 1, 1,
0.07197808, -0.9040948, 4.117463, 1, 1, 1, 1, 1,
0.07769771, 0.3162853, 2.932748, 1, 1, 1, 1, 1,
0.0777954, -0.710224, 3.519668, 1, 1, 1, 1, 1,
0.07935226, 0.03628781, -0.07221355, 1, 1, 1, 1, 1,
0.08171087, 0.8498442, -0.6293615, 1, 1, 1, 1, 1,
0.08408879, -0.2217081, 2.574301, 1, 1, 1, 1, 1,
0.08700393, -0.1149229, 1.556316, 1, 1, 1, 1, 1,
0.09244752, 1.293554, 0.2558059, 1, 1, 1, 1, 1,
0.09318776, 0.9395046, -0.398282, 1, 1, 1, 1, 1,
0.09415966, -0.7616905, 2.77034, 1, 1, 1, 1, 1,
0.09602094, -0.6703403, 1.761653, 1, 1, 1, 1, 1,
0.09677488, 1.164315, -0.118759, 1, 1, 1, 1, 1,
0.09979516, -1.304708, 2.336792, 1, 1, 1, 1, 1,
0.1013101, 0.3552409, -0.05316515, 1, 1, 1, 1, 1,
0.1080477, 1.044263, 0.2485988, 1, 1, 1, 1, 1,
0.1082451, 0.02160105, 1.454312, 0, 0, 1, 1, 1,
0.1106627, -0.3684908, 4.867447, 1, 0, 0, 1, 1,
0.1125247, -0.2566744, 3.548895, 1, 0, 0, 1, 1,
0.1137784, 0.9731528, 1.620014, 1, 0, 0, 1, 1,
0.1178653, -0.348691, 3.298659, 1, 0, 0, 1, 1,
0.1220322, 0.064402, 0.1215732, 1, 0, 0, 1, 1,
0.1220888, 0.642527, 1.471618, 0, 0, 0, 1, 1,
0.1235089, -0.7249054, 2.750932, 0, 0, 0, 1, 1,
0.1235925, -0.0209734, 0.2895747, 0, 0, 0, 1, 1,
0.1269957, -0.8172095, 3.412401, 0, 0, 0, 1, 1,
0.1276211, 2.419131, -0.7336078, 0, 0, 0, 1, 1,
0.1291815, 1.71177, -1.416455, 0, 0, 0, 1, 1,
0.1292269, 0.7780573, -1.761129, 0, 0, 0, 1, 1,
0.1323148, -0.3644072, 1.943551, 1, 1, 1, 1, 1,
0.1435811, -0.8111005, 2.913115, 1, 1, 1, 1, 1,
0.14611, -0.6531848, 3.735075, 1, 1, 1, 1, 1,
0.1542667, 0.2935209, 0.4232653, 1, 1, 1, 1, 1,
0.1556023, -0.6732818, 1.872504, 1, 1, 1, 1, 1,
0.1558793, 0.265659, -0.3195109, 1, 1, 1, 1, 1,
0.1590199, 0.1297369, 2.978805, 1, 1, 1, 1, 1,
0.160941, 0.2600307, 0.5432807, 1, 1, 1, 1, 1,
0.1615571, -0.4991787, 1.561856, 1, 1, 1, 1, 1,
0.1623681, -1.058362, 4.183701, 1, 1, 1, 1, 1,
0.1645715, -1.064391, 3.700848, 1, 1, 1, 1, 1,
0.1655979, 0.4570117, -0.8394848, 1, 1, 1, 1, 1,
0.1669458, 0.5853636, 1.187191, 1, 1, 1, 1, 1,
0.1786462, -0.285726, 1.132541, 1, 1, 1, 1, 1,
0.1796523, 0.5113632, 1.752062, 1, 1, 1, 1, 1,
0.182658, 1.97839, 0.3107578, 0, 0, 1, 1, 1,
0.1853834, 0.1328145, 0.8997311, 1, 0, 0, 1, 1,
0.1871323, -1.701558, 1.124012, 1, 0, 0, 1, 1,
0.1925386, -0.2467662, 2.048621, 1, 0, 0, 1, 1,
0.1957143, -0.2072198, 2.107078, 1, 0, 0, 1, 1,
0.1993319, -0.04187191, 2.157382, 1, 0, 0, 1, 1,
0.2001249, 1.240627, 2.089278, 0, 0, 0, 1, 1,
0.2083116, 0.7913074, 0.8879175, 0, 0, 0, 1, 1,
0.2090721, -0.1651443, 2.398662, 0, 0, 0, 1, 1,
0.2217369, 0.7517508, -0.5136315, 0, 0, 0, 1, 1,
0.2250351, 0.1841813, 1.231722, 0, 0, 0, 1, 1,
0.2282368, 0.2530705, 2.212182, 0, 0, 0, 1, 1,
0.2313261, -1.300708, 2.607181, 0, 0, 0, 1, 1,
0.2315509, 0.0329233, 0.4571088, 1, 1, 1, 1, 1,
0.2352062, 0.8594418, 0.9038426, 1, 1, 1, 1, 1,
0.2393442, 0.5179723, 1.901431, 1, 1, 1, 1, 1,
0.2410228, -1.208836, 2.277373, 1, 1, 1, 1, 1,
0.2512762, -0.5790474, 3.497897, 1, 1, 1, 1, 1,
0.2593862, 0.5725891, 0.1066338, 1, 1, 1, 1, 1,
0.2635905, -0.9000548, 3.864038, 1, 1, 1, 1, 1,
0.2663215, 0.6344716, 1.695182, 1, 1, 1, 1, 1,
0.2792529, 0.2958059, 0.4331418, 1, 1, 1, 1, 1,
0.2856585, -1.701091, 3.334548, 1, 1, 1, 1, 1,
0.2887675, -1.67649, 1.906779, 1, 1, 1, 1, 1,
0.2911259, -1.827088, 4.551336, 1, 1, 1, 1, 1,
0.2954392, 0.5297903, 0.1530489, 1, 1, 1, 1, 1,
0.3027162, 1.898865, 1.037707, 1, 1, 1, 1, 1,
0.3054521, 1.360019, 1.536835, 1, 1, 1, 1, 1,
0.3121247, -0.6845444, 3.271376, 0, 0, 1, 1, 1,
0.3129234, -0.06111724, 1.611905, 1, 0, 0, 1, 1,
0.3141258, -0.5776336, 2.984608, 1, 0, 0, 1, 1,
0.3193183, -0.5760204, 2.796512, 1, 0, 0, 1, 1,
0.321276, -0.7894067, 4.154278, 1, 0, 0, 1, 1,
0.3231347, -0.9249995, 2.510181, 1, 0, 0, 1, 1,
0.3236765, -0.7111121, 3.530343, 0, 0, 0, 1, 1,
0.3271395, -1.124582, 2.335009, 0, 0, 0, 1, 1,
0.3277296, -0.3472828, 1.957697, 0, 0, 0, 1, 1,
0.3350297, 1.159065, 0.8026132, 0, 0, 0, 1, 1,
0.3383657, -0.35373, 2.413867, 0, 0, 0, 1, 1,
0.3390759, -2.152023, 2.519181, 0, 0, 0, 1, 1,
0.3404958, -0.7531453, 2.871472, 0, 0, 0, 1, 1,
0.3418609, 1.096471, 0.6535439, 1, 1, 1, 1, 1,
0.3422453, 0.6042584, 0.9511922, 1, 1, 1, 1, 1,
0.3441552, 0.521997, 0.7645173, 1, 1, 1, 1, 1,
0.3464623, 0.8906716, 1.762977, 1, 1, 1, 1, 1,
0.3488149, 0.7281331, 0.237714, 1, 1, 1, 1, 1,
0.3505867, -0.9909976, 3.322606, 1, 1, 1, 1, 1,
0.3511294, -1.597745, 4.039313, 1, 1, 1, 1, 1,
0.3534262, 3.581965, 2.729961, 1, 1, 1, 1, 1,
0.3549434, -1.888813, 3.531287, 1, 1, 1, 1, 1,
0.3568807, 1.966448, -0.2897513, 1, 1, 1, 1, 1,
0.3647138, -0.6656058, 5.187831, 1, 1, 1, 1, 1,
0.3760137, 0.6655226, 1.905754, 1, 1, 1, 1, 1,
0.3765701, -2.951118, 3.677258, 1, 1, 1, 1, 1,
0.3773146, -0.9735876, 3.539883, 1, 1, 1, 1, 1,
0.3838959, 1.405564, 0.9004197, 1, 1, 1, 1, 1,
0.3885189, -0.5219277, 1.748881, 0, 0, 1, 1, 1,
0.3898463, -1.205915, 2.952508, 1, 0, 0, 1, 1,
0.3930033, 1.159991, 0.6244884, 1, 0, 0, 1, 1,
0.3959098, -0.2035902, 1.857152, 1, 0, 0, 1, 1,
0.3983279, 1.376033, 2.103872, 1, 0, 0, 1, 1,
0.3992445, -0.7412121, 2.225816, 1, 0, 0, 1, 1,
0.4000256, -0.1195839, 1.046562, 0, 0, 0, 1, 1,
0.4017343, -0.1826477, -0.1364785, 0, 0, 0, 1, 1,
0.4050072, -0.0259451, 2.938118, 0, 0, 0, 1, 1,
0.4062402, -0.7532659, 3.222506, 0, 0, 0, 1, 1,
0.4122227, 1.939352, 1.757853, 0, 0, 0, 1, 1,
0.4177739, 0.69556, 0.1782363, 0, 0, 0, 1, 1,
0.4261396, -0.6282921, 2.634516, 0, 0, 0, 1, 1,
0.4264873, 0.2043864, 0.8377861, 1, 1, 1, 1, 1,
0.4296988, 0.1536572, 1.359723, 1, 1, 1, 1, 1,
0.4342903, -0.4821681, 1.488828, 1, 1, 1, 1, 1,
0.4360752, 1.065518, 0.1169353, 1, 1, 1, 1, 1,
0.4370265, 0.637675, -0.3882754, 1, 1, 1, 1, 1,
0.4448235, -0.6877665, 2.530568, 1, 1, 1, 1, 1,
0.4466606, 1.752254, -0.7739987, 1, 1, 1, 1, 1,
0.447213, 1.456111, 0.007960844, 1, 1, 1, 1, 1,
0.4525011, -1.496714, 4.186036, 1, 1, 1, 1, 1,
0.4535161, -0.07083075, 1.721187, 1, 1, 1, 1, 1,
0.4601137, -1.058241, 3.151446, 1, 1, 1, 1, 1,
0.4653882, 1.346278, -0.06488211, 1, 1, 1, 1, 1,
0.4688157, -0.7126046, 1.825521, 1, 1, 1, 1, 1,
0.474728, 1.347887, 0.03153116, 1, 1, 1, 1, 1,
0.4762932, 1.654102, -0.4540152, 1, 1, 1, 1, 1,
0.4824714, -0.2121707, 1.355194, 0, 0, 1, 1, 1,
0.4843315, -0.2431285, 2.827234, 1, 0, 0, 1, 1,
0.4852349, 0.7558126, -0.2481386, 1, 0, 0, 1, 1,
0.4866785, 0.7848579, -0.7560955, 1, 0, 0, 1, 1,
0.489256, -0.9630424, 3.763928, 1, 0, 0, 1, 1,
0.5023407, 0.04056389, 2.43865, 1, 0, 0, 1, 1,
0.5026286, 0.5470422, -0.5048237, 0, 0, 0, 1, 1,
0.5046759, -0.7278295, 5.42851, 0, 0, 0, 1, 1,
0.5075346, 0.8380682, 1.272189, 0, 0, 0, 1, 1,
0.5128132, 1.64402, 1.923475, 0, 0, 0, 1, 1,
0.5194203, -1.545664, 1.331019, 0, 0, 0, 1, 1,
0.5251302, -0.7811688, 3.671231, 0, 0, 0, 1, 1,
0.5309873, 0.3807276, -0.1498346, 0, 0, 0, 1, 1,
0.5332903, 0.02682888, 1.029572, 1, 1, 1, 1, 1,
0.5387867, -0.6562294, 4.307692, 1, 1, 1, 1, 1,
0.5399262, -0.5565463, 4.041653, 1, 1, 1, 1, 1,
0.5422601, -0.1206827, 2.654184, 1, 1, 1, 1, 1,
0.5437137, 1.815698, -0.1913681, 1, 1, 1, 1, 1,
0.5452614, 0.4197026, -0.4539368, 1, 1, 1, 1, 1,
0.5526332, 0.1097691, 1.458326, 1, 1, 1, 1, 1,
0.5535953, -0.3285754, 3.894767, 1, 1, 1, 1, 1,
0.5566422, 0.722876, 0.9163224, 1, 1, 1, 1, 1,
0.558573, -1.183867, 1.836263, 1, 1, 1, 1, 1,
0.561335, 1.064485, -1.11204, 1, 1, 1, 1, 1,
0.5624102, -0.4537763, 1.294647, 1, 1, 1, 1, 1,
0.5638003, -1.009693, 3.441453, 1, 1, 1, 1, 1,
0.5722811, -2.451024, 3.061719, 1, 1, 1, 1, 1,
0.5766554, 0.85492, 0.09792983, 1, 1, 1, 1, 1,
0.577606, 1.916304, 0.754998, 0, 0, 1, 1, 1,
0.5805417, 0.08169398, 1.623868, 1, 0, 0, 1, 1,
0.583347, -1.340254, 3.11183, 1, 0, 0, 1, 1,
0.5910977, -0.1217442, 1.355125, 1, 0, 0, 1, 1,
0.5936196, 0.5452616, 0.4228283, 1, 0, 0, 1, 1,
0.5936507, -0.6977499, 1.770022, 1, 0, 0, 1, 1,
0.5963098, -0.6440807, 1.581303, 0, 0, 0, 1, 1,
0.5995512, -0.5172019, 1.505483, 0, 0, 0, 1, 1,
0.6018526, -1.032085, 1.92365, 0, 0, 0, 1, 1,
0.6019768, 1.383959, -0.8409519, 0, 0, 0, 1, 1,
0.6054134, 1.920561, -0.4383985, 0, 0, 0, 1, 1,
0.6067957, 0.7821712, 1.049046, 0, 0, 0, 1, 1,
0.6114164, 0.3180413, 0.41306, 0, 0, 0, 1, 1,
0.6155086, 1.680444, 1.106763, 1, 1, 1, 1, 1,
0.6228257, 1.025295, 0.05904103, 1, 1, 1, 1, 1,
0.6241242, 0.6221361, 1.301402, 1, 1, 1, 1, 1,
0.6245916, 0.5880408, -0.4494185, 1, 1, 1, 1, 1,
0.6247419, 0.7292427, 0.5965896, 1, 1, 1, 1, 1,
0.6253852, -1.186013, 3.540258, 1, 1, 1, 1, 1,
0.6283559, -0.2760611, 3.050953, 1, 1, 1, 1, 1,
0.6289975, 0.9901932, 1.504975, 1, 1, 1, 1, 1,
0.6295266, -0.5569516, 2.086698, 1, 1, 1, 1, 1,
0.6305642, 0.04151835, 0.8486739, 1, 1, 1, 1, 1,
0.6313013, 0.05609316, 1.506498, 1, 1, 1, 1, 1,
0.6321045, 0.2124895, 0.3364386, 1, 1, 1, 1, 1,
0.6337913, -0.2734756, 1.455294, 1, 1, 1, 1, 1,
0.6411431, 1.391195, -0.5201944, 1, 1, 1, 1, 1,
0.649545, -0.2927287, 1.998007, 1, 1, 1, 1, 1,
0.6571822, 0.5711113, 2.821052, 0, 0, 1, 1, 1,
0.6573074, -0.9211268, 2.685616, 1, 0, 0, 1, 1,
0.664785, 0.1368631, 2.332723, 1, 0, 0, 1, 1,
0.6691689, 0.4352967, -0.07940313, 1, 0, 0, 1, 1,
0.6704752, -1.299527, 2.427626, 1, 0, 0, 1, 1,
0.6719363, -1.278113, 1.822762, 1, 0, 0, 1, 1,
0.6732004, 1.420982, -0.392229, 0, 0, 0, 1, 1,
0.674917, 2.337556, -0.737389, 0, 0, 0, 1, 1,
0.6763837, 0.1103709, 0.6246924, 0, 0, 0, 1, 1,
0.6794063, 0.3306131, 1.31171, 0, 0, 0, 1, 1,
0.6804866, 0.2896722, 1.46898, 0, 0, 0, 1, 1,
0.6805811, -1.080509, 2.326939, 0, 0, 0, 1, 1,
0.683021, -0.5324084, 4.282105, 0, 0, 0, 1, 1,
0.6839632, 1.032866, 0.8901558, 1, 1, 1, 1, 1,
0.6865323, -0.1458178, 2.985376, 1, 1, 1, 1, 1,
0.6895804, 0.4313118, 1.652077, 1, 1, 1, 1, 1,
0.6929275, 2.089069, -0.9225816, 1, 1, 1, 1, 1,
0.6941125, 0.1821577, 0.3952177, 1, 1, 1, 1, 1,
0.6942345, 2.249999, 0.9789102, 1, 1, 1, 1, 1,
0.6951833, -1.992676, 2.271421, 1, 1, 1, 1, 1,
0.6978916, -0.65229, 1.168757, 1, 1, 1, 1, 1,
0.6981981, 2.353201, 0.321773, 1, 1, 1, 1, 1,
0.7022818, -0.0625212, 0.6116125, 1, 1, 1, 1, 1,
0.7024435, 1.771548, 0.8762403, 1, 1, 1, 1, 1,
0.7030903, -0.09208055, 1.660846, 1, 1, 1, 1, 1,
0.7058349, -0.874562, 2.675566, 1, 1, 1, 1, 1,
0.7066268, -0.7328455, -0.9785532, 1, 1, 1, 1, 1,
0.709717, 0.494428, 0.615491, 1, 1, 1, 1, 1,
0.711167, -1.153381, 3.782485, 0, 0, 1, 1, 1,
0.7177024, -0.9662426, 1.64667, 1, 0, 0, 1, 1,
0.7206548, -0.1944131, 1.982648, 1, 0, 0, 1, 1,
0.7255661, 1.27983, 0.04426613, 1, 0, 0, 1, 1,
0.727551, 1.231138, -0.6336477, 1, 0, 0, 1, 1,
0.7357398, -1.068835, 1.458538, 1, 0, 0, 1, 1,
0.7423705, -2.811777, 2.170441, 0, 0, 0, 1, 1,
0.7466208, 0.2783959, 1.578408, 0, 0, 0, 1, 1,
0.7497866, 0.4144991, 1.35529, 0, 0, 0, 1, 1,
0.7587065, -0.4191392, 1.174081, 0, 0, 0, 1, 1,
0.7607299, -0.5179839, 3.886787, 0, 0, 0, 1, 1,
0.7677348, 0.9048569, 0.3181721, 0, 0, 0, 1, 1,
0.7720297, -0.4737889, 2.380844, 0, 0, 0, 1, 1,
0.7726982, -0.7665994, -0.6813649, 1, 1, 1, 1, 1,
0.7829126, -0.2671933, 0.2292921, 1, 1, 1, 1, 1,
0.7866554, 0.7611809, 1.761845, 1, 1, 1, 1, 1,
0.7883626, -1.488714, 1.867734, 1, 1, 1, 1, 1,
0.7988539, -1.210306, 3.756255, 1, 1, 1, 1, 1,
0.8018614, -0.3739788, 0.02797144, 1, 1, 1, 1, 1,
0.8022934, 0.1295418, 1.196988, 1, 1, 1, 1, 1,
0.8025863, 0.5650371, 0.3430557, 1, 1, 1, 1, 1,
0.8053383, 0.6991802, 0.7332238, 1, 1, 1, 1, 1,
0.8058344, 0.1790749, 1.164046, 1, 1, 1, 1, 1,
0.8060148, -0.7208427, 3.180775, 1, 1, 1, 1, 1,
0.8076854, -1.383759, 3.38041, 1, 1, 1, 1, 1,
0.8105896, 0.5336913, 2.655487, 1, 1, 1, 1, 1,
0.8199009, -0.2658309, 0.2951362, 1, 1, 1, 1, 1,
0.8208316, -0.694675, 3.202749, 1, 1, 1, 1, 1,
0.8212218, -1.274686, 3.653715, 0, 0, 1, 1, 1,
0.8214697, -0.1146997, 3.420246, 1, 0, 0, 1, 1,
0.8242676, 0.5767273, 2.040705, 1, 0, 0, 1, 1,
0.8245274, -0.006406955, 2.641465, 1, 0, 0, 1, 1,
0.8301722, 0.4672821, 0.3699757, 1, 0, 0, 1, 1,
0.8308844, 0.7353957, 1.844328, 1, 0, 0, 1, 1,
0.8317561, 0.383326, 0.1812496, 0, 0, 0, 1, 1,
0.8347254, 1.535015, 1.570188, 0, 0, 0, 1, 1,
0.8350884, 0.4661832, 2.352237, 0, 0, 0, 1, 1,
0.838927, -0.01638446, 1.19706, 0, 0, 0, 1, 1,
0.8427938, -1.420372, 3.932114, 0, 0, 0, 1, 1,
0.8478082, 0.1631462, 1.632304, 0, 0, 0, 1, 1,
0.8481578, -0.4156534, 2.339412, 0, 0, 0, 1, 1,
0.848756, 1.069452, 0.5154136, 1, 1, 1, 1, 1,
0.8521596, 0.9450643, 1.230114, 1, 1, 1, 1, 1,
0.8532315, -0.2073171, 3.365798, 1, 1, 1, 1, 1,
0.8612235, -1.295647, 2.987355, 1, 1, 1, 1, 1,
0.8618847, 0.3702515, 2.00392, 1, 1, 1, 1, 1,
0.8652121, 0.979008, 3.34591, 1, 1, 1, 1, 1,
0.8706164, -0.05760698, 2.184391, 1, 1, 1, 1, 1,
0.8742901, -0.404188, 2.215996, 1, 1, 1, 1, 1,
0.8857239, 1.978224, -1.220218, 1, 1, 1, 1, 1,
0.8972842, -1.560587, 2.516975, 1, 1, 1, 1, 1,
0.9050866, -0.7466395, 2.915056, 1, 1, 1, 1, 1,
0.9058878, -0.9954393, 2.807073, 1, 1, 1, 1, 1,
0.9062513, 0.8014145, 0.8331513, 1, 1, 1, 1, 1,
0.9076675, -0.6077728, 3.305489, 1, 1, 1, 1, 1,
0.9103504, 0.9447179, 0.01403061, 1, 1, 1, 1, 1,
0.9113806, 1.36591, -0.5816587, 0, 0, 1, 1, 1,
0.9121897, 0.1222893, 0.6963137, 1, 0, 0, 1, 1,
0.91491, -0.8229282, 3.79618, 1, 0, 0, 1, 1,
0.9269494, -0.6160803, 3.046882, 1, 0, 0, 1, 1,
0.9278435, 1.952932, -0.2338125, 1, 0, 0, 1, 1,
0.9298345, -1.497923, 1.864802, 1, 0, 0, 1, 1,
0.9315318, 0.9706209, 2.174211, 0, 0, 0, 1, 1,
0.9393858, 0.4484704, -0.2151366, 0, 0, 0, 1, 1,
0.9436243, 1.153619, -0.8003131, 0, 0, 0, 1, 1,
0.9449924, -0.1187412, 0.8193225, 0, 0, 0, 1, 1,
0.9471265, 0.2883746, -0.2182616, 0, 0, 0, 1, 1,
0.9543498, -1.822556, 1.818983, 0, 0, 0, 1, 1,
0.9638661, -0.798001, 1.964131, 0, 0, 0, 1, 1,
0.9646704, -1.029639, 1.605533, 1, 1, 1, 1, 1,
0.9687484, -0.3046, 3.329152, 1, 1, 1, 1, 1,
0.9714129, -2.615683, 1.605346, 1, 1, 1, 1, 1,
0.9755018, 0.1860441, 0.9836577, 1, 1, 1, 1, 1,
0.9779579, 0.2765322, 0.9268171, 1, 1, 1, 1, 1,
0.9800405, -0.5631734, 1.382113, 1, 1, 1, 1, 1,
0.9858304, -0.9490204, 1.474492, 1, 1, 1, 1, 1,
0.9968886, -0.5234345, 4.564022, 1, 1, 1, 1, 1,
1.003657, -0.7912492, 2.163091, 1, 1, 1, 1, 1,
1.005108, 0.5359011, 1.034151, 1, 1, 1, 1, 1,
1.005743, 0.08786952, 1.27076, 1, 1, 1, 1, 1,
1.010761, 0.1688851, -0.2672164, 1, 1, 1, 1, 1,
1.013333, 1.557205, -0.2976847, 1, 1, 1, 1, 1,
1.017808, -0.0779232, 4.114854, 1, 1, 1, 1, 1,
1.0194, 2.460319, 0.6976531, 1, 1, 1, 1, 1,
1.021606, 1.173316, 1.151866, 0, 0, 1, 1, 1,
1.027743, -0.8744534, 2.643101, 1, 0, 0, 1, 1,
1.02905, 0.02695887, 1.725731, 1, 0, 0, 1, 1,
1.029455, 1.017847, 0.9999703, 1, 0, 0, 1, 1,
1.02964, -0.7668476, 2.971073, 1, 0, 0, 1, 1,
1.033414, 0.3660026, 1.217743, 1, 0, 0, 1, 1,
1.040282, 1.11372, 0.1351277, 0, 0, 0, 1, 1,
1.042652, -1.352211, 3.29034, 0, 0, 0, 1, 1,
1.043575, 0.1515303, -0.695335, 0, 0, 0, 1, 1,
1.048826, 0.4903299, 0.783725, 0, 0, 0, 1, 1,
1.052858, -0.1085931, 2.889959, 0, 0, 0, 1, 1,
1.054189, -1.083265, 1.526992, 0, 0, 0, 1, 1,
1.060578, -0.8990582, 2.575213, 0, 0, 0, 1, 1,
1.062111, 2.341177, -0.3195717, 1, 1, 1, 1, 1,
1.065531, -0.9800156, 1.471162, 1, 1, 1, 1, 1,
1.077129, -1.108478, 2.433609, 1, 1, 1, 1, 1,
1.082149, 1.249504, 0.4003021, 1, 1, 1, 1, 1,
1.08684, -0.6426293, 3.119077, 1, 1, 1, 1, 1,
1.092583, -0.5249375, 1.800783, 1, 1, 1, 1, 1,
1.09675, 0.8044168, 0.2992001, 1, 1, 1, 1, 1,
1.099836, -0.08403549, -0.5118153, 1, 1, 1, 1, 1,
1.113035, -0.1504918, 0.9170866, 1, 1, 1, 1, 1,
1.119118, -0.476463, 1.898927, 1, 1, 1, 1, 1,
1.119897, 0.2422879, 0.3261442, 1, 1, 1, 1, 1,
1.123366, 0.8073192, 2.058672, 1, 1, 1, 1, 1,
1.127056, -0.3759623, 3.181716, 1, 1, 1, 1, 1,
1.127961, -0.1216079, 2.298253, 1, 1, 1, 1, 1,
1.137127, -0.1622437, 1.814544, 1, 1, 1, 1, 1,
1.147038, 1.360924, -0.3459998, 0, 0, 1, 1, 1,
1.147674, -0.9890889, 1.499941, 1, 0, 0, 1, 1,
1.159408, 1.040777, 0.5940709, 1, 0, 0, 1, 1,
1.159415, 0.6259477, 2.078882, 1, 0, 0, 1, 1,
1.165859, -1.235184, 1.617964, 1, 0, 0, 1, 1,
1.171519, -0.3114051, 0.3091774, 1, 0, 0, 1, 1,
1.176878, -0.5919109, 0.8482649, 0, 0, 0, 1, 1,
1.179509, 0.5436629, -1.755579, 0, 0, 0, 1, 1,
1.180198, -1.152463, -0.1141828, 0, 0, 0, 1, 1,
1.18175, -1.607039, 2.168875, 0, 0, 0, 1, 1,
1.182384, 0.2660201, 0.2376578, 0, 0, 0, 1, 1,
1.184014, 0.8106817, 1.640041, 0, 0, 0, 1, 1,
1.197953, -0.7078264, 1.749121, 0, 0, 0, 1, 1,
1.200066, 0.1461097, 0.9020081, 1, 1, 1, 1, 1,
1.202259, 0.7979464, -0.39564, 1, 1, 1, 1, 1,
1.203528, 0.6953644, 1.486005, 1, 1, 1, 1, 1,
1.203659, -0.9499106, 1.125118, 1, 1, 1, 1, 1,
1.207334, -0.3400066, 2.602354, 1, 1, 1, 1, 1,
1.218297, -1.621258, 2.666645, 1, 1, 1, 1, 1,
1.223883, -1.675404, 2.91999, 1, 1, 1, 1, 1,
1.224369, 0.1815598, 1.139328, 1, 1, 1, 1, 1,
1.224418, 1.320959, 1.907001, 1, 1, 1, 1, 1,
1.227152, -0.7923911, 2.129232, 1, 1, 1, 1, 1,
1.2325, -0.1308754, 1.921059, 1, 1, 1, 1, 1,
1.236966, 0.1577194, 2.549532, 1, 1, 1, 1, 1,
1.238498, -0.1518895, 1.719006, 1, 1, 1, 1, 1,
1.239144, -1.304723, 2.019562, 1, 1, 1, 1, 1,
1.241096, -1.009901, 1.41745, 1, 1, 1, 1, 1,
1.24248, 0.09574854, 0.9566642, 0, 0, 1, 1, 1,
1.253633, -0.4937857, 2.675261, 1, 0, 0, 1, 1,
1.254184, -0.6530217, 1.678082, 1, 0, 0, 1, 1,
1.257954, -0.1703324, 0.450636, 1, 0, 0, 1, 1,
1.269807, -0.08659738, 1.028938, 1, 0, 0, 1, 1,
1.27116, 0.5597229, 0.6891527, 1, 0, 0, 1, 1,
1.277655, -1.513455, 2.48668, 0, 0, 0, 1, 1,
1.294234, -0.9158298, 3.699802, 0, 0, 0, 1, 1,
1.294597, -1.343413, 2.170092, 0, 0, 0, 1, 1,
1.306363, -0.6892448, 2.826375, 0, 0, 0, 1, 1,
1.318244, -0.901399, 3.354284, 0, 0, 0, 1, 1,
1.321799, 0.6768203, -0.1586926, 0, 0, 0, 1, 1,
1.327512, 1.497844, 1.518825, 0, 0, 0, 1, 1,
1.35554, 0.934676, 1.296561, 1, 1, 1, 1, 1,
1.361772, -1.716629, 2.083225, 1, 1, 1, 1, 1,
1.375313, 0.8778046, 1.37997, 1, 1, 1, 1, 1,
1.378719, -0.5053104, 0.6203225, 1, 1, 1, 1, 1,
1.38039, -0.6879093, 4.331148, 1, 1, 1, 1, 1,
1.382599, -1.559955, 2.892937, 1, 1, 1, 1, 1,
1.387548, -1.652472, 2.29368, 1, 1, 1, 1, 1,
1.393102, 0.6591532, 1.082674, 1, 1, 1, 1, 1,
1.395864, -0.5114819, 2.910053, 1, 1, 1, 1, 1,
1.4024, 0.8873111, 1.443351, 1, 1, 1, 1, 1,
1.43203, 0.2168031, 0.9020858, 1, 1, 1, 1, 1,
1.436936, -0.4845394, 2.347173, 1, 1, 1, 1, 1,
1.448813, -1.957154, 3.710677, 1, 1, 1, 1, 1,
1.451567, 0.4601114, 2.107417, 1, 1, 1, 1, 1,
1.469394, -1.911198, 1.823687, 1, 1, 1, 1, 1,
1.469523, -1.133834, 3.975799, 0, 0, 1, 1, 1,
1.475547, -0.3599225, 1.88202, 1, 0, 0, 1, 1,
1.482681, 0.4872518, 2.765711, 1, 0, 0, 1, 1,
1.483479, 0.02870479, 2.393604, 1, 0, 0, 1, 1,
1.486334, 0.6341952, 0.4088791, 1, 0, 0, 1, 1,
1.500699, -0.1529844, 0.8530836, 1, 0, 0, 1, 1,
1.509398, -0.3767972, 2.69839, 0, 0, 0, 1, 1,
1.517836, 1.064697, 1.33169, 0, 0, 0, 1, 1,
1.526455, 0.8961177, 1.541456, 0, 0, 0, 1, 1,
1.526523, -0.7441791, 3.72482, 0, 0, 0, 1, 1,
1.540213, 0.003190948, 1.230078, 0, 0, 0, 1, 1,
1.54791, 0.8457655, 1.930467, 0, 0, 0, 1, 1,
1.556392, 1.395533, -0.2810729, 0, 0, 0, 1, 1,
1.558454, -0.4063689, 1.5069, 1, 1, 1, 1, 1,
1.583634, -0.0139161, 2.443, 1, 1, 1, 1, 1,
1.600337, 0.7525734, 1.047742, 1, 1, 1, 1, 1,
1.61759, 0.7330393, -0.2255048, 1, 1, 1, 1, 1,
1.621318, -0.1728383, 2.435096, 1, 1, 1, 1, 1,
1.62688, -0.6999316, 0.8666965, 1, 1, 1, 1, 1,
1.630919, 1.664585, 1.200303, 1, 1, 1, 1, 1,
1.644163, 0.7824244, 1.726839, 1, 1, 1, 1, 1,
1.65104, -1.380906, 2.315399, 1, 1, 1, 1, 1,
1.651738, -1.992098, 1.565104, 1, 1, 1, 1, 1,
1.666174, -1.604832, 3.153931, 1, 1, 1, 1, 1,
1.671894, -0.1601481, 1.018649, 1, 1, 1, 1, 1,
1.680958, -1.15182, 3.166144, 1, 1, 1, 1, 1,
1.683171, -0.02090621, 2.636242, 1, 1, 1, 1, 1,
1.693813, -1.502174, 1.999046, 1, 1, 1, 1, 1,
1.69755, -0.269311, 2.285762, 0, 0, 1, 1, 1,
1.720047, -0.02282131, 0.3879082, 1, 0, 0, 1, 1,
1.725391, -1.463101, 2.084795, 1, 0, 0, 1, 1,
1.739461, 1.364905, 0.7153206, 1, 0, 0, 1, 1,
1.74625, 0.6427792, 2.127299, 1, 0, 0, 1, 1,
1.759095, 0.544368, 2.409629, 1, 0, 0, 1, 1,
1.760903, 1.452664, 3.588764, 0, 0, 0, 1, 1,
1.763209, 0.1971286, 1.046794, 0, 0, 0, 1, 1,
1.77173, 0.006276035, 1.871297, 0, 0, 0, 1, 1,
1.821842, -0.6966664, 1.421655, 0, 0, 0, 1, 1,
1.824423, 0.3220963, 1.060361, 0, 0, 0, 1, 1,
1.825557, -0.1512173, 2.586643, 0, 0, 0, 1, 1,
1.885245, 1.876414, 1.643625, 0, 0, 0, 1, 1,
1.896457, -0.006625146, 1.627877, 1, 1, 1, 1, 1,
1.897525, -0.4934262, 1.551209, 1, 1, 1, 1, 1,
1.905993, -1.962437, 1.3986, 1, 1, 1, 1, 1,
1.906686, 0.737152, 0.6840676, 1, 1, 1, 1, 1,
1.908911, 0.7937235, 1.235421, 1, 1, 1, 1, 1,
1.912168, 0.8074354, 0.9688132, 1, 1, 1, 1, 1,
1.920143, 1.332758, 1.418793, 1, 1, 1, 1, 1,
1.924531, 0.284801, 1.064942, 1, 1, 1, 1, 1,
1.932341, -0.2943974, 1.887762, 1, 1, 1, 1, 1,
1.961526, -1.736761, 2.328669, 1, 1, 1, 1, 1,
1.983983, -0.3081373, 1.898968, 1, 1, 1, 1, 1,
1.998325, -1.66628, 2.384353, 1, 1, 1, 1, 1,
2.008532, -0.06839941, 2.361989, 1, 1, 1, 1, 1,
2.012644, -0.2678251, 2.45029, 1, 1, 1, 1, 1,
2.014999, 0.563841, 0.3164091, 1, 1, 1, 1, 1,
2.017449, -0.07736267, 3.331409, 0, 0, 1, 1, 1,
2.02553, 0.707664, 1.668231, 1, 0, 0, 1, 1,
2.070591, -1.453741, 1.976792, 1, 0, 0, 1, 1,
2.105719, 0.336473, 1.393653, 1, 0, 0, 1, 1,
2.135353, 0.5403079, 1.264534, 1, 0, 0, 1, 1,
2.158579, -0.8745643, 1.703068, 1, 0, 0, 1, 1,
2.20993, -0.06124444, 2.12918, 0, 0, 0, 1, 1,
2.227843, -1.384989, 1.120066, 0, 0, 0, 1, 1,
2.238622, -1.122116, 1.11115, 0, 0, 0, 1, 1,
2.282105, 0.6807911, 3.031116, 0, 0, 0, 1, 1,
2.384281, -0.4600498, 3.74526, 0, 0, 0, 1, 1,
2.433736, -0.1622409, 2.050265, 0, 0, 0, 1, 1,
2.456024, -1.719604, 0.526999, 0, 0, 0, 1, 1,
2.470265, -1.173684, 3.018092, 1, 1, 1, 1, 1,
2.538357, 0.04963611, 2.239197, 1, 1, 1, 1, 1,
2.745778, 0.3640485, 1.491785, 1, 1, 1, 1, 1,
2.785699, -1.285082, 1.503652, 1, 1, 1, 1, 1,
2.902384, -0.8851984, -0.08215322, 1, 1, 1, 1, 1,
2.909182, -1.52609, 1.420593, 1, 1, 1, 1, 1,
3.407624, 0.6588638, 0.9593306, 1, 1, 1, 1, 1
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
var radius = 9.599493;
var distance = 33.71782;
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
mvMatrix.translate( 0.07035327, -0.1926217, -0.3590267 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.71782);
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
