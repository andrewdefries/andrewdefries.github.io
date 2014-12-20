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
-3.389028, 1.765905, -0.5583839, 1, 0, 0, 1,
-3.256536, 0.2955328, -0.8418893, 1, 0.007843138, 0, 1,
-2.958599, 0.8615108, -0.9841754, 1, 0.01176471, 0, 1,
-2.785359, -0.1236523, -1.050433, 1, 0.01960784, 0, 1,
-2.736666, -1.469883, -2.674117, 1, 0.02352941, 0, 1,
-2.565478, -1.468859, -0.0887429, 1, 0.03137255, 0, 1,
-2.544602, 0.09729198, -1.39871, 1, 0.03529412, 0, 1,
-2.524256, -0.3093093, -1.529732, 1, 0.04313726, 0, 1,
-2.500622, -1.471149, -1.427067, 1, 0.04705882, 0, 1,
-2.481375, 0.2372095, -2.361814, 1, 0.05490196, 0, 1,
-2.464048, 1.0915, 0.08546606, 1, 0.05882353, 0, 1,
-2.38625, -0.1280901, -0.5673686, 1, 0.06666667, 0, 1,
-2.373612, -0.3594475, -0.5820287, 1, 0.07058824, 0, 1,
-2.270093, 0.1625408, -3.597036, 1, 0.07843138, 0, 1,
-2.230598, -2.293956, -0.3049288, 1, 0.08235294, 0, 1,
-2.223286, -0.2963653, -2.3426, 1, 0.09019608, 0, 1,
-2.180129, 0.3292665, -1.678175, 1, 0.09411765, 0, 1,
-2.177193, -0.220447, -2.723404, 1, 0.1019608, 0, 1,
-2.17146, 0.2275925, -1.729826, 1, 0.1098039, 0, 1,
-2.132843, -0.5086414, -1.135337, 1, 0.1137255, 0, 1,
-2.129564, -0.9732528, -1.348418, 1, 0.1215686, 0, 1,
-2.122893, 1.518, -0.5536308, 1, 0.1254902, 0, 1,
-2.098525, 1.923237, -0.7233914, 1, 0.1333333, 0, 1,
-2.097863, -0.2615608, -3.206112, 1, 0.1372549, 0, 1,
-2.012273, 1.071329, -0.4792639, 1, 0.145098, 0, 1,
-1.991575, 1.308055, -0.8479839, 1, 0.1490196, 0, 1,
-1.948964, -0.08059607, -0.385917, 1, 0.1568628, 0, 1,
-1.942741, -0.495925, -1.893965, 1, 0.1607843, 0, 1,
-1.909616, 0.476854, -1.864322, 1, 0.1686275, 0, 1,
-1.894356, -0.5445441, -0.9247171, 1, 0.172549, 0, 1,
-1.877216, -0.7404333, -2.406892, 1, 0.1803922, 0, 1,
-1.844871, -0.9225597, -2.442986, 1, 0.1843137, 0, 1,
-1.83575, -0.3382335, -0.502471, 1, 0.1921569, 0, 1,
-1.803572, -0.7575613, -2.722257, 1, 0.1960784, 0, 1,
-1.796462, -0.9117825, -1.748595, 1, 0.2039216, 0, 1,
-1.785327, 0.4398756, -1.446856, 1, 0.2117647, 0, 1,
-1.706478, 0.1555068, -1.165741, 1, 0.2156863, 0, 1,
-1.692711, -0.07866418, -1.171271, 1, 0.2235294, 0, 1,
-1.690322, -0.4958526, -2.976689, 1, 0.227451, 0, 1,
-1.688715, -2.157387, 0.009060964, 1, 0.2352941, 0, 1,
-1.667754, 1.81779, -0.4451842, 1, 0.2392157, 0, 1,
-1.658126, 1.026595, 0.2244038, 1, 0.2470588, 0, 1,
-1.645043, -0.2439947, -2.617805, 1, 0.2509804, 0, 1,
-1.643353, -0.04885025, -2.25567, 1, 0.2588235, 0, 1,
-1.641839, 0.0659955, -2.873027, 1, 0.2627451, 0, 1,
-1.636759, -1.263858, -1.615132, 1, 0.2705882, 0, 1,
-1.628853, -0.815693, -2.051578, 1, 0.2745098, 0, 1,
-1.626345, -0.5476262, -1.700633, 1, 0.282353, 0, 1,
-1.614868, 0.4098158, -2.399884, 1, 0.2862745, 0, 1,
-1.605243, -0.05064493, -1.983246, 1, 0.2941177, 0, 1,
-1.59786, -1.086362, -0.827958, 1, 0.3019608, 0, 1,
-1.596774, -0.5603419, -1.913233, 1, 0.3058824, 0, 1,
-1.593635, 0.5066177, 0.6723543, 1, 0.3137255, 0, 1,
-1.569469, -0.6377469, -1.870064, 1, 0.3176471, 0, 1,
-1.554425, 0.4936914, -1.372198, 1, 0.3254902, 0, 1,
-1.554155, -1.545277, -1.464263, 1, 0.3294118, 0, 1,
-1.552677, 0.1374028, -1.985175, 1, 0.3372549, 0, 1,
-1.541262, -0.2575079, -2.831119, 1, 0.3411765, 0, 1,
-1.539508, 0.4136779, -1.609136, 1, 0.3490196, 0, 1,
-1.526219, -1.931602, -1.978014, 1, 0.3529412, 0, 1,
-1.522373, 1.638043, -0.4132993, 1, 0.3607843, 0, 1,
-1.518305, 1.146181, -1.069906, 1, 0.3647059, 0, 1,
-1.504825, 0.5390598, -2.481977, 1, 0.372549, 0, 1,
-1.502881, -1.247495, -2.347606, 1, 0.3764706, 0, 1,
-1.489401, 0.2737608, -0.7792566, 1, 0.3843137, 0, 1,
-1.487925, 1.126194, -2.461849, 1, 0.3882353, 0, 1,
-1.454733, 0.7675869, -1.34137, 1, 0.3960784, 0, 1,
-1.446934, -0.1986934, -2.295492, 1, 0.4039216, 0, 1,
-1.440213, 0.433846, -0.476861, 1, 0.4078431, 0, 1,
-1.420777, -1.158909, -1.892325, 1, 0.4156863, 0, 1,
-1.41499, -1.08084, -2.311966, 1, 0.4196078, 0, 1,
-1.408577, 0.7929296, 2.12563, 1, 0.427451, 0, 1,
-1.405269, -1.623392, -3.877999, 1, 0.4313726, 0, 1,
-1.397422, 0.6784849, -0.7851117, 1, 0.4392157, 0, 1,
-1.397043, 0.6816823, -0.691346, 1, 0.4431373, 0, 1,
-1.39426, 0.245835, -1.408722, 1, 0.4509804, 0, 1,
-1.393705, -0.3327791, -2.252871, 1, 0.454902, 0, 1,
-1.392605, 1.707449, -2.326202, 1, 0.4627451, 0, 1,
-1.392191, 0.9504074, 0.0408629, 1, 0.4666667, 0, 1,
-1.37619, 0.6954708, -0.6440611, 1, 0.4745098, 0, 1,
-1.37362, -1.225195, -3.31029, 1, 0.4784314, 0, 1,
-1.373315, -1.319369, -4.284875, 1, 0.4862745, 0, 1,
-1.364183, 0.02153355, -1.796958, 1, 0.4901961, 0, 1,
-1.362251, 0.05086337, -0.205272, 1, 0.4980392, 0, 1,
-1.335531, -2.439128, -3.598735, 1, 0.5058824, 0, 1,
-1.324264, -0.7394713, -0.4441518, 1, 0.509804, 0, 1,
-1.320689, 1.030441, -1.299262, 1, 0.5176471, 0, 1,
-1.314775, -0.4336509, -2.491136, 1, 0.5215687, 0, 1,
-1.303041, -0.6388999, -2.403451, 1, 0.5294118, 0, 1,
-1.302574, -0.6357176, -2.271492, 1, 0.5333334, 0, 1,
-1.294785, -2.116185, -2.593922, 1, 0.5411765, 0, 1,
-1.290853, 0.7479969, 1.670469, 1, 0.5450981, 0, 1,
-1.279196, -0.4368264, 0.1529081, 1, 0.5529412, 0, 1,
-1.276086, 0.6997784, -1.449965, 1, 0.5568628, 0, 1,
-1.26518, 0.3803634, -0.9929479, 1, 0.5647059, 0, 1,
-1.263326, 0.4282811, -2.841254, 1, 0.5686275, 0, 1,
-1.259071, -0.271286, -0.7003903, 1, 0.5764706, 0, 1,
-1.244365, 1.296804, -0.7286433, 1, 0.5803922, 0, 1,
-1.231101, -0.5919861, -1.061957, 1, 0.5882353, 0, 1,
-1.229977, -0.008688675, -2.686929, 1, 0.5921569, 0, 1,
-1.225947, 0.6082742, -1.095698, 1, 0.6, 0, 1,
-1.219556, 0.8465356, -0.1940184, 1, 0.6078432, 0, 1,
-1.219436, -0.883193, -0.241888, 1, 0.6117647, 0, 1,
-1.219014, -0.4177424, -1.156778, 1, 0.6196079, 0, 1,
-1.217241, -0.8150645, -1.619089, 1, 0.6235294, 0, 1,
-1.211748, -0.96979, -3.990217, 1, 0.6313726, 0, 1,
-1.203613, 0.3326277, -1.933198, 1, 0.6352941, 0, 1,
-1.196033, 2.361507, 1.283133, 1, 0.6431373, 0, 1,
-1.193094, 2.749951, -0.845812, 1, 0.6470588, 0, 1,
-1.187331, -0.5781943, -2.675938, 1, 0.654902, 0, 1,
-1.1873, -0.03216603, -3.031544, 1, 0.6588235, 0, 1,
-1.176683, -0.4220834, -2.026541, 1, 0.6666667, 0, 1,
-1.172518, -0.5666372, -1.647979, 1, 0.6705883, 0, 1,
-1.167969, 1.150382, 0.02268466, 1, 0.6784314, 0, 1,
-1.162813, 0.55583, -2.402081, 1, 0.682353, 0, 1,
-1.162164, -0.386856, -3.674307, 1, 0.6901961, 0, 1,
-1.160966, -0.6935708, -2.644423, 1, 0.6941177, 0, 1,
-1.155021, 0.2659607, -0.4237489, 1, 0.7019608, 0, 1,
-1.145791, -0.2619527, -1.627296, 1, 0.7098039, 0, 1,
-1.140217, -0.3313923, -0.2833883, 1, 0.7137255, 0, 1,
-1.138983, -0.9156163, -4.161397, 1, 0.7215686, 0, 1,
-1.138828, 1.160362, -0.9159058, 1, 0.7254902, 0, 1,
-1.138488, -0.7976794, -2.776173, 1, 0.7333333, 0, 1,
-1.136147, 1.086884, -2.286647, 1, 0.7372549, 0, 1,
-1.136061, 0.3172441, -1.550787, 1, 0.7450981, 0, 1,
-1.128154, -0.2996559, -3.041324, 1, 0.7490196, 0, 1,
-1.127642, 0.2941903, -1.278054, 1, 0.7568628, 0, 1,
-1.122516, 0.2619992, -0.08596722, 1, 0.7607843, 0, 1,
-1.120987, -0.09868201, -2.001628, 1, 0.7686275, 0, 1,
-1.11812, -1.061369, -0.9150053, 1, 0.772549, 0, 1,
-1.116103, -0.6164897, -2.350328, 1, 0.7803922, 0, 1,
-1.115468, 0.4647909, -1.323853, 1, 0.7843137, 0, 1,
-1.114732, -3.167732, -3.731464, 1, 0.7921569, 0, 1,
-1.105286, -0.2482773, -2.667932, 1, 0.7960784, 0, 1,
-1.10345, 0.7009531, -1.67653, 1, 0.8039216, 0, 1,
-1.103107, 0.3330888, -1.248802, 1, 0.8117647, 0, 1,
-1.073605, 2.059596, -1.037265, 1, 0.8156863, 0, 1,
-1.065951, 0.0001655432, -0.3330389, 1, 0.8235294, 0, 1,
-1.06593, 1.228194, -1.835436, 1, 0.827451, 0, 1,
-1.064388, -0.9053736, -2.835694, 1, 0.8352941, 0, 1,
-1.063272, 0.4003396, -0.1108322, 1, 0.8392157, 0, 1,
-1.054812, 1.392519, -0.1407557, 1, 0.8470588, 0, 1,
-1.051366, -0.04889352, -1.517079, 1, 0.8509804, 0, 1,
-1.047716, -0.1905473, -1.991845, 1, 0.8588235, 0, 1,
-1.047325, 1.597467, -0.4863837, 1, 0.8627451, 0, 1,
-1.042476, -1.543606, -3.222377, 1, 0.8705882, 0, 1,
-1.033645, -1.979826, -2.078737, 1, 0.8745098, 0, 1,
-1.032333, -0.3968902, -0.8641589, 1, 0.8823529, 0, 1,
-1.029725, -2.394306, -2.678784, 1, 0.8862745, 0, 1,
-1.027981, -1.523219, -4.021182, 1, 0.8941177, 0, 1,
-1.025954, 1.512698, 0.09047655, 1, 0.8980392, 0, 1,
-1.017476, -0.1869659, -0.6017228, 1, 0.9058824, 0, 1,
-1.016734, 0.7678806, -0.1962769, 1, 0.9137255, 0, 1,
-1.007775, -0.7141331, -1.362579, 1, 0.9176471, 0, 1,
-1.004202, 0.6940578, -1.904786, 1, 0.9254902, 0, 1,
-1.002973, 1.064295, -0.211948, 1, 0.9294118, 0, 1,
-0.988616, -1.301216, -2.590497, 1, 0.9372549, 0, 1,
-0.9865716, 0.6607459, -0.9020054, 1, 0.9411765, 0, 1,
-0.9842809, -1.105714, -1.230291, 1, 0.9490196, 0, 1,
-0.9738382, 0.5197894, -1.382353, 1, 0.9529412, 0, 1,
-0.9715844, -0.06446774, -1.779209, 1, 0.9607843, 0, 1,
-0.9709229, -0.8076709, -3.898884, 1, 0.9647059, 0, 1,
-0.968598, -1.424669, -3.501489, 1, 0.972549, 0, 1,
-0.9669795, -0.8759118, -2.204924, 1, 0.9764706, 0, 1,
-0.9652322, 1.098016, -1.562015, 1, 0.9843137, 0, 1,
-0.9589177, 0.8588852, -0.372053, 1, 0.9882353, 0, 1,
-0.9504873, 3.265192, 0.1680822, 1, 0.9960784, 0, 1,
-0.950244, -1.38566, -2.210298, 0.9960784, 1, 0, 1,
-0.9495827, 0.3187203, -1.018206, 0.9921569, 1, 0, 1,
-0.9472555, -0.5729522, -2.978157, 0.9843137, 1, 0, 1,
-0.9420635, 0.05436348, -3.029564, 0.9803922, 1, 0, 1,
-0.9404094, -1.030847, -2.185431, 0.972549, 1, 0, 1,
-0.9323065, -0.4467313, -0.003986736, 0.9686275, 1, 0, 1,
-0.9303324, -0.3658951, -0.165807, 0.9607843, 1, 0, 1,
-0.9294053, -0.7357181, -2.892996, 0.9568627, 1, 0, 1,
-0.9210241, 0.5501844, -0.07279706, 0.9490196, 1, 0, 1,
-0.918571, -2.463148, -1.04744, 0.945098, 1, 0, 1,
-0.9152796, 1.537416, -0.1452107, 0.9372549, 1, 0, 1,
-0.9067959, -2.010994, -3.200502, 0.9333333, 1, 0, 1,
-0.9057221, -0.4009272, -1.929674, 0.9254902, 1, 0, 1,
-0.9050837, 0.1149328, -1.17032, 0.9215686, 1, 0, 1,
-0.9043149, -0.8070194, -0.8456407, 0.9137255, 1, 0, 1,
-0.8992157, -2.084537, -1.339783, 0.9098039, 1, 0, 1,
-0.8982632, 0.4117954, -0.7844578, 0.9019608, 1, 0, 1,
-0.8976857, -1.504984, -2.675132, 0.8941177, 1, 0, 1,
-0.8953543, 0.2465403, -1.317306, 0.8901961, 1, 0, 1,
-0.8908571, 1.026821, 0.1843393, 0.8823529, 1, 0, 1,
-0.8902227, 1.665141, -0.6556705, 0.8784314, 1, 0, 1,
-0.8878705, 0.9607157, 1.151619, 0.8705882, 1, 0, 1,
-0.8823992, -0.1592718, -2.163905, 0.8666667, 1, 0, 1,
-0.8802815, 2.090724, -1.921626, 0.8588235, 1, 0, 1,
-0.8778822, 0.7353766, -1.367018, 0.854902, 1, 0, 1,
-0.8740298, 0.4247398, -0.2293368, 0.8470588, 1, 0, 1,
-0.8719256, 1.340439, 0.02546941, 0.8431373, 1, 0, 1,
-0.8678449, 0.801582, -1.580201, 0.8352941, 1, 0, 1,
-0.8665676, -0.7866627, -3.364324, 0.8313726, 1, 0, 1,
-0.8636594, 1.093121, -1.78966, 0.8235294, 1, 0, 1,
-0.8578116, -0.2007614, -2.806871, 0.8196079, 1, 0, 1,
-0.8533325, 0.3826324, -1.769503, 0.8117647, 1, 0, 1,
-0.8532756, 1.129248, 1.38264, 0.8078431, 1, 0, 1,
-0.8525627, 0.04464692, -1.612889, 0.8, 1, 0, 1,
-0.8483588, 1.806209, -2.043351, 0.7921569, 1, 0, 1,
-0.8477344, -1.712704, -2.197453, 0.7882353, 1, 0, 1,
-0.8378249, 1.164956, -1.167459, 0.7803922, 1, 0, 1,
-0.8364902, -0.4094534, -2.841852, 0.7764706, 1, 0, 1,
-0.8320616, 0.921901, -0.1747831, 0.7686275, 1, 0, 1,
-0.8287642, -0.0299148, -3.17111, 0.7647059, 1, 0, 1,
-0.8246891, -0.3669598, -1.101694, 0.7568628, 1, 0, 1,
-0.821943, 0.5029035, -0.04975459, 0.7529412, 1, 0, 1,
-0.8199284, 1.158464, 0.3461185, 0.7450981, 1, 0, 1,
-0.8156281, -1.060249, -2.600375, 0.7411765, 1, 0, 1,
-0.8087432, 0.5866506, -1.136732, 0.7333333, 1, 0, 1,
-0.8080184, 0.5501963, -2.404257, 0.7294118, 1, 0, 1,
-0.8034168, 0.9100608, -0.5164075, 0.7215686, 1, 0, 1,
-0.8014121, -0.4708241, -3.152355, 0.7176471, 1, 0, 1,
-0.796037, -1.108644, -2.305448, 0.7098039, 1, 0, 1,
-0.7947785, -0.4404885, -3.45828, 0.7058824, 1, 0, 1,
-0.7892334, 0.2933918, -1.28993, 0.6980392, 1, 0, 1,
-0.7890519, -1.542642, -2.800885, 0.6901961, 1, 0, 1,
-0.7858055, 0.6699031, -2.433923, 0.6862745, 1, 0, 1,
-0.7833161, -0.3218268, -1.185444, 0.6784314, 1, 0, 1,
-0.7827262, -0.04547648, -3.241235, 0.6745098, 1, 0, 1,
-0.7745448, 0.1160343, -2.86666, 0.6666667, 1, 0, 1,
-0.7694952, -0.8713453, -3.435184, 0.6627451, 1, 0, 1,
-0.7686106, 1.307586, 0.1001873, 0.654902, 1, 0, 1,
-0.7685631, -0.9892559, -1.925602, 0.6509804, 1, 0, 1,
-0.7651101, -2.192836, -3.58405, 0.6431373, 1, 0, 1,
-0.7617592, 0.4602841, -1.473855, 0.6392157, 1, 0, 1,
-0.7607216, -0.2022634, -2.392019, 0.6313726, 1, 0, 1,
-0.7595387, 1.001737, -1.099798, 0.627451, 1, 0, 1,
-0.7550877, -1.051345, -4.049901, 0.6196079, 1, 0, 1,
-0.7533202, -0.0771257, -0.4626437, 0.6156863, 1, 0, 1,
-0.7501439, 0.4595902, -0.5304754, 0.6078432, 1, 0, 1,
-0.7466099, 0.4405035, -1.710045, 0.6039216, 1, 0, 1,
-0.7462043, -0.3627312, -3.494999, 0.5960785, 1, 0, 1,
-0.7389653, 0.2132072, 1.480744, 0.5882353, 1, 0, 1,
-0.7386411, -0.4234368, -2.505144, 0.5843138, 1, 0, 1,
-0.736082, 0.1091191, -0.9903964, 0.5764706, 1, 0, 1,
-0.7331294, -0.08528567, -1.757697, 0.572549, 1, 0, 1,
-0.7317664, 2.074096, 0.5743145, 0.5647059, 1, 0, 1,
-0.7234607, -1.295427, -2.322053, 0.5607843, 1, 0, 1,
-0.7217534, -0.07313873, -0.9888297, 0.5529412, 1, 0, 1,
-0.7147388, -0.753036, -1.612792, 0.5490196, 1, 0, 1,
-0.7135108, -0.3780167, -2.712882, 0.5411765, 1, 0, 1,
-0.7109405, -0.7830229, -5.4368, 0.5372549, 1, 0, 1,
-0.7037816, 0.9566243, 0.7836121, 0.5294118, 1, 0, 1,
-0.7031634, 0.6665904, -1.504369, 0.5254902, 1, 0, 1,
-0.6995616, 0.1664421, -2.561215, 0.5176471, 1, 0, 1,
-0.6950859, -0.6612377, -4.653691, 0.5137255, 1, 0, 1,
-0.69074, 0.5773752, -0.09317955, 0.5058824, 1, 0, 1,
-0.6897956, -0.3072212, -3.532485, 0.5019608, 1, 0, 1,
-0.6802872, -0.4798247, -2.225409, 0.4941176, 1, 0, 1,
-0.6779242, -0.9683468, -3.0771, 0.4862745, 1, 0, 1,
-0.6732492, 0.3479575, -1.829391, 0.4823529, 1, 0, 1,
-0.6707706, -0.3041049, -3.933092, 0.4745098, 1, 0, 1,
-0.6692242, -0.6874686, -2.85574, 0.4705882, 1, 0, 1,
-0.6667668, -2.009145, -1.72197, 0.4627451, 1, 0, 1,
-0.6645432, -0.7301617, -2.979636, 0.4588235, 1, 0, 1,
-0.6565884, 0.6289574, -2.151014, 0.4509804, 1, 0, 1,
-0.6537531, -0.6534255, -2.97977, 0.4470588, 1, 0, 1,
-0.6530598, -1.515965, -4.78505, 0.4392157, 1, 0, 1,
-0.6509729, -1.042689, -4.460277, 0.4352941, 1, 0, 1,
-0.6503906, 2.236248, -1.258597, 0.427451, 1, 0, 1,
-0.6443014, 0.3331733, -0.4621521, 0.4235294, 1, 0, 1,
-0.6426096, 0.7283251, -2.398116, 0.4156863, 1, 0, 1,
-0.6394896, -0.1210678, -2.194386, 0.4117647, 1, 0, 1,
-0.636446, 2.71822, -0.636701, 0.4039216, 1, 0, 1,
-0.63624, -0.1965648, -2.62776, 0.3960784, 1, 0, 1,
-0.6312415, -1.643968, -5.82936, 0.3921569, 1, 0, 1,
-0.6263754, -0.1082407, -2.061811, 0.3843137, 1, 0, 1,
-0.6239433, 1.269528, -0.4893645, 0.3803922, 1, 0, 1,
-0.6206457, -2.105718, -0.9227332, 0.372549, 1, 0, 1,
-0.6193706, -0.3994212, -1.161817, 0.3686275, 1, 0, 1,
-0.6180363, 1.040721, -0.08013255, 0.3607843, 1, 0, 1,
-0.6176586, 0.51569, 0.001724594, 0.3568628, 1, 0, 1,
-0.6171781, -1.123496, -2.716789, 0.3490196, 1, 0, 1,
-0.61344, -1.645314, -2.340506, 0.345098, 1, 0, 1,
-0.6119717, -0.9525847, -2.556148, 0.3372549, 1, 0, 1,
-0.6114635, -0.9838824, -1.985701, 0.3333333, 1, 0, 1,
-0.6073829, 1.984126, -0.2224753, 0.3254902, 1, 0, 1,
-0.6025423, 1.502141, -0.4279695, 0.3215686, 1, 0, 1,
-0.5987124, -0.2010393, -3.613578, 0.3137255, 1, 0, 1,
-0.5971617, 1.141879, 0.8783837, 0.3098039, 1, 0, 1,
-0.5952003, 1.083452, -1.484064, 0.3019608, 1, 0, 1,
-0.589811, -0.2574351, -0.1294886, 0.2941177, 1, 0, 1,
-0.5833504, 2.045685, -0.06773755, 0.2901961, 1, 0, 1,
-0.58314, 0.753607, -1.016312, 0.282353, 1, 0, 1,
-0.5801272, 1.25989, 0.5070392, 0.2784314, 1, 0, 1,
-0.5789515, 0.6454271, -0.3464122, 0.2705882, 1, 0, 1,
-0.5763698, -1.405908, -3.13137, 0.2666667, 1, 0, 1,
-0.5743003, 1.079822, 0.1534187, 0.2588235, 1, 0, 1,
-0.5741759, -0.4599652, -2.386891, 0.254902, 1, 0, 1,
-0.5729619, 1.394141, 0.1692005, 0.2470588, 1, 0, 1,
-0.5722177, -1.701632, -4.384947, 0.2431373, 1, 0, 1,
-0.5706665, 1.478489, -0.6568605, 0.2352941, 1, 0, 1,
-0.5701891, 0.1200268, -2.012608, 0.2313726, 1, 0, 1,
-0.568706, -0.4265156, -1.479028, 0.2235294, 1, 0, 1,
-0.5684649, 0.9388603, 0.02477827, 0.2196078, 1, 0, 1,
-0.566852, -0.1652293, -1.06497, 0.2117647, 1, 0, 1,
-0.5640287, 0.07696863, -2.894373, 0.2078431, 1, 0, 1,
-0.5631895, -0.002849638, -1.906896, 0.2, 1, 0, 1,
-0.5621607, -1.908632, -2.056258, 0.1921569, 1, 0, 1,
-0.555279, -1.177584, -2.3922, 0.1882353, 1, 0, 1,
-0.5468473, -0.670711, -1.411674, 0.1803922, 1, 0, 1,
-0.5344689, -1.830734, -4.88316, 0.1764706, 1, 0, 1,
-0.5265044, 0.1705909, -1.749086, 0.1686275, 1, 0, 1,
-0.5235429, -0.283795, -1.286042, 0.1647059, 1, 0, 1,
-0.5206772, 1.001817, 0.2661985, 0.1568628, 1, 0, 1,
-0.5134422, 0.4112552, 0.3298607, 0.1529412, 1, 0, 1,
-0.5134302, -0.164801, -2.193297, 0.145098, 1, 0, 1,
-0.5113251, -1.677249, -3.098514, 0.1411765, 1, 0, 1,
-0.5066011, 0.2498888, -0.5765008, 0.1333333, 1, 0, 1,
-0.5061989, 1.136553, -1.504987, 0.1294118, 1, 0, 1,
-0.5032477, 0.5903246, 0.8507886, 0.1215686, 1, 0, 1,
-0.4961347, 0.3533082, -1.181722, 0.1176471, 1, 0, 1,
-0.4940189, 1.471541, -1.342112, 0.1098039, 1, 0, 1,
-0.4892707, -1.402981, -1.47368, 0.1058824, 1, 0, 1,
-0.4844559, -1.427715, -2.223142, 0.09803922, 1, 0, 1,
-0.4829353, 1.54134, -0.7077246, 0.09019608, 1, 0, 1,
-0.4728457, 2.486237, -0.8476317, 0.08627451, 1, 0, 1,
-0.4726342, 0.8808111, -0.5703604, 0.07843138, 1, 0, 1,
-0.471103, -0.1862869, -2.269744, 0.07450981, 1, 0, 1,
-0.4708563, 0.5212545, 0.2618929, 0.06666667, 1, 0, 1,
-0.4639861, -1.443276, -1.761992, 0.0627451, 1, 0, 1,
-0.4625527, -0.3074112, -1.997552, 0.05490196, 1, 0, 1,
-0.4542013, 1.321695, 1.052932, 0.05098039, 1, 0, 1,
-0.4510192, 1.085691, 1.257899, 0.04313726, 1, 0, 1,
-0.4509403, -0.9566805, -2.334015, 0.03921569, 1, 0, 1,
-0.45051, -1.225526, -3.542881, 0.03137255, 1, 0, 1,
-0.4502881, 0.5254136, -0.8662745, 0.02745098, 1, 0, 1,
-0.4499068, -1.223727, -2.658804, 0.01960784, 1, 0, 1,
-0.4498061, -1.506389, -2.764895, 0.01568628, 1, 0, 1,
-0.4467825, -0.602697, -3.005633, 0.007843138, 1, 0, 1,
-0.4463128, 0.2979708, -0.9816332, 0.003921569, 1, 0, 1,
-0.4453695, 0.1178468, -1.281233, 0, 1, 0.003921569, 1,
-0.4420548, -0.7857061, -3.639215, 0, 1, 0.01176471, 1,
-0.4406609, 0.8506318, -1.420548, 0, 1, 0.01568628, 1,
-0.4403895, -0.3325784, -2.087481, 0, 1, 0.02352941, 1,
-0.439238, -0.771538, -1.682072, 0, 1, 0.02745098, 1,
-0.4378408, 0.8974556, 0.7031034, 0, 1, 0.03529412, 1,
-0.4349188, -0.3193107, -2.706023, 0, 1, 0.03921569, 1,
-0.4332398, 0.235818, -2.767908, 0, 1, 0.04705882, 1,
-0.4314853, 0.8029559, -0.02836923, 0, 1, 0.05098039, 1,
-0.4299356, 0.3670705, -0.225951, 0, 1, 0.05882353, 1,
-0.4292384, 0.9611784, 0.4992702, 0, 1, 0.0627451, 1,
-0.4266486, 1.823468, 1.169001, 0, 1, 0.07058824, 1,
-0.4218842, -0.930927, -0.4198478, 0, 1, 0.07450981, 1,
-0.420003, 0.7588735, 0.9104588, 0, 1, 0.08235294, 1,
-0.4186531, -0.2854346, -0.6728578, 0, 1, 0.08627451, 1,
-0.4183855, 0.5938918, -0.2677514, 0, 1, 0.09411765, 1,
-0.4113828, 1.157679, -0.6512139, 0, 1, 0.1019608, 1,
-0.4098391, -1.693585, -2.887715, 0, 1, 0.1058824, 1,
-0.4081012, -1.403489, -3.188888, 0, 1, 0.1137255, 1,
-0.4078133, 0.9367545, -0.2968653, 0, 1, 0.1176471, 1,
-0.4054663, 1.365747, -0.520533, 0, 1, 0.1254902, 1,
-0.4039084, 0.08221681, -1.960169, 0, 1, 0.1294118, 1,
-0.4013976, 0.02980676, -1.379911, 0, 1, 0.1372549, 1,
-0.3994074, -0.3834122, -1.44295, 0, 1, 0.1411765, 1,
-0.392901, 1.1213, -1.153075, 0, 1, 0.1490196, 1,
-0.390641, 0.4738895, -0.3760891, 0, 1, 0.1529412, 1,
-0.3878079, 1.096489, -0.5025438, 0, 1, 0.1607843, 1,
-0.385275, -0.6652125, -3.19769, 0, 1, 0.1647059, 1,
-0.3832757, 0.5613675, 0.7993381, 0, 1, 0.172549, 1,
-0.3828663, 0.5578865, -1.683287, 0, 1, 0.1764706, 1,
-0.3815883, -1.673218, -2.966671, 0, 1, 0.1843137, 1,
-0.3806672, -0.9354526, -2.70652, 0, 1, 0.1882353, 1,
-0.3801053, 0.7630785, -0.3995348, 0, 1, 0.1960784, 1,
-0.3781178, -0.2099901, -2.835496, 0, 1, 0.2039216, 1,
-0.3745911, -1.275482, -2.579017, 0, 1, 0.2078431, 1,
-0.3685539, -0.6844658, -3.023053, 0, 1, 0.2156863, 1,
-0.368378, -0.9537463, -3.419713, 0, 1, 0.2196078, 1,
-0.3678117, 0.9854774, -0.1563018, 0, 1, 0.227451, 1,
-0.3676777, 1.399488, 1.070903, 0, 1, 0.2313726, 1,
-0.3672271, 0.823465, -0.2418737, 0, 1, 0.2392157, 1,
-0.3651225, 1.200314, 0.167996, 0, 1, 0.2431373, 1,
-0.3647006, -0.2458522, -0.7573442, 0, 1, 0.2509804, 1,
-0.3632242, 0.6685407, -0.1509782, 0, 1, 0.254902, 1,
-0.3625741, -0.8171839, -3.795003, 0, 1, 0.2627451, 1,
-0.3604807, 0.3562044, -1.456204, 0, 1, 0.2666667, 1,
-0.3597785, -0.5697353, -3.917338, 0, 1, 0.2745098, 1,
-0.3578672, 1.079521, 0.0702874, 0, 1, 0.2784314, 1,
-0.3528827, -0.6987342, -1.641513, 0, 1, 0.2862745, 1,
-0.3505156, -0.5349603, -3.369048, 0, 1, 0.2901961, 1,
-0.3476984, -0.280789, -3.378695, 0, 1, 0.2980392, 1,
-0.3425265, 0.7787974, 0.08262812, 0, 1, 0.3058824, 1,
-0.3417056, -1.245449, -2.156566, 0, 1, 0.3098039, 1,
-0.3403516, 1.046398, -0.4773737, 0, 1, 0.3176471, 1,
-0.3358179, 1.541568, 0.7162054, 0, 1, 0.3215686, 1,
-0.3348311, 0.5301214, -0.2869361, 0, 1, 0.3294118, 1,
-0.325037, 1.191468, -1.410952, 0, 1, 0.3333333, 1,
-0.318429, -1.084187, -3.285619, 0, 1, 0.3411765, 1,
-0.3138354, -0.3212299, -3.899684, 0, 1, 0.345098, 1,
-0.3134598, -0.6910141, -2.856931, 0, 1, 0.3529412, 1,
-0.3105399, -0.9462155, -1.46539, 0, 1, 0.3568628, 1,
-0.3090994, -0.2563686, -2.724108, 0, 1, 0.3647059, 1,
-0.3084601, -0.874504, -3.343212, 0, 1, 0.3686275, 1,
-0.3061762, 0.08799993, -2.656404, 0, 1, 0.3764706, 1,
-0.3028266, -0.04510604, -1.388066, 0, 1, 0.3803922, 1,
-0.3020152, -1.684311, -4.876059, 0, 1, 0.3882353, 1,
-0.2996391, -0.9480795, -2.097148, 0, 1, 0.3921569, 1,
-0.2975194, -1.991643, -1.948632, 0, 1, 0.4, 1,
-0.2948438, 0.1733077, -1.250056, 0, 1, 0.4078431, 1,
-0.2910691, 0.04317961, -1.533938, 0, 1, 0.4117647, 1,
-0.2809058, 0.1164708, -0.7398456, 0, 1, 0.4196078, 1,
-0.2781567, 0.6447961, 0.05129964, 0, 1, 0.4235294, 1,
-0.2764095, 1.246703, -0.9163978, 0, 1, 0.4313726, 1,
-0.2722521, 0.2790639, -3.246279, 0, 1, 0.4352941, 1,
-0.2711447, -0.9857794, -2.754535, 0, 1, 0.4431373, 1,
-0.2623082, -1.466467, -3.010359, 0, 1, 0.4470588, 1,
-0.2622452, -0.2143638, -1.957747, 0, 1, 0.454902, 1,
-0.2585464, -0.9839923, -2.415803, 0, 1, 0.4588235, 1,
-0.2545201, 0.464407, -1.1197, 0, 1, 0.4666667, 1,
-0.2529158, -1.077993, -3.422215, 0, 1, 0.4705882, 1,
-0.2463128, 0.0592351, -1.85728, 0, 1, 0.4784314, 1,
-0.2434699, -0.3031255, -0.1502135, 0, 1, 0.4823529, 1,
-0.2420643, 0.7724262, -2.074259, 0, 1, 0.4901961, 1,
-0.2413552, -1.945766, -2.517283, 0, 1, 0.4941176, 1,
-0.2406868, -0.8303011, -1.624101, 0, 1, 0.5019608, 1,
-0.2355873, -1.066184, -2.314627, 0, 1, 0.509804, 1,
-0.2354009, 0.6798728, -1.512668, 0, 1, 0.5137255, 1,
-0.2314177, -0.1325811, -1.252104, 0, 1, 0.5215687, 1,
-0.2259861, -0.2770157, -1.50699, 0, 1, 0.5254902, 1,
-0.2210642, 1.473449, -2.137186, 0, 1, 0.5333334, 1,
-0.2092194, 1.326067, -0.9921491, 0, 1, 0.5372549, 1,
-0.203043, -0.1997395, -0.7575738, 0, 1, 0.5450981, 1,
-0.2023334, 0.01427934, -1.873127, 0, 1, 0.5490196, 1,
-0.2000429, 0.5853881, 0.1030817, 0, 1, 0.5568628, 1,
-0.1991463, -0.7959697, -1.862504, 0, 1, 0.5607843, 1,
-0.198477, -0.9517485, -2.836675, 0, 1, 0.5686275, 1,
-0.1948144, -0.4077969, -4.932106, 0, 1, 0.572549, 1,
-0.1929286, -0.5373633, -4.807979, 0, 1, 0.5803922, 1,
-0.1907361, -0.8721299, -1.360286, 0, 1, 0.5843138, 1,
-0.1837161, -0.02150215, -2.468567, 0, 1, 0.5921569, 1,
-0.1827531, -0.4648679, -5.383008, 0, 1, 0.5960785, 1,
-0.1813105, -0.2737524, -2.244899, 0, 1, 0.6039216, 1,
-0.1799708, -0.8957263, -2.972787, 0, 1, 0.6117647, 1,
-0.1796937, 0.6966576, 0.08925539, 0, 1, 0.6156863, 1,
-0.1752916, -1.582721, -2.467505, 0, 1, 0.6235294, 1,
-0.1731162, 0.5739136, -0.4923521, 0, 1, 0.627451, 1,
-0.1693932, 0.7440561, -1.93955, 0, 1, 0.6352941, 1,
-0.1693694, 0.4378211, 0.4675762, 0, 1, 0.6392157, 1,
-0.1690266, 0.4081718, -1.295399, 0, 1, 0.6470588, 1,
-0.1665799, -0.924271, -2.763147, 0, 1, 0.6509804, 1,
-0.1639293, 0.07932062, -0.858465, 0, 1, 0.6588235, 1,
-0.1634079, -0.5334746, -5.598221, 0, 1, 0.6627451, 1,
-0.1604857, -0.01479477, -0.5931796, 0, 1, 0.6705883, 1,
-0.1599577, -1.60813, -1.676112, 0, 1, 0.6745098, 1,
-0.1579891, 0.1891753, -0.4318563, 0, 1, 0.682353, 1,
-0.1576529, 1.484441, -1.442698, 0, 1, 0.6862745, 1,
-0.1566849, -0.9846705, -3.039312, 0, 1, 0.6941177, 1,
-0.1535453, 2.002572, -0.05491644, 0, 1, 0.7019608, 1,
-0.1529167, -0.08398648, -0.7486175, 0, 1, 0.7058824, 1,
-0.1519357, 0.3917918, 1.845955, 0, 1, 0.7137255, 1,
-0.1466999, 2.647474, -0.1731686, 0, 1, 0.7176471, 1,
-0.1461365, 1.49448, 0.517409, 0, 1, 0.7254902, 1,
-0.1441823, -0.1118885, -3.459547, 0, 1, 0.7294118, 1,
-0.1404059, -0.6715659, -3.739452, 0, 1, 0.7372549, 1,
-0.1382919, -0.8654016, -3.366174, 0, 1, 0.7411765, 1,
-0.1340995, 2.040559, -0.6939466, 0, 1, 0.7490196, 1,
-0.1313689, 0.09685964, -0.363204, 0, 1, 0.7529412, 1,
-0.1261282, -2.153876, -4.028127, 0, 1, 0.7607843, 1,
-0.1250118, -0.5240408, -1.076792, 0, 1, 0.7647059, 1,
-0.1241246, -0.5103049, -1.619446, 0, 1, 0.772549, 1,
-0.1178636, 2.443083, 1.107903, 0, 1, 0.7764706, 1,
-0.1102743, 1.21426, 0.923811, 0, 1, 0.7843137, 1,
-0.1055677, -0.5185089, -2.945163, 0, 1, 0.7882353, 1,
-0.1048414, 0.7055042, 1.113008, 0, 1, 0.7960784, 1,
-0.102851, -0.02241792, -3.277189, 0, 1, 0.8039216, 1,
-0.1017874, 1.079422, -0.08681722, 0, 1, 0.8078431, 1,
-0.1016498, -0.932698, -4.506853, 0, 1, 0.8156863, 1,
-0.1007396, -0.02484727, -1.317446, 0, 1, 0.8196079, 1,
-0.09601486, 0.5933468, -0.161096, 0, 1, 0.827451, 1,
-0.09061786, 0.8377116, 0.04324486, 0, 1, 0.8313726, 1,
-0.08962875, 2.966166, 0.7716393, 0, 1, 0.8392157, 1,
-0.08583773, 1.616618, -1.641932, 0, 1, 0.8431373, 1,
-0.08127277, -0.7341312, -4.672525, 0, 1, 0.8509804, 1,
-0.07725285, 1.229978, 0.9570733, 0, 1, 0.854902, 1,
-0.06841065, -0.2758027, -1.776656, 0, 1, 0.8627451, 1,
-0.06596361, 0.6277426, 0.0740639, 0, 1, 0.8666667, 1,
-0.06483284, 0.8488976, -1.355488, 0, 1, 0.8745098, 1,
-0.06325245, 0.3031987, 0.4311435, 0, 1, 0.8784314, 1,
-0.06110064, -0.425196, -2.759041, 0, 1, 0.8862745, 1,
-0.05321287, -0.1083841, -1.797765, 0, 1, 0.8901961, 1,
-0.04978507, -0.7280969, -2.763009, 0, 1, 0.8980392, 1,
-0.04832987, -0.997282, -2.575258, 0, 1, 0.9058824, 1,
-0.04548784, -1.408165, -2.758897, 0, 1, 0.9098039, 1,
-0.04344859, 0.7449706, -0.5574696, 0, 1, 0.9176471, 1,
-0.04019199, 0.09193284, 0.9228366, 0, 1, 0.9215686, 1,
-0.03572232, -0.676407, -3.534147, 0, 1, 0.9294118, 1,
-0.03485677, 1.675586, -0.2030455, 0, 1, 0.9333333, 1,
-0.03425715, -1.038751, -3.492252, 0, 1, 0.9411765, 1,
-0.03003783, -0.5387142, -3.612845, 0, 1, 0.945098, 1,
-0.03001376, -0.01217851, -2.62758, 0, 1, 0.9529412, 1,
-0.02564521, 0.7954031, -1.39343, 0, 1, 0.9568627, 1,
-0.02451196, 0.2118578, 0.04216469, 0, 1, 0.9647059, 1,
-0.02274619, 0.1576051, -1.274517, 0, 1, 0.9686275, 1,
-0.02078265, -0.2110337, -4.225913, 0, 1, 0.9764706, 1,
-0.02030232, 0.7879955, -0.6880082, 0, 1, 0.9803922, 1,
-0.01536669, -0.597239, -4.119028, 0, 1, 0.9882353, 1,
-0.01517696, -0.4515079, -2.367977, 0, 1, 0.9921569, 1,
-0.01311372, 0.3875833, -1.31953, 0, 1, 1, 1,
-0.01293053, 2.326377, -0.0995169, 0, 0.9921569, 1, 1,
-0.01256501, -0.7790707, -1.570705, 0, 0.9882353, 1, 1,
-0.0103852, -2.259873, -3.289525, 0, 0.9803922, 1, 1,
-0.008956051, 0.7668877, 1.851377, 0, 0.9764706, 1, 1,
-0.007526552, 0.6739056, -0.1846639, 0, 0.9686275, 1, 1,
-0.006509442, 0.02246232, -0.5696183, 0, 0.9647059, 1, 1,
-0.004173091, 2.248491, -2.354838, 0, 0.9568627, 1, 1,
0.001518119, 1.450139, 0.256269, 0, 0.9529412, 1, 1,
0.00173575, 1.112876, 0.1801741, 0, 0.945098, 1, 1,
0.008981717, -0.4946651, 2.325674, 0, 0.9411765, 1, 1,
0.01342212, 0.3760882, 0.3401173, 0, 0.9333333, 1, 1,
0.01473567, -0.6394799, 3.269278, 0, 0.9294118, 1, 1,
0.01669964, -0.1078109, 2.735475, 0, 0.9215686, 1, 1,
0.01739116, 0.8709634, 2.445935, 0, 0.9176471, 1, 1,
0.01751317, -1.170347, 4.057051, 0, 0.9098039, 1, 1,
0.02331475, 0.08659973, -0.3826833, 0, 0.9058824, 1, 1,
0.02788245, 0.7233495, -0.2627168, 0, 0.8980392, 1, 1,
0.02902097, -1.272416, 2.962089, 0, 0.8901961, 1, 1,
0.03352623, 1.905176, -0.4066534, 0, 0.8862745, 1, 1,
0.034589, 0.9298459, -0.267507, 0, 0.8784314, 1, 1,
0.03545137, -0.740744, 2.521674, 0, 0.8745098, 1, 1,
0.03558445, 0.07946432, 0.198874, 0, 0.8666667, 1, 1,
0.03612527, -0.4613681, 1.121608, 0, 0.8627451, 1, 1,
0.04267196, 0.4069364, 0.6614367, 0, 0.854902, 1, 1,
0.04942444, -0.309009, 2.412968, 0, 0.8509804, 1, 1,
0.05025738, -0.329877, 1.583901, 0, 0.8431373, 1, 1,
0.05313186, 1.931226, -1.027966, 0, 0.8392157, 1, 1,
0.06157713, 0.7300069, 0.2296, 0, 0.8313726, 1, 1,
0.06556003, 1.3193, -0.4541763, 0, 0.827451, 1, 1,
0.07009082, -0.2769652, 4.596718, 0, 0.8196079, 1, 1,
0.07061896, -0.4451133, 4.512722, 0, 0.8156863, 1, 1,
0.07118833, 0.8520948, -0.7090551, 0, 0.8078431, 1, 1,
0.07291823, -0.3290805, 1.200202, 0, 0.8039216, 1, 1,
0.0734926, -0.03152581, 1.277316, 0, 0.7960784, 1, 1,
0.07441413, 0.9485192, 0.2859487, 0, 0.7882353, 1, 1,
0.08142792, -1.530815, 2.872175, 0, 0.7843137, 1, 1,
0.08161718, -0.5782417, 2.61954, 0, 0.7764706, 1, 1,
0.08230832, 0.1579929, 2.130072, 0, 0.772549, 1, 1,
0.08404511, -1.674698, 4.633896, 0, 0.7647059, 1, 1,
0.0882922, 0.38989, 0.3558865, 0, 0.7607843, 1, 1,
0.09254307, -0.9266866, 4.420965, 0, 0.7529412, 1, 1,
0.09516996, -0.01427954, -0.121828, 0, 0.7490196, 1, 1,
0.09546725, 0.4815421, 0.3160223, 0, 0.7411765, 1, 1,
0.1021101, 0.035671, 2.158115, 0, 0.7372549, 1, 1,
0.1056129, 0.2858279, 0.6805764, 0, 0.7294118, 1, 1,
0.1069077, 0.5002458, 0.01267454, 0, 0.7254902, 1, 1,
0.1084765, -1.422182, 4.419523, 0, 0.7176471, 1, 1,
0.1086794, 1.782974, 1.347928, 0, 0.7137255, 1, 1,
0.1106304, 0.3888405, 1.224697, 0, 0.7058824, 1, 1,
0.1120792, 1.036294, -0.4170978, 0, 0.6980392, 1, 1,
0.1126004, -0.7490329, 2.913182, 0, 0.6941177, 1, 1,
0.112731, -0.2479191, 3.553526, 0, 0.6862745, 1, 1,
0.1129092, -1.466086, 4.035831, 0, 0.682353, 1, 1,
0.112994, -0.3934883, 0.9599847, 0, 0.6745098, 1, 1,
0.113269, 0.5061299, 1.264982, 0, 0.6705883, 1, 1,
0.1159914, -0.1252671, 0.7792856, 0, 0.6627451, 1, 1,
0.1199411, -0.2573025, 2.99001, 0, 0.6588235, 1, 1,
0.1202187, 1.278327, 2.306055, 0, 0.6509804, 1, 1,
0.1245211, -0.7954515, 2.932984, 0, 0.6470588, 1, 1,
0.1257271, 0.548536, 0.06141606, 0, 0.6392157, 1, 1,
0.1302402, -1.122613, 1.433363, 0, 0.6352941, 1, 1,
0.1310737, 0.04905701, 2.266531, 0, 0.627451, 1, 1,
0.1357987, -1.767621, 4.085971, 0, 0.6235294, 1, 1,
0.1361061, -0.490708, 2.154268, 0, 0.6156863, 1, 1,
0.1369591, 1.525218, -1.50497, 0, 0.6117647, 1, 1,
0.1376143, -1.530527, 3.996314, 0, 0.6039216, 1, 1,
0.1385609, 0.9650475, 0.3286147, 0, 0.5960785, 1, 1,
0.1401546, 1.912722, 0.2477219, 0, 0.5921569, 1, 1,
0.1420872, 0.7723131, -0.2397035, 0, 0.5843138, 1, 1,
0.1441857, -0.6501426, 2.987791, 0, 0.5803922, 1, 1,
0.1477248, 0.997998, 1.207303, 0, 0.572549, 1, 1,
0.1484018, -0.425127, 3.388295, 0, 0.5686275, 1, 1,
0.1487814, 0.194404, 1.208136, 0, 0.5607843, 1, 1,
0.1487889, 1.373424, 1.48354, 0, 0.5568628, 1, 1,
0.148925, 0.6062731, 1.069309, 0, 0.5490196, 1, 1,
0.1519704, -0.972757, 3.899414, 0, 0.5450981, 1, 1,
0.1526151, -0.4346245, 4.037882, 0, 0.5372549, 1, 1,
0.1550812, -0.9494612, 3.124407, 0, 0.5333334, 1, 1,
0.1557589, -0.02503175, 0.9165827, 0, 0.5254902, 1, 1,
0.1558391, 0.1209742, 0.1048174, 0, 0.5215687, 1, 1,
0.1569081, 0.1338234, 1.225073, 0, 0.5137255, 1, 1,
0.1569543, -0.2236752, 2.131891, 0, 0.509804, 1, 1,
0.158739, 0.3803056, -0.01503141, 0, 0.5019608, 1, 1,
0.1600798, -0.2153433, 3.345588, 0, 0.4941176, 1, 1,
0.1749332, 0.5810667, -0.8831779, 0, 0.4901961, 1, 1,
0.1754445, -0.6517302, 2.134613, 0, 0.4823529, 1, 1,
0.1782613, -0.2105076, 2.300293, 0, 0.4784314, 1, 1,
0.1849343, 0.548053, -0.6075665, 0, 0.4705882, 1, 1,
0.1854101, 0.5502056, 0.1389389, 0, 0.4666667, 1, 1,
0.1891788, 0.1544294, 0.8520583, 0, 0.4588235, 1, 1,
0.1919505, 1.938242, 0.1153014, 0, 0.454902, 1, 1,
0.2069343, 1.674476, -0.3028, 0, 0.4470588, 1, 1,
0.2075935, -0.4881943, 3.135732, 0, 0.4431373, 1, 1,
0.2148709, -0.7772618, 4.709735, 0, 0.4352941, 1, 1,
0.2152368, -0.1221583, 2.937004, 0, 0.4313726, 1, 1,
0.216724, 0.8184253, 0.1919175, 0, 0.4235294, 1, 1,
0.2188919, 1.262703, 0.1752238, 0, 0.4196078, 1, 1,
0.2196191, 1.767862, -0.07197904, 0, 0.4117647, 1, 1,
0.2220098, -1.104812, 4.074758, 0, 0.4078431, 1, 1,
0.2220183, 0.2257525, 2.584071, 0, 0.4, 1, 1,
0.2222807, 0.5457534, 0.3530393, 0, 0.3921569, 1, 1,
0.2267676, -0.514863, 4.062545, 0, 0.3882353, 1, 1,
0.2315695, 0.3740121, -0.6827638, 0, 0.3803922, 1, 1,
0.2342888, -0.05728535, 4.321269, 0, 0.3764706, 1, 1,
0.2347276, -0.6099672, 3.020368, 0, 0.3686275, 1, 1,
0.2356095, -0.4157855, 4.4956, 0, 0.3647059, 1, 1,
0.2357179, -0.8384861, 2.362164, 0, 0.3568628, 1, 1,
0.2364094, -1.086019, 3.913105, 0, 0.3529412, 1, 1,
0.2398026, 0.1982156, 0.6424929, 0, 0.345098, 1, 1,
0.2417819, -0.02171465, 1.389791, 0, 0.3411765, 1, 1,
0.243442, -0.9645645, 3.382163, 0, 0.3333333, 1, 1,
0.2448708, 0.05152754, 1.092427, 0, 0.3294118, 1, 1,
0.2572471, -1.989134, 3.217608, 0, 0.3215686, 1, 1,
0.257398, 0.975414, -0.541989, 0, 0.3176471, 1, 1,
0.2629577, -2.23479, 2.394825, 0, 0.3098039, 1, 1,
0.2645711, -0.9967233, 0.7433242, 0, 0.3058824, 1, 1,
0.2654164, -1.918513, 3.50471, 0, 0.2980392, 1, 1,
0.2708593, -0.8234733, 4.04085, 0, 0.2901961, 1, 1,
0.2716904, -0.1430488, 1.726171, 0, 0.2862745, 1, 1,
0.276747, 0.4281551, -0.7103717, 0, 0.2784314, 1, 1,
0.2772825, 0.5368078, 2.426173, 0, 0.2745098, 1, 1,
0.2788861, 0.560011, -0.132399, 0, 0.2666667, 1, 1,
0.2835298, -0.7223935, 3.447917, 0, 0.2627451, 1, 1,
0.286498, -0.8105674, 1.653622, 0, 0.254902, 1, 1,
0.2878623, -0.4295198, 2.516518, 0, 0.2509804, 1, 1,
0.2915862, -0.9565957, 3.612485, 0, 0.2431373, 1, 1,
0.2964341, -0.1965279, 3.067866, 0, 0.2392157, 1, 1,
0.2966088, 1.317799, 0.08428462, 0, 0.2313726, 1, 1,
0.2968498, 1.162678, 0.4991184, 0, 0.227451, 1, 1,
0.3018579, -1.608217, 1.991491, 0, 0.2196078, 1, 1,
0.3037258, -0.1005451, 2.476448, 0, 0.2156863, 1, 1,
0.3076153, 2.051394, -0.5723994, 0, 0.2078431, 1, 1,
0.3125476, -0.6410621, 4.020078, 0, 0.2039216, 1, 1,
0.3157072, 1.352597, 0.2661387, 0, 0.1960784, 1, 1,
0.3170369, 0.164165, 1.043895, 0, 0.1882353, 1, 1,
0.3206841, 0.8734911, 0.2484211, 0, 0.1843137, 1, 1,
0.3284602, 0.09552477, -0.2172863, 0, 0.1764706, 1, 1,
0.3408068, 0.02821206, -0.04136883, 0, 0.172549, 1, 1,
0.344742, -0.217676, 3.397558, 0, 0.1647059, 1, 1,
0.3464839, 0.187064, -0.05834006, 0, 0.1607843, 1, 1,
0.3465669, -0.219695, 3.801834, 0, 0.1529412, 1, 1,
0.347828, -0.1389166, 1.58476, 0, 0.1490196, 1, 1,
0.3481455, 1.787412, 1.139296, 0, 0.1411765, 1, 1,
0.3491374, -0.7613888, 3.268543, 0, 0.1372549, 1, 1,
0.3513587, 0.7865972, -0.6392668, 0, 0.1294118, 1, 1,
0.3539425, -0.3718898, 2.557055, 0, 0.1254902, 1, 1,
0.3542209, -1.214279, 3.785057, 0, 0.1176471, 1, 1,
0.3577898, 0.2302274, 1.410946, 0, 0.1137255, 1, 1,
0.358803, -0.3467968, 2.673604, 0, 0.1058824, 1, 1,
0.361378, -0.3762767, 3.334641, 0, 0.09803922, 1, 1,
0.3624291, -0.01906045, 1.650011, 0, 0.09411765, 1, 1,
0.3736735, -0.8735529, 2.527849, 0, 0.08627451, 1, 1,
0.3738327, -1.657228, 2.974184, 0, 0.08235294, 1, 1,
0.3820322, 1.018494, 0.6403182, 0, 0.07450981, 1, 1,
0.3820554, 0.4319437, 2.284514, 0, 0.07058824, 1, 1,
0.3872899, -0.2838085, 1.65105, 0, 0.0627451, 1, 1,
0.3950846, -0.1186573, 2.726321, 0, 0.05882353, 1, 1,
0.3970896, -0.6368301, 3.583977, 0, 0.05098039, 1, 1,
0.397097, 1.523201, 0.07411616, 0, 0.04705882, 1, 1,
0.4005672, 0.5770695, 0.3682315, 0, 0.03921569, 1, 1,
0.4018679, -0.1493574, 0.3733517, 0, 0.03529412, 1, 1,
0.4026859, 0.5687503, 1.178936, 0, 0.02745098, 1, 1,
0.4054105, 0.7758027, -0.607437, 0, 0.02352941, 1, 1,
0.4066076, 0.5499607, 2.155963, 0, 0.01568628, 1, 1,
0.4138548, 1.777962, 1.129009, 0, 0.01176471, 1, 1,
0.4150482, 1.418134, -0.3208097, 0, 0.003921569, 1, 1,
0.4152007, -1.352874, 2.444111, 0.003921569, 0, 1, 1,
0.4158732, 0.2356793, 1.18123, 0.007843138, 0, 1, 1,
0.4168534, 0.08963246, 2.870949, 0.01568628, 0, 1, 1,
0.4170554, 0.7960806, 1.457531, 0.01960784, 0, 1, 1,
0.4188355, -0.4322174, 2.948945, 0.02745098, 0, 1, 1,
0.4198346, 0.6016144, 0.9193268, 0.03137255, 0, 1, 1,
0.4275063, 0.994436, 0.1872427, 0.03921569, 0, 1, 1,
0.4310593, 0.8747209, -0.3327002, 0.04313726, 0, 1, 1,
0.4317439, -1.934979, 3.261519, 0.05098039, 0, 1, 1,
0.4331711, 0.1530745, 1.69513, 0.05490196, 0, 1, 1,
0.4356504, -0.4726541, 2.389222, 0.0627451, 0, 1, 1,
0.4390543, 0.09540948, 1.282436, 0.06666667, 0, 1, 1,
0.4470204, -0.2890286, 1.724277, 0.07450981, 0, 1, 1,
0.4483414, -0.2129397, 1.669658, 0.07843138, 0, 1, 1,
0.4562153, 0.2179338, 1.092896, 0.08627451, 0, 1, 1,
0.4565348, -0.2179765, 2.298444, 0.09019608, 0, 1, 1,
0.464156, 0.08769876, 1.33618, 0.09803922, 0, 1, 1,
0.4650986, 0.920771, 0.743117, 0.1058824, 0, 1, 1,
0.467476, -0.2830262, 1.679019, 0.1098039, 0, 1, 1,
0.4752085, -0.4262696, 2.28375, 0.1176471, 0, 1, 1,
0.4793521, 0.06809727, 1.662516, 0.1215686, 0, 1, 1,
0.482143, -1.329349, 1.649164, 0.1294118, 0, 1, 1,
0.4849204, -0.7306418, 3.317548, 0.1333333, 0, 1, 1,
0.4850208, 0.2039491, 1.513848, 0.1411765, 0, 1, 1,
0.4852717, 0.8651434, 2.352741, 0.145098, 0, 1, 1,
0.4861375, -1.941581, 3.991137, 0.1529412, 0, 1, 1,
0.4920866, -1.281372, 3.035991, 0.1568628, 0, 1, 1,
0.4987142, 2.314039, -0.5355299, 0.1647059, 0, 1, 1,
0.4993622, 0.9624543, 0.08443207, 0.1686275, 0, 1, 1,
0.508704, -0.7398893, 2.379441, 0.1764706, 0, 1, 1,
0.508741, 0.1482853, 2.978961, 0.1803922, 0, 1, 1,
0.5096481, -3.074817, 1.300272, 0.1882353, 0, 1, 1,
0.509738, -1.173791, 0.9631312, 0.1921569, 0, 1, 1,
0.5163111, 1.64632, 1.462697, 0.2, 0, 1, 1,
0.5171619, -0.2001474, 2.040003, 0.2078431, 0, 1, 1,
0.5192836, 0.8383575, 1.793579, 0.2117647, 0, 1, 1,
0.5205357, -0.9664505, 3.072805, 0.2196078, 0, 1, 1,
0.5265369, -0.003811479, 0.7529554, 0.2235294, 0, 1, 1,
0.5276518, -2.987178, 4.920757, 0.2313726, 0, 1, 1,
0.5282708, 0.4475118, -1.29201, 0.2352941, 0, 1, 1,
0.5330955, -0.09775949, 2.393209, 0.2431373, 0, 1, 1,
0.5407572, -0.2172181, 1.965128, 0.2470588, 0, 1, 1,
0.5414507, 1.089528, 0.1304146, 0.254902, 0, 1, 1,
0.546095, 0.1901642, 0.4394128, 0.2588235, 0, 1, 1,
0.5480716, 0.08497835, 0.4005673, 0.2666667, 0, 1, 1,
0.5531949, -0.7563015, 2.413251, 0.2705882, 0, 1, 1,
0.5572379, 1.146005, 1.041736, 0.2784314, 0, 1, 1,
0.5580904, -0.1282219, 1.202722, 0.282353, 0, 1, 1,
0.5588264, -0.4449223, 0.8086721, 0.2901961, 0, 1, 1,
0.5607981, 1.024776, 2.207815, 0.2941177, 0, 1, 1,
0.5690802, 0.04107117, 1.377206, 0.3019608, 0, 1, 1,
0.5694788, -0.4691003, 1.312868, 0.3098039, 0, 1, 1,
0.5705702, -0.1889115, 1.077321, 0.3137255, 0, 1, 1,
0.5721205, 1.559839, -1.288713, 0.3215686, 0, 1, 1,
0.5725214, -0.6657549, 1.559124, 0.3254902, 0, 1, 1,
0.5774379, -1.161662, 0.2358373, 0.3333333, 0, 1, 1,
0.5822212, -0.2215099, 2.609095, 0.3372549, 0, 1, 1,
0.5860174, -0.7736279, 3.398453, 0.345098, 0, 1, 1,
0.5934395, 2.696415, 0.45582, 0.3490196, 0, 1, 1,
0.5954011, 1.568046, 0.2572187, 0.3568628, 0, 1, 1,
0.5960407, -1.013701, 2.892721, 0.3607843, 0, 1, 1,
0.6003327, 0.2626968, 3.375719, 0.3686275, 0, 1, 1,
0.6035895, 0.5287021, 0.4740835, 0.372549, 0, 1, 1,
0.6054118, -0.9461722, 3.10082, 0.3803922, 0, 1, 1,
0.605687, -0.5285766, 2.744761, 0.3843137, 0, 1, 1,
0.6079364, 0.6403521, 0.8333362, 0.3921569, 0, 1, 1,
0.6083853, -0.4951603, 1.094, 0.3960784, 0, 1, 1,
0.6152552, -3.039556, 1.938142, 0.4039216, 0, 1, 1,
0.6199164, 0.6597677, 1.678908, 0.4117647, 0, 1, 1,
0.6242648, 1.069661, 0.7217135, 0.4156863, 0, 1, 1,
0.6249925, -0.3650693, 2.254226, 0.4235294, 0, 1, 1,
0.629093, 0.3146566, 2.695265, 0.427451, 0, 1, 1,
0.6334636, 1.389413, 0.4833063, 0.4352941, 0, 1, 1,
0.635654, 0.9764253, 0.08606815, 0.4392157, 0, 1, 1,
0.6358369, 0.5014665, 0.5405452, 0.4470588, 0, 1, 1,
0.638311, -1.220764, 1.064611, 0.4509804, 0, 1, 1,
0.6397896, 1.339686, 1.808928, 0.4588235, 0, 1, 1,
0.6439386, 0.2412987, 0.6484073, 0.4627451, 0, 1, 1,
0.6503556, 0.2036033, 2.681272, 0.4705882, 0, 1, 1,
0.6508139, -0.1647746, 0.5208294, 0.4745098, 0, 1, 1,
0.6535131, -0.7093279, 0.8132169, 0.4823529, 0, 1, 1,
0.6539555, 0.2538831, 1.443629, 0.4862745, 0, 1, 1,
0.6539746, -1.042285, 1.677339, 0.4941176, 0, 1, 1,
0.6554481, -0.5082629, 0.7106218, 0.5019608, 0, 1, 1,
0.659816, -0.3980401, 0.649639, 0.5058824, 0, 1, 1,
0.6603513, -0.5744475, 1.548897, 0.5137255, 0, 1, 1,
0.6629111, -0.8479902, 2.310156, 0.5176471, 0, 1, 1,
0.6630676, -0.5071954, 2.500684, 0.5254902, 0, 1, 1,
0.6631022, 1.119052, 0.7235132, 0.5294118, 0, 1, 1,
0.6665963, -0.4087198, 3.187125, 0.5372549, 0, 1, 1,
0.6891967, 0.1048217, 1.213506, 0.5411765, 0, 1, 1,
0.6892842, 0.6531145, 0.04728582, 0.5490196, 0, 1, 1,
0.6902339, 1.013188, 2.312049, 0.5529412, 0, 1, 1,
0.6943896, -0.04064136, 1.83619, 0.5607843, 0, 1, 1,
0.6948354, 0.02355864, 2.61627, 0.5647059, 0, 1, 1,
0.6960233, -1.083714, -0.1592925, 0.572549, 0, 1, 1,
0.6966301, 1.372403, 0.3573262, 0.5764706, 0, 1, 1,
0.696689, 1.617045, 0.4523334, 0.5843138, 0, 1, 1,
0.69705, 0.8559046, 0.7110469, 0.5882353, 0, 1, 1,
0.6986776, 0.8579748, 0.2135323, 0.5960785, 0, 1, 1,
0.7103487, -0.212115, 2.566497, 0.6039216, 0, 1, 1,
0.7119358, 0.4585546, 1.811453, 0.6078432, 0, 1, 1,
0.7272936, -0.1069209, 2.507862, 0.6156863, 0, 1, 1,
0.7285376, 0.8211157, 0.4977422, 0.6196079, 0, 1, 1,
0.7337716, 2.407075, 0.1904264, 0.627451, 0, 1, 1,
0.7338176, 0.2329469, 0.5590898, 0.6313726, 0, 1, 1,
0.7357451, -1.335891, 3.26913, 0.6392157, 0, 1, 1,
0.7389731, 1.634172, 0.8260316, 0.6431373, 0, 1, 1,
0.7400343, 2.067405, 1.048223, 0.6509804, 0, 1, 1,
0.7433501, -0.7793692, 5.340419, 0.654902, 0, 1, 1,
0.7471712, 0.300253, 1.547882, 0.6627451, 0, 1, 1,
0.7476701, 0.4650629, -0.6909676, 0.6666667, 0, 1, 1,
0.7489231, -1.441363, 2.106425, 0.6745098, 0, 1, 1,
0.7598061, 0.577244, 0.6189846, 0.6784314, 0, 1, 1,
0.7649092, -0.4092988, 0.829212, 0.6862745, 0, 1, 1,
0.765636, 1.15534, -0.7172962, 0.6901961, 0, 1, 1,
0.7666187, 2.140049, 0.2864763, 0.6980392, 0, 1, 1,
0.7729772, 2.844646, 0.4066041, 0.7058824, 0, 1, 1,
0.7765593, 1.380919, 1.805166, 0.7098039, 0, 1, 1,
0.7801264, 1.260119, 0.09010082, 0.7176471, 0, 1, 1,
0.7811844, 1.432796, 0.6441931, 0.7215686, 0, 1, 1,
0.7836571, -0.3649105, 0.746143, 0.7294118, 0, 1, 1,
0.7919307, 0.05497231, 0.7761869, 0.7333333, 0, 1, 1,
0.8032908, 0.9588505, 0.6502569, 0.7411765, 0, 1, 1,
0.8061551, -0.152443, 1.486659, 0.7450981, 0, 1, 1,
0.8095335, 1.240411, 0.3009481, 0.7529412, 0, 1, 1,
0.8099764, 0.1428055, 0.547655, 0.7568628, 0, 1, 1,
0.8123474, -0.7018244, 1.994261, 0.7647059, 0, 1, 1,
0.8130958, 0.2861315, 1.908702, 0.7686275, 0, 1, 1,
0.8135334, 0.8359686, 0.09586445, 0.7764706, 0, 1, 1,
0.8139812, -1.259415, 2.379558, 0.7803922, 0, 1, 1,
0.8236486, 0.4052974, 1.866722, 0.7882353, 0, 1, 1,
0.8244162, -1.161766, 1.60535, 0.7921569, 0, 1, 1,
0.8260738, -0.9225855, 1.990065, 0.8, 0, 1, 1,
0.8262985, -0.7788834, 3.011325, 0.8078431, 0, 1, 1,
0.82723, -1.174639, 1.491439, 0.8117647, 0, 1, 1,
0.8288731, 0.04424795, 1.63776, 0.8196079, 0, 1, 1,
0.831644, 1.304387, 0.6011962, 0.8235294, 0, 1, 1,
0.8348917, 0.06050615, 1.255643, 0.8313726, 0, 1, 1,
0.8367041, 1.570164, -0.9439917, 0.8352941, 0, 1, 1,
0.8395525, 0.2483584, -0.5969921, 0.8431373, 0, 1, 1,
0.8417115, 0.8185516, 2.465143, 0.8470588, 0, 1, 1,
0.8435786, 1.015897, 1.503503, 0.854902, 0, 1, 1,
0.8446935, 0.1010717, 1.20723, 0.8588235, 0, 1, 1,
0.8519775, 0.09341814, 3.388494, 0.8666667, 0, 1, 1,
0.8603164, -0.2211876, 2.432197, 0.8705882, 0, 1, 1,
0.8620325, 0.07111482, 2.020638, 0.8784314, 0, 1, 1,
0.8652841, -0.1903631, -0.6283371, 0.8823529, 0, 1, 1,
0.8670222, 0.5646691, -0.8156888, 0.8901961, 0, 1, 1,
0.8743097, -0.2890075, 2.330289, 0.8941177, 0, 1, 1,
0.8753917, 0.4919675, 1.457674, 0.9019608, 0, 1, 1,
0.8808711, -0.4872219, 2.109538, 0.9098039, 0, 1, 1,
0.8815776, 0.004535165, 1.355194, 0.9137255, 0, 1, 1,
0.8816625, 1.683882, 1.154096, 0.9215686, 0, 1, 1,
0.8826824, 0.1341138, 0.06981467, 0.9254902, 0, 1, 1,
0.8843822, -0.8989788, 2.500534, 0.9333333, 0, 1, 1,
0.8905866, 0.2235406, 0.03698348, 0.9372549, 0, 1, 1,
0.8913022, -0.6914282, 1.953719, 0.945098, 0, 1, 1,
0.895607, -0.6571742, 4.380288, 0.9490196, 0, 1, 1,
0.8989645, 0.9824319, 0.9223557, 0.9568627, 0, 1, 1,
0.9027832, 0.9233127, 0.8654981, 0.9607843, 0, 1, 1,
0.9068417, 0.451001, 0.812696, 0.9686275, 0, 1, 1,
0.910098, -0.9763547, 1.769602, 0.972549, 0, 1, 1,
0.9170072, -1.591796, 4.618001, 0.9803922, 0, 1, 1,
0.9185717, -1.217236, 0.8973547, 0.9843137, 0, 1, 1,
0.9209598, 0.9024865, -0.07958824, 0.9921569, 0, 1, 1,
0.9246603, -0.542141, 3.631337, 0.9960784, 0, 1, 1,
0.9533306, -0.01563728, 0.7060466, 1, 0, 0.9960784, 1,
0.9550361, 0.3742524, 0.2553622, 1, 0, 0.9882353, 1,
0.9598817, -1.963068, 2.762418, 1, 0, 0.9843137, 1,
0.9605547, 0.7292802, 0.7299691, 1, 0, 0.9764706, 1,
0.9619799, 0.1827864, 0.5541171, 1, 0, 0.972549, 1,
0.9623317, 0.1101772, -0.2344379, 1, 0, 0.9647059, 1,
0.9697319, 0.7145022, 1.452143, 1, 0, 0.9607843, 1,
0.9794637, 0.2731763, 2.03326, 1, 0, 0.9529412, 1,
0.9807827, 0.4600855, 2.400859, 1, 0, 0.9490196, 1,
0.9907423, -0.7437649, 3.22992, 1, 0, 0.9411765, 1,
0.9911491, -1.052546, 3.440975, 1, 0, 0.9372549, 1,
0.9960952, 0.4000292, 0.9529551, 1, 0, 0.9294118, 1,
0.9978324, 0.1909496, -0.1220652, 1, 0, 0.9254902, 1,
1.001672, -2.013295, 4.724791, 1, 0, 0.9176471, 1,
1.005931, -0.7680135, 1.113219, 1, 0, 0.9137255, 1,
1.010631, -0.9617139, 1.568873, 1, 0, 0.9058824, 1,
1.017357, 0.1039278, 2.031907, 1, 0, 0.9019608, 1,
1.02298, 0.4311044, 0.8978928, 1, 0, 0.8941177, 1,
1.023335, -1.361538, 2.908231, 1, 0, 0.8862745, 1,
1.025956, -0.6114161, 2.703279, 1, 0, 0.8823529, 1,
1.031043, 0.02721218, 1.78544, 1, 0, 0.8745098, 1,
1.035771, -0.1726549, 0.8181219, 1, 0, 0.8705882, 1,
1.036111, -0.3287005, 2.949035, 1, 0, 0.8627451, 1,
1.045132, -1.355373, 2.331452, 1, 0, 0.8588235, 1,
1.046811, -0.1743367, 0.5961933, 1, 0, 0.8509804, 1,
1.049439, -0.8006698, 2.75152, 1, 0, 0.8470588, 1,
1.06782, 0.2943282, 2.552103, 1, 0, 0.8392157, 1,
1.07319, 1.511397, -0.4690231, 1, 0, 0.8352941, 1,
1.074655, 0.3368125, 1.111008, 1, 0, 0.827451, 1,
1.075482, -0.4465713, 0.2041059, 1, 0, 0.8235294, 1,
1.089082, 0.06703054, 0.9738341, 1, 0, 0.8156863, 1,
1.09015, -0.6383886, 3.057315, 1, 0, 0.8117647, 1,
1.113411, -0.08153304, 2.717349, 1, 0, 0.8039216, 1,
1.115614, -0.1534719, 2.668782, 1, 0, 0.7960784, 1,
1.119257, -1.080898, 0.54715, 1, 0, 0.7921569, 1,
1.120423, 0.06050846, 0.4516831, 1, 0, 0.7843137, 1,
1.125627, -1.975854, 3.019449, 1, 0, 0.7803922, 1,
1.133613, -0.6458859, 2.178436, 1, 0, 0.772549, 1,
1.133879, -0.5046784, 1.983, 1, 0, 0.7686275, 1,
1.142049, -0.06770634, 0.7467439, 1, 0, 0.7607843, 1,
1.152218, -0.6249663, 1.847549, 1, 0, 0.7568628, 1,
1.159841, -1.429036, 2.950914, 1, 0, 0.7490196, 1,
1.167395, -0.3983286, 1.793671, 1, 0, 0.7450981, 1,
1.169883, 1.171224, 1.339309, 1, 0, 0.7372549, 1,
1.180397, 0.5496175, 1.689619, 1, 0, 0.7333333, 1,
1.1848, -0.6206958, 2.962075, 1, 0, 0.7254902, 1,
1.186382, -1.245577, 0.8383688, 1, 0, 0.7215686, 1,
1.205997, 0.04336545, 2.02407, 1, 0, 0.7137255, 1,
1.214564, 1.612522, 0.09062095, 1, 0, 0.7098039, 1,
1.21725, -0.04901757, 1.917665, 1, 0, 0.7019608, 1,
1.218364, -0.9346102, 1.270221, 1, 0, 0.6941177, 1,
1.21894, 0.6256082, 2.097957, 1, 0, 0.6901961, 1,
1.220479, -0.9394057, 2.391329, 1, 0, 0.682353, 1,
1.226099, -1.078125, 3.453309, 1, 0, 0.6784314, 1,
1.229288, 1.161219, -0.5988773, 1, 0, 0.6705883, 1,
1.245615, -0.3628321, 2.520013, 1, 0, 0.6666667, 1,
1.247579, 0.5115495, 0.4325334, 1, 0, 0.6588235, 1,
1.260556, 0.6975064, -0.5523919, 1, 0, 0.654902, 1,
1.270869, -0.2036074, 2.028519, 1, 0, 0.6470588, 1,
1.272428, 0.6361212, 3.130381, 1, 0, 0.6431373, 1,
1.279684, 2.176999, -0.3418161, 1, 0, 0.6352941, 1,
1.283723, -0.5670558, 2.231303, 1, 0, 0.6313726, 1,
1.291027, -0.5625961, 2.873383, 1, 0, 0.6235294, 1,
1.296588, 1.255732, 0.919365, 1, 0, 0.6196079, 1,
1.303616, -0.250561, 2.294292, 1, 0, 0.6117647, 1,
1.307895, -0.2031654, 1.108237, 1, 0, 0.6078432, 1,
1.317563, 2.301064, 0.1401436, 1, 0, 0.6, 1,
1.317765, -0.9544778, 3.309252, 1, 0, 0.5921569, 1,
1.320245, -0.06077157, 0.3383258, 1, 0, 0.5882353, 1,
1.330948, 1.351543, -0.1781747, 1, 0, 0.5803922, 1,
1.334862, 0.3528629, 0.5467506, 1, 0, 0.5764706, 1,
1.355455, 0.05653798, 2.561464, 1, 0, 0.5686275, 1,
1.358453, -1.260029, 3.710254, 1, 0, 0.5647059, 1,
1.362414, -0.3002689, 2.852344, 1, 0, 0.5568628, 1,
1.377085, -0.9664438, 2.557702, 1, 0, 0.5529412, 1,
1.378396, -0.4915294, 1.424426, 1, 0, 0.5450981, 1,
1.378791, -1.033622, 2.214134, 1, 0, 0.5411765, 1,
1.383274, 2.184901, 1.971594, 1, 0, 0.5333334, 1,
1.393632, 1.10704, 0.4311664, 1, 0, 0.5294118, 1,
1.400729, 0.04474264, 1.422553, 1, 0, 0.5215687, 1,
1.410056, -1.816095, 2.900816, 1, 0, 0.5176471, 1,
1.413931, -0.5966471, 2.20453, 1, 0, 0.509804, 1,
1.417603, -1.544533, 5.04879, 1, 0, 0.5058824, 1,
1.420376, -0.4344943, 0.7832798, 1, 0, 0.4980392, 1,
1.423547, 1.419706, 1.292944, 1, 0, 0.4901961, 1,
1.44187, 0.835398, -0.229946, 1, 0, 0.4862745, 1,
1.444821, -0.6765736, 1.702572, 1, 0, 0.4784314, 1,
1.459682, 0.1906574, 0.27152, 1, 0, 0.4745098, 1,
1.46424, 1.403073, 0.7221367, 1, 0, 0.4666667, 1,
1.46579, 0.03445486, 1.87266, 1, 0, 0.4627451, 1,
1.475503, -0.3501234, 1.329276, 1, 0, 0.454902, 1,
1.475707, -0.6998634, 1.974035, 1, 0, 0.4509804, 1,
1.477723, 0.2002825, 1.040288, 1, 0, 0.4431373, 1,
1.479724, -0.7819555, 0.2845578, 1, 0, 0.4392157, 1,
1.483663, 0.2443694, 1.104561, 1, 0, 0.4313726, 1,
1.485283, 0.3033731, 1.871044, 1, 0, 0.427451, 1,
1.500543, 0.5072721, 1.161206, 1, 0, 0.4196078, 1,
1.513653, -0.8345982, 2.278977, 1, 0, 0.4156863, 1,
1.515534, -0.389035, 1.907538, 1, 0, 0.4078431, 1,
1.519071, 1.124161, 0.06124209, 1, 0, 0.4039216, 1,
1.532167, -1.944767, 2.301109, 1, 0, 0.3960784, 1,
1.535116, -0.6824483, 1.547502, 1, 0, 0.3882353, 1,
1.540087, 1.027583, 1.825791, 1, 0, 0.3843137, 1,
1.55139, 0.1646505, 0.3236753, 1, 0, 0.3764706, 1,
1.553497, 0.2237677, 2.583506, 1, 0, 0.372549, 1,
1.559369, 0.2718157, 1.14678, 1, 0, 0.3647059, 1,
1.56637, -0.3849442, 2.285949, 1, 0, 0.3607843, 1,
1.571232, 0.3682578, 1.4195, 1, 0, 0.3529412, 1,
1.597398, 0.4922529, -0.901494, 1, 0, 0.3490196, 1,
1.604143, 0.9254024, 1.576339, 1, 0, 0.3411765, 1,
1.604143, 0.572367, 0.8204103, 1, 0, 0.3372549, 1,
1.612844, 0.2244269, 2.246912, 1, 0, 0.3294118, 1,
1.615463, 1.20984, -0.5668253, 1, 0, 0.3254902, 1,
1.624593, -0.6086795, 2.176723, 1, 0, 0.3176471, 1,
1.627834, -0.8567047, 1.300314, 1, 0, 0.3137255, 1,
1.63377, -1.626625, 3.423938, 1, 0, 0.3058824, 1,
1.635563, -1.838803, 2.001669, 1, 0, 0.2980392, 1,
1.642386, 0.7792919, -0.4148482, 1, 0, 0.2941177, 1,
1.646187, -0.0668893, 0.6438289, 1, 0, 0.2862745, 1,
1.649846, -0.1395048, 1.383662, 1, 0, 0.282353, 1,
1.651427, 1.14929, 0.5004774, 1, 0, 0.2745098, 1,
1.661069, -0.4876196, 1.167858, 1, 0, 0.2705882, 1,
1.689229, -1.063081, 2.702978, 1, 0, 0.2627451, 1,
1.693511, 0.008270692, 2.223245, 1, 0, 0.2588235, 1,
1.717404, 1.805941, 0.665178, 1, 0, 0.2509804, 1,
1.729055, 0.5990772, -1.523421, 1, 0, 0.2470588, 1,
1.753631, -0.4196956, 0.8092948, 1, 0, 0.2392157, 1,
1.814499, 0.6114817, 2.078303, 1, 0, 0.2352941, 1,
1.836156, 0.04839814, 1.774929, 1, 0, 0.227451, 1,
1.889423, -0.5007776, 2.592141, 1, 0, 0.2235294, 1,
1.906385, -1.366352, 0.9931422, 1, 0, 0.2156863, 1,
1.913035, -0.5752817, 2.713338, 1, 0, 0.2117647, 1,
1.924728, -0.2532935, -1.207596, 1, 0, 0.2039216, 1,
1.955351, 0.3575579, -0.04189517, 1, 0, 0.1960784, 1,
1.962301, -0.2603524, 2.90271, 1, 0, 0.1921569, 1,
1.967211, 0.5584147, 3.483219, 1, 0, 0.1843137, 1,
1.970608, -0.4605125, 3.973475, 1, 0, 0.1803922, 1,
1.977429, -1.002537, 1.694584, 1, 0, 0.172549, 1,
1.987388, 0.9914247, -0.1237134, 1, 0, 0.1686275, 1,
1.998628, 0.04756885, -0.1139299, 1, 0, 0.1607843, 1,
2.01846, 1.312556, 1.371977, 1, 0, 0.1568628, 1,
2.037392, 3.144294, 0.6082048, 1, 0, 0.1490196, 1,
2.087951, 0.6388304, 1.420821, 1, 0, 0.145098, 1,
2.094401, -0.7917498, 1.200735, 1, 0, 0.1372549, 1,
2.11959, 0.7244642, 1.250873, 1, 0, 0.1333333, 1,
2.126569, -0.9142756, 4.322295, 1, 0, 0.1254902, 1,
2.139219, -0.5288817, 1.95355, 1, 0, 0.1215686, 1,
2.225705, -1.066246, -0.5972658, 1, 0, 0.1137255, 1,
2.231801, -0.1819276, 1.389675, 1, 0, 0.1098039, 1,
2.257165, 2.295569, 0.8805257, 1, 0, 0.1019608, 1,
2.262036, -1.137234, 2.079943, 1, 0, 0.09411765, 1,
2.267406, 0.3175429, 0.2556217, 1, 0, 0.09019608, 1,
2.32496, 0.449617, 1.361572, 1, 0, 0.08235294, 1,
2.326817, 0.5990477, 1.332566, 1, 0, 0.07843138, 1,
2.340691, -0.5036091, 0.856523, 1, 0, 0.07058824, 1,
2.419004, 0.1348829, 1.097481, 1, 0, 0.06666667, 1,
2.446582, 1.156302, 1.246281, 1, 0, 0.05882353, 1,
2.462771, 0.8343404, 0.9478619, 1, 0, 0.05490196, 1,
2.502023, -1.111004, 2.13239, 1, 0, 0.04705882, 1,
2.527663, 0.2870646, 3.117348, 1, 0, 0.04313726, 1,
2.546298, -0.7444496, 2.592277, 1, 0, 0.03529412, 1,
2.617035, -0.1633969, 2.901825, 1, 0, 0.03137255, 1,
2.643476, 0.9053879, 1.014743, 1, 0, 0.02352941, 1,
2.658433, 0.1057802, 2.363003, 1, 0, 0.01960784, 1,
2.875962, 0.7578271, 1.590806, 1, 0, 0.01176471, 1,
2.940483, -1.372175, 2.025164, 1, 0, 0.007843138, 1
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
-0.2242725, -4.258112, -7.722638, 0, -0.5, 0.5, 0.5,
-0.2242725, -4.258112, -7.722638, 1, -0.5, 0.5, 0.5,
-0.2242725, -4.258112, -7.722638, 1, 1.5, 0.5, 0.5,
-0.2242725, -4.258112, -7.722638, 0, 1.5, 0.5, 0.5
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
-4.46188, 0.04873013, -7.722638, 0, -0.5, 0.5, 0.5,
-4.46188, 0.04873013, -7.722638, 1, -0.5, 0.5, 0.5,
-4.46188, 0.04873013, -7.722638, 1, 1.5, 0.5, 0.5,
-4.46188, 0.04873013, -7.722638, 0, 1.5, 0.5, 0.5
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
-4.46188, -4.258112, -0.2444708, 0, -0.5, 0.5, 0.5,
-4.46188, -4.258112, -0.2444708, 1, -0.5, 0.5, 0.5,
-4.46188, -4.258112, -0.2444708, 1, 1.5, 0.5, 0.5,
-4.46188, -4.258112, -0.2444708, 0, 1.5, 0.5, 0.5
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
-3, -3.264226, -5.996907,
2, -3.264226, -5.996907,
-3, -3.264226, -5.996907,
-3, -3.429874, -6.284529,
-2, -3.264226, -5.996907,
-2, -3.429874, -6.284529,
-1, -3.264226, -5.996907,
-1, -3.429874, -6.284529,
0, -3.264226, -5.996907,
0, -3.429874, -6.284529,
1, -3.264226, -5.996907,
1, -3.429874, -6.284529,
2, -3.264226, -5.996907,
2, -3.429874, -6.284529
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
-3, -3.761169, -6.859773, 0, -0.5, 0.5, 0.5,
-3, -3.761169, -6.859773, 1, -0.5, 0.5, 0.5,
-3, -3.761169, -6.859773, 1, 1.5, 0.5, 0.5,
-3, -3.761169, -6.859773, 0, 1.5, 0.5, 0.5,
-2, -3.761169, -6.859773, 0, -0.5, 0.5, 0.5,
-2, -3.761169, -6.859773, 1, -0.5, 0.5, 0.5,
-2, -3.761169, -6.859773, 1, 1.5, 0.5, 0.5,
-2, -3.761169, -6.859773, 0, 1.5, 0.5, 0.5,
-1, -3.761169, -6.859773, 0, -0.5, 0.5, 0.5,
-1, -3.761169, -6.859773, 1, -0.5, 0.5, 0.5,
-1, -3.761169, -6.859773, 1, 1.5, 0.5, 0.5,
-1, -3.761169, -6.859773, 0, 1.5, 0.5, 0.5,
0, -3.761169, -6.859773, 0, -0.5, 0.5, 0.5,
0, -3.761169, -6.859773, 1, -0.5, 0.5, 0.5,
0, -3.761169, -6.859773, 1, 1.5, 0.5, 0.5,
0, -3.761169, -6.859773, 0, 1.5, 0.5, 0.5,
1, -3.761169, -6.859773, 0, -0.5, 0.5, 0.5,
1, -3.761169, -6.859773, 1, -0.5, 0.5, 0.5,
1, -3.761169, -6.859773, 1, 1.5, 0.5, 0.5,
1, -3.761169, -6.859773, 0, 1.5, 0.5, 0.5,
2, -3.761169, -6.859773, 0, -0.5, 0.5, 0.5,
2, -3.761169, -6.859773, 1, -0.5, 0.5, 0.5,
2, -3.761169, -6.859773, 1, 1.5, 0.5, 0.5,
2, -3.761169, -6.859773, 0, 1.5, 0.5, 0.5
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
-3.48397, -3, -5.996907,
-3.48397, 3, -5.996907,
-3.48397, -3, -5.996907,
-3.646955, -3, -6.284529,
-3.48397, -2, -5.996907,
-3.646955, -2, -6.284529,
-3.48397, -1, -5.996907,
-3.646955, -1, -6.284529,
-3.48397, 0, -5.996907,
-3.646955, 0, -6.284529,
-3.48397, 1, -5.996907,
-3.646955, 1, -6.284529,
-3.48397, 2, -5.996907,
-3.646955, 2, -6.284529,
-3.48397, 3, -5.996907,
-3.646955, 3, -6.284529
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
-3.972925, -3, -6.859773, 0, -0.5, 0.5, 0.5,
-3.972925, -3, -6.859773, 1, -0.5, 0.5, 0.5,
-3.972925, -3, -6.859773, 1, 1.5, 0.5, 0.5,
-3.972925, -3, -6.859773, 0, 1.5, 0.5, 0.5,
-3.972925, -2, -6.859773, 0, -0.5, 0.5, 0.5,
-3.972925, -2, -6.859773, 1, -0.5, 0.5, 0.5,
-3.972925, -2, -6.859773, 1, 1.5, 0.5, 0.5,
-3.972925, -2, -6.859773, 0, 1.5, 0.5, 0.5,
-3.972925, -1, -6.859773, 0, -0.5, 0.5, 0.5,
-3.972925, -1, -6.859773, 1, -0.5, 0.5, 0.5,
-3.972925, -1, -6.859773, 1, 1.5, 0.5, 0.5,
-3.972925, -1, -6.859773, 0, 1.5, 0.5, 0.5,
-3.972925, 0, -6.859773, 0, -0.5, 0.5, 0.5,
-3.972925, 0, -6.859773, 1, -0.5, 0.5, 0.5,
-3.972925, 0, -6.859773, 1, 1.5, 0.5, 0.5,
-3.972925, 0, -6.859773, 0, 1.5, 0.5, 0.5,
-3.972925, 1, -6.859773, 0, -0.5, 0.5, 0.5,
-3.972925, 1, -6.859773, 1, -0.5, 0.5, 0.5,
-3.972925, 1, -6.859773, 1, 1.5, 0.5, 0.5,
-3.972925, 1, -6.859773, 0, 1.5, 0.5, 0.5,
-3.972925, 2, -6.859773, 0, -0.5, 0.5, 0.5,
-3.972925, 2, -6.859773, 1, -0.5, 0.5, 0.5,
-3.972925, 2, -6.859773, 1, 1.5, 0.5, 0.5,
-3.972925, 2, -6.859773, 0, 1.5, 0.5, 0.5,
-3.972925, 3, -6.859773, 0, -0.5, 0.5, 0.5,
-3.972925, 3, -6.859773, 1, -0.5, 0.5, 0.5,
-3.972925, 3, -6.859773, 1, 1.5, 0.5, 0.5,
-3.972925, 3, -6.859773, 0, 1.5, 0.5, 0.5
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
-3.48397, -3.264226, -4,
-3.48397, -3.264226, 4,
-3.48397, -3.264226, -4,
-3.646955, -3.429874, -4,
-3.48397, -3.264226, -2,
-3.646955, -3.429874, -2,
-3.48397, -3.264226, 0,
-3.646955, -3.429874, 0,
-3.48397, -3.264226, 2,
-3.646955, -3.429874, 2,
-3.48397, -3.264226, 4,
-3.646955, -3.429874, 4
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
-3.972925, -3.761169, -4, 0, -0.5, 0.5, 0.5,
-3.972925, -3.761169, -4, 1, -0.5, 0.5, 0.5,
-3.972925, -3.761169, -4, 1, 1.5, 0.5, 0.5,
-3.972925, -3.761169, -4, 0, 1.5, 0.5, 0.5,
-3.972925, -3.761169, -2, 0, -0.5, 0.5, 0.5,
-3.972925, -3.761169, -2, 1, -0.5, 0.5, 0.5,
-3.972925, -3.761169, -2, 1, 1.5, 0.5, 0.5,
-3.972925, -3.761169, -2, 0, 1.5, 0.5, 0.5,
-3.972925, -3.761169, 0, 0, -0.5, 0.5, 0.5,
-3.972925, -3.761169, 0, 1, -0.5, 0.5, 0.5,
-3.972925, -3.761169, 0, 1, 1.5, 0.5, 0.5,
-3.972925, -3.761169, 0, 0, 1.5, 0.5, 0.5,
-3.972925, -3.761169, 2, 0, -0.5, 0.5, 0.5,
-3.972925, -3.761169, 2, 1, -0.5, 0.5, 0.5,
-3.972925, -3.761169, 2, 1, 1.5, 0.5, 0.5,
-3.972925, -3.761169, 2, 0, 1.5, 0.5, 0.5,
-3.972925, -3.761169, 4, 0, -0.5, 0.5, 0.5,
-3.972925, -3.761169, 4, 1, -0.5, 0.5, 0.5,
-3.972925, -3.761169, 4, 1, 1.5, 0.5, 0.5,
-3.972925, -3.761169, 4, 0, 1.5, 0.5, 0.5
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
-3.48397, -3.264226, -5.996907,
-3.48397, 3.361686, -5.996907,
-3.48397, -3.264226, 5.507966,
-3.48397, 3.361686, 5.507966,
-3.48397, -3.264226, -5.996907,
-3.48397, -3.264226, 5.507966,
-3.48397, 3.361686, -5.996907,
-3.48397, 3.361686, 5.507966,
-3.48397, -3.264226, -5.996907,
3.035425, -3.264226, -5.996907,
-3.48397, -3.264226, 5.507966,
3.035425, -3.264226, 5.507966,
-3.48397, 3.361686, -5.996907,
3.035425, 3.361686, -5.996907,
-3.48397, 3.361686, 5.507966,
3.035425, 3.361686, 5.507966,
3.035425, -3.264226, -5.996907,
3.035425, 3.361686, -5.996907,
3.035425, -3.264226, 5.507966,
3.035425, 3.361686, 5.507966,
3.035425, -3.264226, -5.996907,
3.035425, -3.264226, 5.507966,
3.035425, 3.361686, -5.996907,
3.035425, 3.361686, 5.507966
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
var radius = 7.897992;
var distance = 35.13906;
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
mvMatrix.translate( 0.2242725, -0.04873013, 0.2444708 );
mvMatrix.scale( 1.309855, 1.288798, 0.7422476 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.13906);
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


