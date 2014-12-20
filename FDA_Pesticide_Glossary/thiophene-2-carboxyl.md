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
-3.191978, 2.020146, -1.433325, 1, 0, 0, 1,
-3.037131, -0.5716856, -0.254181, 1, 0.007843138, 0, 1,
-2.709126, -1.912177, -2.269649, 1, 0.01176471, 0, 1,
-2.665124, -1.141728, -1.724862, 1, 0.01960784, 0, 1,
-2.656058, 0.2088217, -2.372643, 1, 0.02352941, 0, 1,
-2.562618, -1.176105, -1.285925, 1, 0.03137255, 0, 1,
-2.542846, 0.09261428, -0.6897126, 1, 0.03529412, 0, 1,
-2.493079, 0.1932732, -2.797147, 1, 0.04313726, 0, 1,
-2.418219, 1.177426, -1.018506, 1, 0.04705882, 0, 1,
-2.416699, 1.2097, -1.827331, 1, 0.05490196, 0, 1,
-2.412215, -0.03376697, -1.154872, 1, 0.05882353, 0, 1,
-2.345302, 1.434482, 0.2616285, 1, 0.06666667, 0, 1,
-2.340721, -2.228335, -3.345942, 1, 0.07058824, 0, 1,
-2.330014, -0.5162871, -1.178949, 1, 0.07843138, 0, 1,
-2.295635, -0.7267465, -1.645714, 1, 0.08235294, 0, 1,
-2.287895, -0.2344627, -1.889483, 1, 0.09019608, 0, 1,
-2.268404, -0.7638395, -1.142501, 1, 0.09411765, 0, 1,
-2.267635, -1.283471, -1.218631, 1, 0.1019608, 0, 1,
-2.264529, 0.4129013, 0.1105318, 1, 0.1098039, 0, 1,
-2.203214, 0.3348324, -1.452063, 1, 0.1137255, 0, 1,
-2.168862, 0.200779, -0.03809766, 1, 0.1215686, 0, 1,
-2.099702, -1.66239, 0.2023124, 1, 0.1254902, 0, 1,
-2.099119, -0.3011873, -1.954915, 1, 0.1333333, 0, 1,
-2.082842, 1.246826, -0.1391313, 1, 0.1372549, 0, 1,
-2.069109, -1.254333, -2.426305, 1, 0.145098, 0, 1,
-2.057791, 1.813437, -2.362849, 1, 0.1490196, 0, 1,
-2.015675, 1.048081, -2.140594, 1, 0.1568628, 0, 1,
-2.002289, 1.031189, -0.7389763, 1, 0.1607843, 0, 1,
-1.999316, -0.6953349, -3.253477, 1, 0.1686275, 0, 1,
-1.934178, -0.3038253, -1.375855, 1, 0.172549, 0, 1,
-1.932419, -0.9734113, -0.6782929, 1, 0.1803922, 0, 1,
-1.890784, -1.274959, -2.081199, 1, 0.1843137, 0, 1,
-1.869792, 0.6600922, -2.214194, 1, 0.1921569, 0, 1,
-1.867045, 0.8143575, -0.6036677, 1, 0.1960784, 0, 1,
-1.83093, -0.4101279, -1.184759, 1, 0.2039216, 0, 1,
-1.796785, 1.077045, -0.7534593, 1, 0.2117647, 0, 1,
-1.780154, -0.4310012, -3.178021, 1, 0.2156863, 0, 1,
-1.767932, -0.07651536, -2.198241, 1, 0.2235294, 0, 1,
-1.74939, 0.6633392, -1.899757, 1, 0.227451, 0, 1,
-1.748023, 0.1828708, -1.735147, 1, 0.2352941, 0, 1,
-1.7426, -0.8217636, -1.378506, 1, 0.2392157, 0, 1,
-1.740688, -0.4956735, -1.598178, 1, 0.2470588, 0, 1,
-1.726151, -0.5253969, -2.597226, 1, 0.2509804, 0, 1,
-1.709816, -0.2680117, -2.149358, 1, 0.2588235, 0, 1,
-1.705276, 0.6994021, -1.070411, 1, 0.2627451, 0, 1,
-1.694437, 0.3288804, -1.369797, 1, 0.2705882, 0, 1,
-1.681316, 1.922118, -1.115944, 1, 0.2745098, 0, 1,
-1.662028, -0.6597911, -3.111099, 1, 0.282353, 0, 1,
-1.655429, -1.058047, -3.433105, 1, 0.2862745, 0, 1,
-1.643059, 0.9866394, -1.095352, 1, 0.2941177, 0, 1,
-1.634707, 0.5646552, -0.7307755, 1, 0.3019608, 0, 1,
-1.634498, 0.0181096, -3.016298, 1, 0.3058824, 0, 1,
-1.624933, -0.654418, -1.272232, 1, 0.3137255, 0, 1,
-1.610783, 0.1410429, -1.712527, 1, 0.3176471, 0, 1,
-1.600917, -1.571571, -1.470428, 1, 0.3254902, 0, 1,
-1.572577, -1.002272, -2.772224, 1, 0.3294118, 0, 1,
-1.571449, 1.780525, 0.1279269, 1, 0.3372549, 0, 1,
-1.568457, -0.5578747, -1.702767, 1, 0.3411765, 0, 1,
-1.566686, 1.035442, -0.7831014, 1, 0.3490196, 0, 1,
-1.557398, 0.3859879, -1.681885, 1, 0.3529412, 0, 1,
-1.550471, 0.4084202, -0.4293566, 1, 0.3607843, 0, 1,
-1.54837, 0.1485245, -4.2736, 1, 0.3647059, 0, 1,
-1.535524, 0.1036165, -1.055007, 1, 0.372549, 0, 1,
-1.510468, 1.516116, -0.7528945, 1, 0.3764706, 0, 1,
-1.498139, 0.6360725, -2.35874, 1, 0.3843137, 0, 1,
-1.495836, 0.1998153, -1.699825, 1, 0.3882353, 0, 1,
-1.478151, -0.1326407, -3.303994, 1, 0.3960784, 0, 1,
-1.469898, 0.919035, -1.798466, 1, 0.4039216, 0, 1,
-1.46904, 0.4516473, -1.290162, 1, 0.4078431, 0, 1,
-1.465581, -0.9242515, -4.420778, 1, 0.4156863, 0, 1,
-1.461953, -1.104884, -1.616694, 1, 0.4196078, 0, 1,
-1.461383, -0.4318629, -2.795997, 1, 0.427451, 0, 1,
-1.429874, 0.1112272, -1.264094, 1, 0.4313726, 0, 1,
-1.422144, -1.132373, -3.06073, 1, 0.4392157, 0, 1,
-1.409965, -0.5032065, -3.126331, 1, 0.4431373, 0, 1,
-1.397946, 2.894935, 0.1453714, 1, 0.4509804, 0, 1,
-1.390843, -0.3734407, -1.10179, 1, 0.454902, 0, 1,
-1.388193, -1.875633, -2.423685, 1, 0.4627451, 0, 1,
-1.384771, 1.567515, -0.8366098, 1, 0.4666667, 0, 1,
-1.384532, 0.2968799, -1.07107, 1, 0.4745098, 0, 1,
-1.368828, -0.444039, -1.437507, 1, 0.4784314, 0, 1,
-1.367104, 0.6629184, -2.489983, 1, 0.4862745, 0, 1,
-1.366416, -0.8905969, -2.549036, 1, 0.4901961, 0, 1,
-1.359318, -1.831505, -4.14311, 1, 0.4980392, 0, 1,
-1.355736, -0.7898431, -1.552284, 1, 0.5058824, 0, 1,
-1.354605, 2.421349, -0.8507503, 1, 0.509804, 0, 1,
-1.351902, -0.682353, -1.423152, 1, 0.5176471, 0, 1,
-1.338229, -0.3773926, -2.694482, 1, 0.5215687, 0, 1,
-1.336491, -0.7732068, -1.674129, 1, 0.5294118, 0, 1,
-1.332528, -1.850971, -4.246912, 1, 0.5333334, 0, 1,
-1.323553, -0.8662592, -1.954964, 1, 0.5411765, 0, 1,
-1.322057, 0.8530471, -0.09050124, 1, 0.5450981, 0, 1,
-1.316516, -0.6994311, -1.123054, 1, 0.5529412, 0, 1,
-1.308402, 0.2392912, -0.7027819, 1, 0.5568628, 0, 1,
-1.297558, 1.26925, 1.092115, 1, 0.5647059, 0, 1,
-1.294013, 0.8546653, -2.083807, 1, 0.5686275, 0, 1,
-1.287136, 2.438388, -0.8556607, 1, 0.5764706, 0, 1,
-1.285204, 0.2041079, 1.455562, 1, 0.5803922, 0, 1,
-1.284306, 1.293934, -0.3469242, 1, 0.5882353, 0, 1,
-1.274855, 1.976154, 0.3746703, 1, 0.5921569, 0, 1,
-1.26524, 0.3211991, -3.677455, 1, 0.6, 0, 1,
-1.25761, -0.5287285, -2.989835, 1, 0.6078432, 0, 1,
-1.252645, -1.464779, -1.761332, 1, 0.6117647, 0, 1,
-1.243812, 0.4479618, -1.480952, 1, 0.6196079, 0, 1,
-1.227317, -1.434622, -1.819444, 1, 0.6235294, 0, 1,
-1.221547, -0.584546, -2.57217, 1, 0.6313726, 0, 1,
-1.214849, 0.6725711, -0.9501162, 1, 0.6352941, 0, 1,
-1.211863, -0.167913, -0.6407815, 1, 0.6431373, 0, 1,
-1.2098, -0.08481818, -0.41432, 1, 0.6470588, 0, 1,
-1.199889, -0.3357017, -0.615531, 1, 0.654902, 0, 1,
-1.199712, 0.7675534, 0.3175112, 1, 0.6588235, 0, 1,
-1.196456, -1.558635, -3.195227, 1, 0.6666667, 0, 1,
-1.196394, 1.215631, -0.0897705, 1, 0.6705883, 0, 1,
-1.194706, -0.2143479, -1.420689, 1, 0.6784314, 0, 1,
-1.185212, 1.610387, -0.6030364, 1, 0.682353, 0, 1,
-1.180276, -1.139307, -0.5929976, 1, 0.6901961, 0, 1,
-1.179872, 0.05727773, -2.301534, 1, 0.6941177, 0, 1,
-1.17862, 2.194435, 0.3749469, 1, 0.7019608, 0, 1,
-1.176976, -0.6676686, -0.6114569, 1, 0.7098039, 0, 1,
-1.175727, 0.4585171, -2.546552, 1, 0.7137255, 0, 1,
-1.17419, -1.141134, -3.219203, 1, 0.7215686, 0, 1,
-1.173578, 0.5906966, -2.408159, 1, 0.7254902, 0, 1,
-1.165461, 1.796737, -1.564361, 1, 0.7333333, 0, 1,
-1.16258, 0.9239219, 0.2708512, 1, 0.7372549, 0, 1,
-1.160548, 1.082942, -1.521988, 1, 0.7450981, 0, 1,
-1.157603, 0.4435065, -1.272284, 1, 0.7490196, 0, 1,
-1.151237, 0.2617685, -0.4150566, 1, 0.7568628, 0, 1,
-1.150176, -0.8351201, -1.899845, 1, 0.7607843, 0, 1,
-1.14435, -0.6509749, -1.674393, 1, 0.7686275, 0, 1,
-1.134192, 0.7505625, -0.7272658, 1, 0.772549, 0, 1,
-1.127265, 0.2092865, -1.298085, 1, 0.7803922, 0, 1,
-1.124256, 0.8930785, -1.3015, 1, 0.7843137, 0, 1,
-1.121668, 1.891592, -0.6599276, 1, 0.7921569, 0, 1,
-1.118909, 0.2064218, -2.588942, 1, 0.7960784, 0, 1,
-1.114251, -0.9889662, -2.793169, 1, 0.8039216, 0, 1,
-1.11419, -0.8352225, -1.14187, 1, 0.8117647, 0, 1,
-1.112104, 1.126526, -0.8424373, 1, 0.8156863, 0, 1,
-1.107032, 1.639885, -0.4704297, 1, 0.8235294, 0, 1,
-1.106037, 1.481258, -1.947957, 1, 0.827451, 0, 1,
-1.103643, -0.3163994, -1.562648, 1, 0.8352941, 0, 1,
-1.100857, 1.108953, 0.2264165, 1, 0.8392157, 0, 1,
-1.099352, -0.4319858, -1.872594, 1, 0.8470588, 0, 1,
-1.097954, -1.814281, -3.716635, 1, 0.8509804, 0, 1,
-1.094497, 0.6548303, -3.186438, 1, 0.8588235, 0, 1,
-1.090351, 1.052835, -1.426838, 1, 0.8627451, 0, 1,
-1.088426, -0.5124287, -1.691302, 1, 0.8705882, 0, 1,
-1.086928, 0.680516, -1.160231, 1, 0.8745098, 0, 1,
-1.085841, -1.109103, -0.8866911, 1, 0.8823529, 0, 1,
-1.084166, -1.32772, -2.149925, 1, 0.8862745, 0, 1,
-1.080962, -0.2956313, -3.166919, 1, 0.8941177, 0, 1,
-1.071425, 0.7758483, -2.771107, 1, 0.8980392, 0, 1,
-1.067674, 0.6307466, -0.2137912, 1, 0.9058824, 0, 1,
-1.063926, 0.1186374, 0.1607195, 1, 0.9137255, 0, 1,
-1.063534, 2.293283, 0.8708616, 1, 0.9176471, 0, 1,
-1.054155, 0.8868672, -2.047794, 1, 0.9254902, 0, 1,
-1.038952, 1.329318, -0.9298117, 1, 0.9294118, 0, 1,
-1.037647, 0.532208, 0.1202587, 1, 0.9372549, 0, 1,
-1.035538, -0.2558194, -2.412359, 1, 0.9411765, 0, 1,
-1.028521, -1.330065, -3.020591, 1, 0.9490196, 0, 1,
-1.028359, -0.2182346, -0.5617635, 1, 0.9529412, 0, 1,
-1.021417, -0.1763907, -1.46879, 1, 0.9607843, 0, 1,
-1.018733, -0.785962, -3.40876, 1, 0.9647059, 0, 1,
-1.007209, 0.6074675, -0.7076693, 1, 0.972549, 0, 1,
-1.001518, -0.7470872, -0.5914478, 1, 0.9764706, 0, 1,
-1.000421, -1.555787, -4.249116, 1, 0.9843137, 0, 1,
-0.999264, -0.8924421, -2.749769, 1, 0.9882353, 0, 1,
-0.9989085, 0.6255701, -2.032642, 1, 0.9960784, 0, 1,
-0.9971215, 0.2020826, -0.5423747, 0.9960784, 1, 0, 1,
-0.9954948, 0.3500005, -1.249157, 0.9921569, 1, 0, 1,
-0.9886045, 0.05000146, -0.7259038, 0.9843137, 1, 0, 1,
-0.9881847, -0.7431573, -2.994459, 0.9803922, 1, 0, 1,
-0.9849054, -1.282738, -0.8900928, 0.972549, 1, 0, 1,
-0.9845149, -0.7433261, -2.742377, 0.9686275, 1, 0, 1,
-0.9785767, -0.7460479, -2.630577, 0.9607843, 1, 0, 1,
-0.9752981, 1.031136, -2.916689, 0.9568627, 1, 0, 1,
-0.9700428, 0.8337383, -2.617895, 0.9490196, 1, 0, 1,
-0.9664087, -0.2717505, -3.074606, 0.945098, 1, 0, 1,
-0.9645442, 0.8199804, 0.03747752, 0.9372549, 1, 0, 1,
-0.9588351, 0.3132409, -1.206422, 0.9333333, 1, 0, 1,
-0.9586458, 0.7939774, 2.121958, 0.9254902, 1, 0, 1,
-0.953294, 0.5699717, -1.4945, 0.9215686, 1, 0, 1,
-0.9532083, -1.082565, -2.095082, 0.9137255, 1, 0, 1,
-0.9518238, -1.756258, -1.083152, 0.9098039, 1, 0, 1,
-0.9501187, 2.201377, 1.669254, 0.9019608, 1, 0, 1,
-0.9414276, -0.06324847, -1.516779, 0.8941177, 1, 0, 1,
-0.9412917, -1.029515, -2.048838, 0.8901961, 1, 0, 1,
-0.9405298, 0.3877408, -1.290202, 0.8823529, 1, 0, 1,
-0.927205, 0.6659569, -1.991969, 0.8784314, 1, 0, 1,
-0.922212, 0.5460147, -3.447536, 0.8705882, 1, 0, 1,
-0.9188145, -0.7076278, -2.922301, 0.8666667, 1, 0, 1,
-0.9000326, -0.3576892, -1.938434, 0.8588235, 1, 0, 1,
-0.8877332, 0.9619995, -1.735367, 0.854902, 1, 0, 1,
-0.8813989, -0.3264351, -2.415878, 0.8470588, 1, 0, 1,
-0.8801127, 0.6249434, -1.775608, 0.8431373, 1, 0, 1,
-0.8758067, -0.1287698, -0.8498054, 0.8352941, 1, 0, 1,
-0.8640275, 0.8335577, -0.3686418, 0.8313726, 1, 0, 1,
-0.8603708, 0.1446198, -1.640775, 0.8235294, 1, 0, 1,
-0.8557951, 0.5212113, -1.681484, 0.8196079, 1, 0, 1,
-0.8538346, 0.5411516, -0.6537985, 0.8117647, 1, 0, 1,
-0.8513622, 1.714319, 1.031579, 0.8078431, 1, 0, 1,
-0.8498018, -0.5461697, -1.152026, 0.8, 1, 0, 1,
-0.8496831, -1.217333, -2.586241, 0.7921569, 1, 0, 1,
-0.8474978, -0.08358619, -1.587616, 0.7882353, 1, 0, 1,
-0.8459234, 0.6049539, -0.180131, 0.7803922, 1, 0, 1,
-0.8428748, 0.1749094, -0.06222929, 0.7764706, 1, 0, 1,
-0.8313363, 0.03309191, -2.672404, 0.7686275, 1, 0, 1,
-0.830174, 0.892222, -0.2277328, 0.7647059, 1, 0, 1,
-0.8300968, 1.960965, -0.4207687, 0.7568628, 1, 0, 1,
-0.8298811, -0.780651, -4.127619, 0.7529412, 1, 0, 1,
-0.8286879, -0.4844173, -1.305238, 0.7450981, 1, 0, 1,
-0.8245804, 0.2258422, -0.294741, 0.7411765, 1, 0, 1,
-0.8216489, -1.110566, -2.130486, 0.7333333, 1, 0, 1,
-0.8208592, 0.153078, -1.351308, 0.7294118, 1, 0, 1,
-0.8201565, -2.023625, -4.195866, 0.7215686, 1, 0, 1,
-0.8064869, 0.2490752, 1.136096, 0.7176471, 1, 0, 1,
-0.800764, -0.4882534, -2.407654, 0.7098039, 1, 0, 1,
-0.7991001, 2.236605, -0.4486852, 0.7058824, 1, 0, 1,
-0.7986307, -0.02683146, -0.0457568, 0.6980392, 1, 0, 1,
-0.7985334, 0.02525192, -0.9693519, 0.6901961, 1, 0, 1,
-0.7924278, 0.9104913, -0.4720839, 0.6862745, 1, 0, 1,
-0.7903211, -0.8928978, -3.259879, 0.6784314, 1, 0, 1,
-0.787803, 0.8240525, -1.999763, 0.6745098, 1, 0, 1,
-0.7864468, -2.164977, -0.8154739, 0.6666667, 1, 0, 1,
-0.785814, 0.877628, -0.6035668, 0.6627451, 1, 0, 1,
-0.7798557, -0.7557099, -1.108027, 0.654902, 1, 0, 1,
-0.7760255, -0.4390937, -3.829875, 0.6509804, 1, 0, 1,
-0.7751488, 0.8520975, -1.114214, 0.6431373, 1, 0, 1,
-0.7749413, 0.1563301, -1.881763, 0.6392157, 1, 0, 1,
-0.7731106, 1.509139, -1.232113, 0.6313726, 1, 0, 1,
-0.7688907, -0.1950299, -3.749993, 0.627451, 1, 0, 1,
-0.7656383, -0.6698649, -2.226205, 0.6196079, 1, 0, 1,
-0.763587, -0.488497, -3.639696, 0.6156863, 1, 0, 1,
-0.7625868, 0.08743169, -1.582394, 0.6078432, 1, 0, 1,
-0.749981, -0.7653486, -1.70025, 0.6039216, 1, 0, 1,
-0.7455789, 0.6444213, -0.9240137, 0.5960785, 1, 0, 1,
-0.7401897, 1.393399, -0.4301873, 0.5882353, 1, 0, 1,
-0.7392177, -1.500328, -2.775998, 0.5843138, 1, 0, 1,
-0.7384166, -0.6699269, -2.592723, 0.5764706, 1, 0, 1,
-0.7294331, -0.3200079, 0.04996995, 0.572549, 1, 0, 1,
-0.7288551, -1.177542, -1.933458, 0.5647059, 1, 0, 1,
-0.7204887, -0.1997953, -1.497075, 0.5607843, 1, 0, 1,
-0.7168798, -1.060431, -1.949028, 0.5529412, 1, 0, 1,
-0.7160664, -0.8702996, -2.235204, 0.5490196, 1, 0, 1,
-0.7126468, -0.415316, -1.719561, 0.5411765, 1, 0, 1,
-0.7075306, -1.005059, -4.109268, 0.5372549, 1, 0, 1,
-0.6877714, 1.103383, -1.051432, 0.5294118, 1, 0, 1,
-0.686603, 0.6834329, -1.476512, 0.5254902, 1, 0, 1,
-0.6852748, -0.7960398, -1.991242, 0.5176471, 1, 0, 1,
-0.6817576, 0.04274916, -0.5730181, 0.5137255, 1, 0, 1,
-0.6814643, 0.5942583, -1.208201, 0.5058824, 1, 0, 1,
-0.6782092, -0.130431, -0.7433648, 0.5019608, 1, 0, 1,
-0.6750045, -0.4100512, -2.65768, 0.4941176, 1, 0, 1,
-0.6710741, 0.4582344, -1.093558, 0.4862745, 1, 0, 1,
-0.6660884, 0.0577802, -2.55813, 0.4823529, 1, 0, 1,
-0.6582651, -0.9648678, -2.177118, 0.4745098, 1, 0, 1,
-0.6559271, -0.4119737, -0.1239227, 0.4705882, 1, 0, 1,
-0.6556603, 1.108647, 0.03104472, 0.4627451, 1, 0, 1,
-0.6530337, 0.08340199, -0.6402842, 0.4588235, 1, 0, 1,
-0.6522352, -0.1923766, -1.587423, 0.4509804, 1, 0, 1,
-0.6520978, 1.128985, -0.4305049, 0.4470588, 1, 0, 1,
-0.6484199, 0.1805466, -0.5253668, 0.4392157, 1, 0, 1,
-0.6469427, -0.1595324, -3.296526, 0.4352941, 1, 0, 1,
-0.64576, -1.590041, -1.636328, 0.427451, 1, 0, 1,
-0.6456655, -0.5099971, -2.358445, 0.4235294, 1, 0, 1,
-0.6348397, 0.1662843, -0.8048503, 0.4156863, 1, 0, 1,
-0.6324526, 1.19856, 0.0406318, 0.4117647, 1, 0, 1,
-0.6312573, -1.503331, -3.104149, 0.4039216, 1, 0, 1,
-0.6302265, -2.188779, -2.68091, 0.3960784, 1, 0, 1,
-0.6257358, -1.174075, -2.170084, 0.3921569, 1, 0, 1,
-0.6219272, 2.270995, -1.51126, 0.3843137, 1, 0, 1,
-0.6191691, 2.134241, -1.032917, 0.3803922, 1, 0, 1,
-0.6187589, 0.8836721, -0.08512202, 0.372549, 1, 0, 1,
-0.6175, 1.013573, -1.011185, 0.3686275, 1, 0, 1,
-0.6115954, -0.6421295, -1.439571, 0.3607843, 1, 0, 1,
-0.6095455, 1.247929, 0.6364556, 0.3568628, 1, 0, 1,
-0.6056075, -0.889984, -2.121187, 0.3490196, 1, 0, 1,
-0.6042943, -0.7361061, -3.459548, 0.345098, 1, 0, 1,
-0.5988656, -0.8190152, -1.791537, 0.3372549, 1, 0, 1,
-0.5972753, 0.5896336, -3.864604, 0.3333333, 1, 0, 1,
-0.5918247, 0.3512504, -1.472551, 0.3254902, 1, 0, 1,
-0.59152, 0.7723722, -2.215925, 0.3215686, 1, 0, 1,
-0.5903247, -0.7607319, -1.526049, 0.3137255, 1, 0, 1,
-0.5880291, 0.5986199, 1.093209, 0.3098039, 1, 0, 1,
-0.5764596, -0.2176594, -2.664782, 0.3019608, 1, 0, 1,
-0.5706586, -1.251704, -2.24884, 0.2941177, 1, 0, 1,
-0.5674548, -0.8720827, -2.286381, 0.2901961, 1, 0, 1,
-0.5632992, 0.4244184, -1.754506, 0.282353, 1, 0, 1,
-0.5620927, -1.0066, -1.580362, 0.2784314, 1, 0, 1,
-0.5593874, 0.2632612, -1.027415, 0.2705882, 1, 0, 1,
-0.5547395, 1.315607, -0.39467, 0.2666667, 1, 0, 1,
-0.5529066, 0.004784781, -1.169628, 0.2588235, 1, 0, 1,
-0.5521417, 1.269023, -1.590502, 0.254902, 1, 0, 1,
-0.5461072, 0.5194603, -0.02653462, 0.2470588, 1, 0, 1,
-0.5449234, -0.3879308, -3.458108, 0.2431373, 1, 0, 1,
-0.5419143, -0.2356236, -1.645163, 0.2352941, 1, 0, 1,
-0.5399216, -0.2016723, -0.7011263, 0.2313726, 1, 0, 1,
-0.5275162, -0.00962662, -1.447681, 0.2235294, 1, 0, 1,
-0.525596, 0.1439821, -0.970376, 0.2196078, 1, 0, 1,
-0.5242729, -0.03834379, -1.471337, 0.2117647, 1, 0, 1,
-0.5238549, -0.9976757, -2.496944, 0.2078431, 1, 0, 1,
-0.5235397, -0.321108, -1.643595, 0.2, 1, 0, 1,
-0.5228071, -0.6241432, -3.87668, 0.1921569, 1, 0, 1,
-0.5206804, 0.08553821, -1.524537, 0.1882353, 1, 0, 1,
-0.5176482, 0.4528804, 0.6742501, 0.1803922, 1, 0, 1,
-0.5165533, -0.7879775, -3.511563, 0.1764706, 1, 0, 1,
-0.5157648, -1.766687, -3.983708, 0.1686275, 1, 0, 1,
-0.5130912, 1.476748, -1.422585, 0.1647059, 1, 0, 1,
-0.5121208, -1.889081, -5.117147, 0.1568628, 1, 0, 1,
-0.5120164, -1.195711, -3.554677, 0.1529412, 1, 0, 1,
-0.5060343, 0.7395743, -0.1207125, 0.145098, 1, 0, 1,
-0.5052965, -0.1592312, -1.307067, 0.1411765, 1, 0, 1,
-0.5049891, -0.465976, -1.701873, 0.1333333, 1, 0, 1,
-0.499607, 1.169212, -0.5240496, 0.1294118, 1, 0, 1,
-0.4939481, 0.7948515, -1.132524, 0.1215686, 1, 0, 1,
-0.4916612, -0.728703, -3.685211, 0.1176471, 1, 0, 1,
-0.4886923, -1.916087, -3.750639, 0.1098039, 1, 0, 1,
-0.4828522, -0.5910407, -3.044439, 0.1058824, 1, 0, 1,
-0.4810674, 0.6466863, -0.09011912, 0.09803922, 1, 0, 1,
-0.4741814, -1.294616, -1.924749, 0.09019608, 1, 0, 1,
-0.4725416, -0.8131628, -2.569974, 0.08627451, 1, 0, 1,
-0.4717867, 0.6808873, -2.871413, 0.07843138, 1, 0, 1,
-0.4717062, 1.188806, -0.9993222, 0.07450981, 1, 0, 1,
-0.4698316, 0.7255046, -1.089272, 0.06666667, 1, 0, 1,
-0.4647465, 0.4269426, -1.751412, 0.0627451, 1, 0, 1,
-0.463575, -0.45116, -1.268219, 0.05490196, 1, 0, 1,
-0.4607612, 2.308769, -1.802223, 0.05098039, 1, 0, 1,
-0.4578318, 1.311592, 1.008048, 0.04313726, 1, 0, 1,
-0.4553253, -1.263615, -4.275015, 0.03921569, 1, 0, 1,
-0.4527463, 0.7590002, -1.725747, 0.03137255, 1, 0, 1,
-0.4490706, -1.173612, -2.526783, 0.02745098, 1, 0, 1,
-0.447911, 0.1853043, -0.6778787, 0.01960784, 1, 0, 1,
-0.4464572, 0.6054215, 0.9336743, 0.01568628, 1, 0, 1,
-0.4452553, 2.169842, 1.017423, 0.007843138, 1, 0, 1,
-0.4394223, 0.2734032, -0.9631296, 0.003921569, 1, 0, 1,
-0.4381899, -1.124399, -2.248994, 0, 1, 0.003921569, 1,
-0.4361234, 0.9633532, -1.680133, 0, 1, 0.01176471, 1,
-0.4267479, 1.779094, -0.5685498, 0, 1, 0.01568628, 1,
-0.4248241, -0.09976739, -1.749575, 0, 1, 0.02352941, 1,
-0.4219129, -0.711175, -1.363348, 0, 1, 0.02745098, 1,
-0.4214765, 0.343011, 0.5550233, 0, 1, 0.03529412, 1,
-0.4206524, -0.7425219, -2.61314, 0, 1, 0.03921569, 1,
-0.4168302, -1.25975, -5.386775, 0, 1, 0.04705882, 1,
-0.4113959, 1.256624, 0.3489598, 0, 1, 0.05098039, 1,
-0.4092577, -0.1070698, -1.991862, 0, 1, 0.05882353, 1,
-0.4049737, 0.5889067, -2.118482, 0, 1, 0.0627451, 1,
-0.3973219, -1.505305, -2.859653, 0, 1, 0.07058824, 1,
-0.3963925, 0.4660766, -0.4763435, 0, 1, 0.07450981, 1,
-0.3961858, -0.8567149, -2.197798, 0, 1, 0.08235294, 1,
-0.3939675, -1.214344, -2.927992, 0, 1, 0.08627451, 1,
-0.3931729, -0.259569, -2.088086, 0, 1, 0.09411765, 1,
-0.3924897, 1.445939, 0.1306767, 0, 1, 0.1019608, 1,
-0.3901545, -0.6921154, -4.024999, 0, 1, 0.1058824, 1,
-0.3890825, -0.7379019, -1.913312, 0, 1, 0.1137255, 1,
-0.3890556, -1.328071, -3.098262, 0, 1, 0.1176471, 1,
-0.3835823, -0.4679676, -0.8119233, 0, 1, 0.1254902, 1,
-0.3823839, -0.2873797, -1.334662, 0, 1, 0.1294118, 1,
-0.3809164, -0.4775776, -2.027977, 0, 1, 0.1372549, 1,
-0.3767868, -0.8563029, -1.976627, 0, 1, 0.1411765, 1,
-0.3732198, -0.0977355, -2.869895, 0, 1, 0.1490196, 1,
-0.3726906, 0.9191414, 1.510292, 0, 1, 0.1529412, 1,
-0.3695508, 0.3795128, 0.1587465, 0, 1, 0.1607843, 1,
-0.3660667, 0.6783745, -1.596273, 0, 1, 0.1647059, 1,
-0.3660605, -0.5997456, -2.747578, 0, 1, 0.172549, 1,
-0.3607773, 0.1422958, -0.4878636, 0, 1, 0.1764706, 1,
-0.3585799, -1.336787, -2.995351, 0, 1, 0.1843137, 1,
-0.3519506, 0.2049193, -1.230754, 0, 1, 0.1882353, 1,
-0.3509748, -0.4703483, -2.414575, 0, 1, 0.1960784, 1,
-0.3476817, 0.4147052, -1.68785, 0, 1, 0.2039216, 1,
-0.3475088, 0.5665078, -0.6868723, 0, 1, 0.2078431, 1,
-0.3450635, -0.8065528, -1.746625, 0, 1, 0.2156863, 1,
-0.343414, 0.3014876, 0.6855581, 0, 1, 0.2196078, 1,
-0.3431436, 0.4381256, 2.020288, 0, 1, 0.227451, 1,
-0.3404886, 0.4377491, -1.961692, 0, 1, 0.2313726, 1,
-0.339793, 0.7557194, -1.791985, 0, 1, 0.2392157, 1,
-0.3395936, -0.4119015, -2.862077, 0, 1, 0.2431373, 1,
-0.338202, -0.3095747, -2.404923, 0, 1, 0.2509804, 1,
-0.3351859, 0.5734043, -0.1928336, 0, 1, 0.254902, 1,
-0.331119, 0.1429153, -1.585258, 0, 1, 0.2627451, 1,
-0.3270296, -0.7236047, -3.308589, 0, 1, 0.2666667, 1,
-0.3257231, 0.3046381, -0.7770075, 0, 1, 0.2745098, 1,
-0.3228032, -0.4320956, -2.749062, 0, 1, 0.2784314, 1,
-0.3156939, 0.9914394, 0.328828, 0, 1, 0.2862745, 1,
-0.2973608, -1.479472, -2.800285, 0, 1, 0.2901961, 1,
-0.2956016, 0.9475164, 1.646506, 0, 1, 0.2980392, 1,
-0.29515, -0.2321604, -2.452063, 0, 1, 0.3058824, 1,
-0.288839, 0.1456899, -0.5018486, 0, 1, 0.3098039, 1,
-0.2883222, 0.9919378, 0.1399157, 0, 1, 0.3176471, 1,
-0.2863718, -0.8468953, -4.828041, 0, 1, 0.3215686, 1,
-0.280255, 1.290171, -0.4339094, 0, 1, 0.3294118, 1,
-0.2802, 1.15927, -1.148226, 0, 1, 0.3333333, 1,
-0.2788285, -0.6820787, -3.86529, 0, 1, 0.3411765, 1,
-0.2786123, -0.4368395, -1.303742, 0, 1, 0.345098, 1,
-0.2758309, 0.873905, -0.04103539, 0, 1, 0.3529412, 1,
-0.2740749, -0.452762, -3.047345, 0, 1, 0.3568628, 1,
-0.2726945, 0.4977911, 0.6703875, 0, 1, 0.3647059, 1,
-0.2726573, -0.9180843, -3.326548, 0, 1, 0.3686275, 1,
-0.269464, -0.3396423, -2.785581, 0, 1, 0.3764706, 1,
-0.2624094, -0.97065, -3.837835, 0, 1, 0.3803922, 1,
-0.2591007, 0.8578421, -0.476743, 0, 1, 0.3882353, 1,
-0.2561064, 0.7591828, 0.4605231, 0, 1, 0.3921569, 1,
-0.2537623, 0.6500154, 0.3456649, 0, 1, 0.4, 1,
-0.2524344, -0.8663183, -2.725221, 0, 1, 0.4078431, 1,
-0.2509557, -0.6398994, -4.55378, 0, 1, 0.4117647, 1,
-0.2452508, 0.01785537, -0.4012131, 0, 1, 0.4196078, 1,
-0.2430062, -1.023449, -3.320467, 0, 1, 0.4235294, 1,
-0.2426993, 0.2497745, -1.880777, 0, 1, 0.4313726, 1,
-0.2390179, -0.8295307, -2.184194, 0, 1, 0.4352941, 1,
-0.2383702, 0.8454512, -1.172202, 0, 1, 0.4431373, 1,
-0.2368577, 0.03230357, -1.216458, 0, 1, 0.4470588, 1,
-0.2359792, 1.619069, 0.6785251, 0, 1, 0.454902, 1,
-0.2275773, -0.9017976, -4.070245, 0, 1, 0.4588235, 1,
-0.2224494, 1.174263, 1.128004, 0, 1, 0.4666667, 1,
-0.2208652, -0.02925845, -2.636449, 0, 1, 0.4705882, 1,
-0.2175657, 0.4147599, 1.055849, 0, 1, 0.4784314, 1,
-0.2155357, -0.07170928, -3.793025, 0, 1, 0.4823529, 1,
-0.2144824, -1.159977, -0.6640363, 0, 1, 0.4901961, 1,
-0.2141691, -0.271165, -1.68351, 0, 1, 0.4941176, 1,
-0.2124757, 1.451035, -0.7169188, 0, 1, 0.5019608, 1,
-0.2118702, 0.4965585, 0.6327072, 0, 1, 0.509804, 1,
-0.2081693, -0.09710956, -1.983087, 0, 1, 0.5137255, 1,
-0.2081018, 0.2767255, 1.35722, 0, 1, 0.5215687, 1,
-0.2063442, -0.3438573, -2.266899, 0, 1, 0.5254902, 1,
-0.2043313, -0.2063889, -0.09478289, 0, 1, 0.5333334, 1,
-0.1998916, 0.9316393, 0.3582546, 0, 1, 0.5372549, 1,
-0.1988083, -0.08347134, -1.104971, 0, 1, 0.5450981, 1,
-0.1983388, -0.8732351, -3.654158, 0, 1, 0.5490196, 1,
-0.1970236, 0.3439112, -2.60451, 0, 1, 0.5568628, 1,
-0.1961317, 1.727537, 0.2844647, 0, 1, 0.5607843, 1,
-0.1940839, 0.5646409, -0.5432819, 0, 1, 0.5686275, 1,
-0.1912608, 2.884884, 0.6146963, 0, 1, 0.572549, 1,
-0.1906347, 1.276434, 0.6030799, 0, 1, 0.5803922, 1,
-0.1871284, 0.6352397, 0.3909539, 0, 1, 0.5843138, 1,
-0.1870548, -1.390535, -2.868199, 0, 1, 0.5921569, 1,
-0.1870112, 1.076475, -0.3673984, 0, 1, 0.5960785, 1,
-0.1861012, -1.74382, -1.13117, 0, 1, 0.6039216, 1,
-0.1836648, 1.23262, 0.4977525, 0, 1, 0.6117647, 1,
-0.1829585, 1.362839, 0.2138447, 0, 1, 0.6156863, 1,
-0.1820717, 0.1470437, -0.4843871, 0, 1, 0.6235294, 1,
-0.1767885, -1.155862, -1.99743, 0, 1, 0.627451, 1,
-0.1734695, -0.1762626, -1.109449, 0, 1, 0.6352941, 1,
-0.1715091, -1.10205, 0.08805627, 0, 1, 0.6392157, 1,
-0.1712471, -0.5234489, -2.345684, 0, 1, 0.6470588, 1,
-0.1691066, 0.1400084, 0.07941327, 0, 1, 0.6509804, 1,
-0.1689198, -1.93994, -2.695221, 0, 1, 0.6588235, 1,
-0.1654884, -0.1808252, -2.378577, 0, 1, 0.6627451, 1,
-0.1582349, 1.22752, -0.5996672, 0, 1, 0.6705883, 1,
-0.1565498, -0.2924257, -3.06266, 0, 1, 0.6745098, 1,
-0.1558749, 1.070282, -1.291046, 0, 1, 0.682353, 1,
-0.1543518, -0.9979171, -2.66436, 0, 1, 0.6862745, 1,
-0.1531003, -1.313214, -2.813158, 0, 1, 0.6941177, 1,
-0.1466144, 0.391663, 0.07373358, 0, 1, 0.7019608, 1,
-0.1464625, 0.1488112, -0.8145665, 0, 1, 0.7058824, 1,
-0.1363303, 1.553931, -1.419341, 0, 1, 0.7137255, 1,
-0.1353478, -2.137602, -3.820449, 0, 1, 0.7176471, 1,
-0.1347851, -0.9602731, -2.095773, 0, 1, 0.7254902, 1,
-0.1293652, 0.1838459, -0.836811, 0, 1, 0.7294118, 1,
-0.1277829, 0.07427043, -2.119355, 0, 1, 0.7372549, 1,
-0.1165372, -1.008244, -1.986089, 0, 1, 0.7411765, 1,
-0.1129713, 0.4784904, -0.5825745, 0, 1, 0.7490196, 1,
-0.1117624, 0.2678715, -0.1365913, 0, 1, 0.7529412, 1,
-0.103452, -1.107701, -1.698115, 0, 1, 0.7607843, 1,
-0.1026188, -0.03350489, -1.778227, 0, 1, 0.7647059, 1,
-0.1005828, -1.168837, -5.670239, 0, 1, 0.772549, 1,
-0.09944034, 3.441706, -0.2182079, 0, 1, 0.7764706, 1,
-0.09926578, 1.073807, -0.2757235, 0, 1, 0.7843137, 1,
-0.09809493, 0.3121985, -0.2790489, 0, 1, 0.7882353, 1,
-0.09322096, 0.6799698, 0.7244127, 0, 1, 0.7960784, 1,
-0.09184213, -0.4688339, -1.87988, 0, 1, 0.8039216, 1,
-0.08969798, -0.7546599, -4.711404, 0, 1, 0.8078431, 1,
-0.08949918, 1.810802, 1.444429, 0, 1, 0.8156863, 1,
-0.08608761, -0.3873989, -3.154181, 0, 1, 0.8196079, 1,
-0.08246459, 0.2924447, 1.71963, 0, 1, 0.827451, 1,
-0.07866269, -1.192834, -2.268745, 0, 1, 0.8313726, 1,
-0.07696605, 0.07287463, 0.1314119, 0, 1, 0.8392157, 1,
-0.07487321, -0.8172158, -2.408159, 0, 1, 0.8431373, 1,
-0.07423552, -0.8422567, -4.823094, 0, 1, 0.8509804, 1,
-0.07207319, 1.837057, -0.9397577, 0, 1, 0.854902, 1,
-0.06899982, 0.1592355, -2.073004, 0, 1, 0.8627451, 1,
-0.06888112, 0.2090663, -1.288817, 0, 1, 0.8666667, 1,
-0.06840295, -0.8563687, -3.503349, 0, 1, 0.8745098, 1,
-0.06222726, -2.52342, -1.832068, 0, 1, 0.8784314, 1,
-0.06200062, 0.2668964, -0.3240374, 0, 1, 0.8862745, 1,
-0.05979645, -0.4260186, -2.130142, 0, 1, 0.8901961, 1,
-0.05859183, 0.09759717, -1.664838, 0, 1, 0.8980392, 1,
-0.04562026, 0.3647633, 1.026856, 0, 1, 0.9058824, 1,
-0.04472914, -0.09683558, -1.86226, 0, 1, 0.9098039, 1,
-0.04110982, -0.3305719, -4.677077, 0, 1, 0.9176471, 1,
-0.04094034, -0.09640336, -2.328145, 0, 1, 0.9215686, 1,
-0.03907004, 0.1830719, -1.384249, 0, 1, 0.9294118, 1,
-0.03748291, -0.5864691, -2.611707, 0, 1, 0.9333333, 1,
-0.03702654, -0.01322947, -3.909992, 0, 1, 0.9411765, 1,
-0.03493607, -0.3950369, -2.3079, 0, 1, 0.945098, 1,
-0.03359481, -0.03328955, -2.888134, 0, 1, 0.9529412, 1,
-0.02720313, 0.2206931, 0.9176902, 0, 1, 0.9568627, 1,
-0.02670491, -1.276312, -2.875981, 0, 1, 0.9647059, 1,
-0.02555009, 0.2705644, 0.2131497, 0, 1, 0.9686275, 1,
-0.01978701, -0.2103244, -1.601372, 0, 1, 0.9764706, 1,
-0.01733073, -0.5025281, -3.81345, 0, 1, 0.9803922, 1,
-0.01133174, 0.3295988, -1.85965, 0, 1, 0.9882353, 1,
-0.003188, -0.896714, -3.713059, 0, 1, 0.9921569, 1,
-0.002965496, -0.4968653, -4.120363, 0, 1, 1, 1,
-0.001784676, -0.8213479, -3.455508, 0, 0.9921569, 1, 1,
0.002550627, 1.038478, 0.1199704, 0, 0.9882353, 1, 1,
0.004179454, -0.2149121, 2.867248, 0, 0.9803922, 1, 1,
0.008934876, 0.8696789, 0.09066107, 0, 0.9764706, 1, 1,
0.0108285, -0.9203732, 1.084475, 0, 0.9686275, 1, 1,
0.01195609, -0.4806349, 3.616349, 0, 0.9647059, 1, 1,
0.01316298, -1.330323, 4.472436, 0, 0.9568627, 1, 1,
0.01434958, -0.4214821, 2.078602, 0, 0.9529412, 1, 1,
0.01619098, -0.03383156, 2.210239, 0, 0.945098, 1, 1,
0.02057545, 0.1380043, -1.767062, 0, 0.9411765, 1, 1,
0.02089059, 1.699451, 0.9404892, 0, 0.9333333, 1, 1,
0.02880013, 0.678188, 1.781336, 0, 0.9294118, 1, 1,
0.03129632, 0.414141, 0.1226233, 0, 0.9215686, 1, 1,
0.03285059, 2.223115, 0.870458, 0, 0.9176471, 1, 1,
0.03503875, -0.3260508, 4.046035, 0, 0.9098039, 1, 1,
0.03905824, 0.3700895, 0.3992036, 0, 0.9058824, 1, 1,
0.04298877, 1.077066, 1.502861, 0, 0.8980392, 1, 1,
0.04878331, -0.6280512, 5.485543, 0, 0.8901961, 1, 1,
0.05307218, 2.017754, 1.040805, 0, 0.8862745, 1, 1,
0.05407143, 1.278822, -1.598155, 0, 0.8784314, 1, 1,
0.05794457, 0.8403368, 1.232294, 0, 0.8745098, 1, 1,
0.06146545, -0.4234367, 3.355536, 0, 0.8666667, 1, 1,
0.06367096, -0.1930671, 2.706821, 0, 0.8627451, 1, 1,
0.06464624, 0.2984879, -0.05444727, 0, 0.854902, 1, 1,
0.07391522, -1.320537, 4.287559, 0, 0.8509804, 1, 1,
0.07562646, -0.5043349, 1.147222, 0, 0.8431373, 1, 1,
0.07738157, 0.8593023, 1.106718, 0, 0.8392157, 1, 1,
0.08014613, -0.2160252, 2.563047, 0, 0.8313726, 1, 1,
0.08345174, -0.0595593, 2.904487, 0, 0.827451, 1, 1,
0.08545285, 0.2127723, 0.6532339, 0, 0.8196079, 1, 1,
0.08875817, 0.3170913, -1.39455, 0, 0.8156863, 1, 1,
0.08890802, -0.2445376, 3.252933, 0, 0.8078431, 1, 1,
0.09162457, 1.544706, -0.128133, 0, 0.8039216, 1, 1,
0.0929314, -1.312473, 3.208154, 0, 0.7960784, 1, 1,
0.09722453, 1.273086, 0.01441688, 0, 0.7882353, 1, 1,
0.106907, -0.5258373, 2.503962, 0, 0.7843137, 1, 1,
0.1089425, -0.6451017, 3.376564, 0, 0.7764706, 1, 1,
0.1126553, 1.517109, -1.540057, 0, 0.772549, 1, 1,
0.1127452, 0.07198749, -0.09866557, 0, 0.7647059, 1, 1,
0.113816, -0.7043169, 3.065334, 0, 0.7607843, 1, 1,
0.1141128, -3.006626, 2.608238, 0, 0.7529412, 1, 1,
0.1175354, 0.8406152, 1.905585, 0, 0.7490196, 1, 1,
0.1176894, -0.5258669, 2.834901, 0, 0.7411765, 1, 1,
0.1227301, 1.106251, -0.2031661, 0, 0.7372549, 1, 1,
0.1244663, 0.1145473, 1.210285, 0, 0.7294118, 1, 1,
0.1258474, -0.8261127, 3.297794, 0, 0.7254902, 1, 1,
0.1284705, 0.7910724, -0.6840969, 0, 0.7176471, 1, 1,
0.1294859, -1.085731, 3.192454, 0, 0.7137255, 1, 1,
0.1328938, 1.111294, 1.252104, 0, 0.7058824, 1, 1,
0.1372706, 0.03795008, 0.2498943, 0, 0.6980392, 1, 1,
0.1390301, 0.04853708, 2.292032, 0, 0.6941177, 1, 1,
0.1393006, -1.369068, 3.245683, 0, 0.6862745, 1, 1,
0.1424816, 0.7013459, -0.01405791, 0, 0.682353, 1, 1,
0.1462924, 0.8296476, 1.030994, 0, 0.6745098, 1, 1,
0.1470272, 0.1088426, -0.1884624, 0, 0.6705883, 1, 1,
0.1493235, 1.241122, 0.3281126, 0, 0.6627451, 1, 1,
0.1517781, -0.3032651, 3.077641, 0, 0.6588235, 1, 1,
0.153127, 0.6581509, -0.5674343, 0, 0.6509804, 1, 1,
0.1615383, -0.5791011, 3.022237, 0, 0.6470588, 1, 1,
0.1808091, 0.6955058, -0.7048223, 0, 0.6392157, 1, 1,
0.1845591, 0.684225, -0.5336248, 0, 0.6352941, 1, 1,
0.1853362, -0.09289579, 1.878092, 0, 0.627451, 1, 1,
0.1872248, 1.125105, -0.1484656, 0, 0.6235294, 1, 1,
0.1872401, -0.7002779, 3.60658, 0, 0.6156863, 1, 1,
0.1899502, 0.2121657, 1.453195, 0, 0.6117647, 1, 1,
0.1905121, -0.2835552, 2.867429, 0, 0.6039216, 1, 1,
0.1911943, 1.143766, -0.4119313, 0, 0.5960785, 1, 1,
0.197248, 0.7328762, 0.3322113, 0, 0.5921569, 1, 1,
0.2001705, -1.118224, 1.862879, 0, 0.5843138, 1, 1,
0.2013771, 0.2106716, 0.443204, 0, 0.5803922, 1, 1,
0.2119156, -0.5012719, 3.31044, 0, 0.572549, 1, 1,
0.2120177, -0.335148, 3.547464, 0, 0.5686275, 1, 1,
0.2149367, -0.9896405, 4.29341, 0, 0.5607843, 1, 1,
0.2191223, -1.152481, 2.591372, 0, 0.5568628, 1, 1,
0.2221137, 1.129189, 1.423717, 0, 0.5490196, 1, 1,
0.2279804, 0.2478439, 0.472853, 0, 0.5450981, 1, 1,
0.2326442, 1.018517, -0.8271485, 0, 0.5372549, 1, 1,
0.2334101, -0.1069491, 3.331664, 0, 0.5333334, 1, 1,
0.2382588, -1.49203, 2.563918, 0, 0.5254902, 1, 1,
0.2382623, -2.148772, 1.407346, 0, 0.5215687, 1, 1,
0.2383109, 0.3143501, -1.13033, 0, 0.5137255, 1, 1,
0.2439116, 2.211781, -0.9285498, 0, 0.509804, 1, 1,
0.2470421, -0.1008297, 1.327535, 0, 0.5019608, 1, 1,
0.2474289, -0.3244125, 2.155278, 0, 0.4941176, 1, 1,
0.2485361, 0.3461612, -1.446545, 0, 0.4901961, 1, 1,
0.2487246, 0.4156248, -1.420422, 0, 0.4823529, 1, 1,
0.2547853, 0.199864, 1.589314, 0, 0.4784314, 1, 1,
0.257016, -0.1442659, 1.458179, 0, 0.4705882, 1, 1,
0.2602881, 0.6976674, -0.5582941, 0, 0.4666667, 1, 1,
0.262416, -0.7532482, 0.2880693, 0, 0.4588235, 1, 1,
0.2631567, -0.3407117, 3.194131, 0, 0.454902, 1, 1,
0.2646633, 0.02728227, 1.815232, 0, 0.4470588, 1, 1,
0.267474, -0.3867032, 1.822801, 0, 0.4431373, 1, 1,
0.2688854, 1.047143, -0.9083993, 0, 0.4352941, 1, 1,
0.2695021, -0.357999, 1.812651, 0, 0.4313726, 1, 1,
0.2715625, 0.3124731, -0.07835086, 0, 0.4235294, 1, 1,
0.2719124, 1.633194, -0.1028626, 0, 0.4196078, 1, 1,
0.2729775, 0.7052518, 0.8313348, 0, 0.4117647, 1, 1,
0.2738365, 0.04152627, 0.3004265, 0, 0.4078431, 1, 1,
0.2748534, -0.2582977, 3.259316, 0, 0.4, 1, 1,
0.2762682, 1.34253, 1.112513, 0, 0.3921569, 1, 1,
0.2764927, 0.9436815, -2.098364, 0, 0.3882353, 1, 1,
0.2775607, -0.1033354, 1.773196, 0, 0.3803922, 1, 1,
0.2792753, 2.140251, -0.8242781, 0, 0.3764706, 1, 1,
0.2805056, -0.5518288, 2.288265, 0, 0.3686275, 1, 1,
0.2837548, -0.2004417, 0.9171586, 0, 0.3647059, 1, 1,
0.2848504, -1.071369, 3.575499, 0, 0.3568628, 1, 1,
0.2854427, -1.168106, 3.852853, 0, 0.3529412, 1, 1,
0.2925989, -0.9733186, 2.205209, 0, 0.345098, 1, 1,
0.296571, -0.6858858, 3.934232, 0, 0.3411765, 1, 1,
0.2971847, -0.3060815, 1.508014, 0, 0.3333333, 1, 1,
0.3018574, 0.310981, 2.172499, 0, 0.3294118, 1, 1,
0.3044633, -1.351575, 1.83015, 0, 0.3215686, 1, 1,
0.3051871, -1.660481, 2.193223, 0, 0.3176471, 1, 1,
0.3086819, 0.9959018, 0.1210017, 0, 0.3098039, 1, 1,
0.3116357, -1.693645, 1.308155, 0, 0.3058824, 1, 1,
0.3143168, -0.5516669, 1.309116, 0, 0.2980392, 1, 1,
0.3165578, -0.610461, 4.574076, 0, 0.2901961, 1, 1,
0.3177976, -0.4973109, 1.048922, 0, 0.2862745, 1, 1,
0.3186684, -0.2768932, 2.245791, 0, 0.2784314, 1, 1,
0.3211375, -0.4581308, 1.333583, 0, 0.2745098, 1, 1,
0.3241285, -1.403034, 2.748881, 0, 0.2666667, 1, 1,
0.3262158, 0.7159523, 0.3162098, 0, 0.2627451, 1, 1,
0.3314092, 0.816348, 1.829562, 0, 0.254902, 1, 1,
0.3320652, -2.573892, 4.492066, 0, 0.2509804, 1, 1,
0.3323931, 0.6749285, 0.9827523, 0, 0.2431373, 1, 1,
0.3355424, 0.655563, 2.165381, 0, 0.2392157, 1, 1,
0.3357072, 0.24107, 1.458503, 0, 0.2313726, 1, 1,
0.3377018, 1.542034, 0.1906962, 0, 0.227451, 1, 1,
0.3422297, -0.9102875, 3.088635, 0, 0.2196078, 1, 1,
0.3422313, 0.8842134, -0.3424291, 0, 0.2156863, 1, 1,
0.3444592, -0.6520255, 3.333192, 0, 0.2078431, 1, 1,
0.3450981, -0.9841068, 3.266718, 0, 0.2039216, 1, 1,
0.358152, 2.241628, -0.5841289, 0, 0.1960784, 1, 1,
0.3622449, 2.352929, -0.2641911, 0, 0.1882353, 1, 1,
0.365441, 1.434175, 0.9183537, 0, 0.1843137, 1, 1,
0.3665824, 0.5257762, 0.762656, 0, 0.1764706, 1, 1,
0.3701209, 0.06647728, 0.8964695, 0, 0.172549, 1, 1,
0.3701418, 0.8422273, 1.380706, 0, 0.1647059, 1, 1,
0.3744612, 0.1595512, 1.856616, 0, 0.1607843, 1, 1,
0.3931544, -0.1635534, 1.737253, 0, 0.1529412, 1, 1,
0.3931636, 0.7597491, 0.3068542, 0, 0.1490196, 1, 1,
0.3955165, -0.06900629, 1.838401, 0, 0.1411765, 1, 1,
0.3994724, -0.2434244, 1.344448, 0, 0.1372549, 1, 1,
0.4040079, 0.6494206, -1.198319, 0, 0.1294118, 1, 1,
0.4044922, -1.389949, 2.991166, 0, 0.1254902, 1, 1,
0.4047073, -0.4016762, 1.94868, 0, 0.1176471, 1, 1,
0.4068456, -0.9414064, 2.396829, 0, 0.1137255, 1, 1,
0.4096279, 0.3606756, 1.321941, 0, 0.1058824, 1, 1,
0.4107544, 0.5720727, -0.3629923, 0, 0.09803922, 1, 1,
0.4128989, 0.6285295, 1.55812, 0, 0.09411765, 1, 1,
0.414108, 0.2965678, -0.6545144, 0, 0.08627451, 1, 1,
0.4149861, -0.2694531, 3.55209, 0, 0.08235294, 1, 1,
0.4197897, -0.5718002, 3.68393, 0, 0.07450981, 1, 1,
0.4268441, -0.9242083, 3.782813, 0, 0.07058824, 1, 1,
0.4285725, 0.2699502, 1.027997, 0, 0.0627451, 1, 1,
0.4303007, 1.135541, -0.222467, 0, 0.05882353, 1, 1,
0.4364301, 0.0743153, 3.489719, 0, 0.05098039, 1, 1,
0.4428309, -0.1313069, 1.376256, 0, 0.04705882, 1, 1,
0.4503389, 0.9219698, 0.07330706, 0, 0.03921569, 1, 1,
0.4509999, 0.002607897, 1.064061, 0, 0.03529412, 1, 1,
0.4517586, -1.593091, 2.903606, 0, 0.02745098, 1, 1,
0.4553123, -0.1317192, 2.401328, 0, 0.02352941, 1, 1,
0.4562775, 0.8690593, -1.575364, 0, 0.01568628, 1, 1,
0.4597548, -0.08531903, -0.3787937, 0, 0.01176471, 1, 1,
0.4615995, 0.1693671, 0.7609864, 0, 0.003921569, 1, 1,
0.4636507, 1.348424, -0.5787992, 0.003921569, 0, 1, 1,
0.4645614, 0.09028489, 0.4269745, 0.007843138, 0, 1, 1,
0.4682536, 1.106243, -0.7967175, 0.01568628, 0, 1, 1,
0.4683348, -0.8861027, 3.397398, 0.01960784, 0, 1, 1,
0.4686011, 1.179596, -0.4051439, 0.02745098, 0, 1, 1,
0.4696993, -1.092747, 3.122481, 0.03137255, 0, 1, 1,
0.4720291, -1.340034, 2.234221, 0.03921569, 0, 1, 1,
0.4757278, -0.9761193, 3.343309, 0.04313726, 0, 1, 1,
0.4774599, 0.9820052, 0.4433126, 0.05098039, 0, 1, 1,
0.4793668, -0.7539437, 0.192655, 0.05490196, 0, 1, 1,
0.4851071, 0.6560149, 0.2674822, 0.0627451, 0, 1, 1,
0.4866715, -0.1984708, 0.5071116, 0.06666667, 0, 1, 1,
0.4880001, 0.7705395, -0.5370038, 0.07450981, 0, 1, 1,
0.4940581, 1.592472, 0.08275748, 0.07843138, 0, 1, 1,
0.4940894, 1.401774, -0.1762346, 0.08627451, 0, 1, 1,
0.4949502, 1.803147, 0.09518413, 0.09019608, 0, 1, 1,
0.4954723, 0.5535005, 1.306713, 0.09803922, 0, 1, 1,
0.4993021, -1.352878, 2.669124, 0.1058824, 0, 1, 1,
0.5019611, 0.6349199, 0.3518659, 0.1098039, 0, 1, 1,
0.5020378, -1.458459, 2.340107, 0.1176471, 0, 1, 1,
0.5027547, 0.7333713, 0.1627413, 0.1215686, 0, 1, 1,
0.5053533, -0.005341376, 1.131375, 0.1294118, 0, 1, 1,
0.5054929, 0.2571, 1.257148, 0.1333333, 0, 1, 1,
0.5075699, 0.2180328, 0.8424718, 0.1411765, 0, 1, 1,
0.5133159, 0.3891256, 1.60668, 0.145098, 0, 1, 1,
0.5167655, 0.3034485, 0.2947712, 0.1529412, 0, 1, 1,
0.5172395, -0.2482013, 1.767699, 0.1568628, 0, 1, 1,
0.5175983, 0.5486336, 1.120337, 0.1647059, 0, 1, 1,
0.5210426, 0.8295293, 0.987818, 0.1686275, 0, 1, 1,
0.5238373, -1.148967, 1.842433, 0.1764706, 0, 1, 1,
0.5264724, -1.244439, 3.215795, 0.1803922, 0, 1, 1,
0.5267047, 0.1731618, 1.047569, 0.1882353, 0, 1, 1,
0.5273528, -0.9022488, 3.673307, 0.1921569, 0, 1, 1,
0.5293711, -0.594922, 1.293547, 0.2, 0, 1, 1,
0.5294086, 1.122259, 0.6956455, 0.2078431, 0, 1, 1,
0.5346557, -0.5681408, 2.942858, 0.2117647, 0, 1, 1,
0.5393524, 0.09635098, 2.587686, 0.2196078, 0, 1, 1,
0.5406118, -0.70469, 2.704181, 0.2235294, 0, 1, 1,
0.5424425, 1.514229, -0.3414498, 0.2313726, 0, 1, 1,
0.5487037, -0.3618909, 0.9172779, 0.2352941, 0, 1, 1,
0.5507534, 1.611235, -2.029579, 0.2431373, 0, 1, 1,
0.5527697, 0.1070888, 1.139283, 0.2470588, 0, 1, 1,
0.5593265, -1.665424, 2.929417, 0.254902, 0, 1, 1,
0.5609275, 0.6033522, 0.5622492, 0.2588235, 0, 1, 1,
0.5649351, -0.05325329, 3.309762, 0.2666667, 0, 1, 1,
0.5673747, -0.6512334, 3.450279, 0.2705882, 0, 1, 1,
0.5675494, 0.9181776, 1.509645, 0.2784314, 0, 1, 1,
0.5735046, -0.3131639, 1.742255, 0.282353, 0, 1, 1,
0.5743575, 0.08771938, 1.804008, 0.2901961, 0, 1, 1,
0.5755105, 0.1329697, 1.728556, 0.2941177, 0, 1, 1,
0.5760903, 0.3026859, -0.662895, 0.3019608, 0, 1, 1,
0.5770375, -0.3743229, 1.531557, 0.3098039, 0, 1, 1,
0.5781174, -0.8787332, 3.384903, 0.3137255, 0, 1, 1,
0.5788492, 0.2371014, 1.901265, 0.3215686, 0, 1, 1,
0.5851868, -0.3312502, 1.935542, 0.3254902, 0, 1, 1,
0.5857993, -0.7651195, 2.065561, 0.3333333, 0, 1, 1,
0.5870799, 1.002494, 0.6245395, 0.3372549, 0, 1, 1,
0.5886292, -0.2257851, 1.961343, 0.345098, 0, 1, 1,
0.5984997, -0.4517057, 3.078287, 0.3490196, 0, 1, 1,
0.6020806, 1.341833, 2.009189, 0.3568628, 0, 1, 1,
0.6022925, -1.863579, 1.07556, 0.3607843, 0, 1, 1,
0.60353, -0.06129195, 1.869856, 0.3686275, 0, 1, 1,
0.6131096, -1.408874, 3.090395, 0.372549, 0, 1, 1,
0.6170619, 0.6976722, 2.625222, 0.3803922, 0, 1, 1,
0.6178132, -2.35171, 0.7043363, 0.3843137, 0, 1, 1,
0.6212406, 0.4287983, 2.074419, 0.3921569, 0, 1, 1,
0.6235343, -0.4437668, 4.795612, 0.3960784, 0, 1, 1,
0.6236916, 0.7370242, -0.1968199, 0.4039216, 0, 1, 1,
0.6291682, 0.4831957, 0.7005204, 0.4117647, 0, 1, 1,
0.6393396, 0.2507109, 0.5769605, 0.4156863, 0, 1, 1,
0.644713, 0.8177038, 0.6069264, 0.4235294, 0, 1, 1,
0.6454785, 2.801361, -0.2803077, 0.427451, 0, 1, 1,
0.6460506, -1.135967, 3.019083, 0.4352941, 0, 1, 1,
0.652894, -0.6754724, 1.743839, 0.4392157, 0, 1, 1,
0.6532906, -1.123371, 3.739149, 0.4470588, 0, 1, 1,
0.6614666, -0.5814088, 2.585842, 0.4509804, 0, 1, 1,
0.6700816, 1.358911, -0.7953085, 0.4588235, 0, 1, 1,
0.6759107, -0.593716, 2.053903, 0.4627451, 0, 1, 1,
0.6774821, 0.48721, 2.845409, 0.4705882, 0, 1, 1,
0.6785448, 0.06702277, 0.7982279, 0.4745098, 0, 1, 1,
0.679189, 0.6723516, 2.258571, 0.4823529, 0, 1, 1,
0.6885707, 0.906496, 1.501397, 0.4862745, 0, 1, 1,
0.6961431, 0.2480471, 1.58756, 0.4941176, 0, 1, 1,
0.6994566, 0.2325512, 1.368438, 0.5019608, 0, 1, 1,
0.7016135, 0.8674239, 1.453688, 0.5058824, 0, 1, 1,
0.7068474, -2.021823, 1.473173, 0.5137255, 0, 1, 1,
0.7107251, 0.5225626, 2.269072, 0.5176471, 0, 1, 1,
0.7182419, 1.178649, -0.1813171, 0.5254902, 0, 1, 1,
0.723979, 0.5629779, 0.7637823, 0.5294118, 0, 1, 1,
0.7273341, 0.1549942, 1.555549, 0.5372549, 0, 1, 1,
0.7296066, 0.838932, 0.3291584, 0.5411765, 0, 1, 1,
0.7306964, 0.1488599, 1.448942, 0.5490196, 0, 1, 1,
0.7309842, -1.832181, 1.43576, 0.5529412, 0, 1, 1,
0.7330214, -0.2991164, 1.567305, 0.5607843, 0, 1, 1,
0.7364364, -1.901508, 3.086445, 0.5647059, 0, 1, 1,
0.7378296, -0.9641345, 2.355881, 0.572549, 0, 1, 1,
0.7383174, 1.705723, -0.4004838, 0.5764706, 0, 1, 1,
0.7435649, 0.3799398, 1.473931, 0.5843138, 0, 1, 1,
0.7480608, 2.610363, 0.6661062, 0.5882353, 0, 1, 1,
0.7509966, -0.415393, 0.951813, 0.5960785, 0, 1, 1,
0.7532787, 0.4637743, -0.5314942, 0.6039216, 0, 1, 1,
0.7573793, 0.3426321, 1.509033, 0.6078432, 0, 1, 1,
0.7580593, -1.238017, 2.551601, 0.6156863, 0, 1, 1,
0.7606815, 0.01878908, 0.1982061, 0.6196079, 0, 1, 1,
0.7710124, -0.07247655, 1.174684, 0.627451, 0, 1, 1,
0.7726175, 0.8009396, 2.121949, 0.6313726, 0, 1, 1,
0.7753735, 0.9837343, 0.4457856, 0.6392157, 0, 1, 1,
0.7757376, -1.988808, 0.9048702, 0.6431373, 0, 1, 1,
0.7762449, 0.2887034, 1.360626, 0.6509804, 0, 1, 1,
0.7762602, 0.6556554, 1.508003, 0.654902, 0, 1, 1,
0.7795016, -0.2219549, 0.6753463, 0.6627451, 0, 1, 1,
0.7801215, -1.177082, 2.087853, 0.6666667, 0, 1, 1,
0.7826204, -0.5517613, 1.991271, 0.6745098, 0, 1, 1,
0.7827733, 0.3674265, 0.9734593, 0.6784314, 0, 1, 1,
0.7898863, -0.984455, 3.133139, 0.6862745, 0, 1, 1,
0.791244, 0.07690953, 1.492204, 0.6901961, 0, 1, 1,
0.7938009, -0.3426577, 2.043803, 0.6980392, 0, 1, 1,
0.7940223, 1.18243, 0.04235174, 0.7058824, 0, 1, 1,
0.7958148, 0.4060416, 0.3190106, 0.7098039, 0, 1, 1,
0.7981378, 0.5915239, 2.253644, 0.7176471, 0, 1, 1,
0.7984002, 0.1562367, 1.682022, 0.7215686, 0, 1, 1,
0.8070233, -1.26442, 0.2185133, 0.7294118, 0, 1, 1,
0.8094114, 0.5983112, 2.503646, 0.7333333, 0, 1, 1,
0.8098688, 1.644951, 0.3167243, 0.7411765, 0, 1, 1,
0.8124265, 0.9007838, 0.6816415, 0.7450981, 0, 1, 1,
0.8162518, -0.644843, 2.593177, 0.7529412, 0, 1, 1,
0.8170724, -1.213753, 0.3724755, 0.7568628, 0, 1, 1,
0.821736, -0.434699, 3.027678, 0.7647059, 0, 1, 1,
0.8239166, 0.2194559, 0.421762, 0.7686275, 0, 1, 1,
0.824151, 1.257359, 0.462671, 0.7764706, 0, 1, 1,
0.8311741, -0.8497861, 3.454494, 0.7803922, 0, 1, 1,
0.8338029, 0.6761216, 2.255881, 0.7882353, 0, 1, 1,
0.8350453, -1.546812, 2.230545, 0.7921569, 0, 1, 1,
0.8357187, -2.323072, 1.929292, 0.8, 0, 1, 1,
0.8387777, -0.6834126, 1.773946, 0.8078431, 0, 1, 1,
0.8407542, 1.403266, 0.0568013, 0.8117647, 0, 1, 1,
0.8416946, -0.1284007, 1.835655, 0.8196079, 0, 1, 1,
0.842842, -0.6078617, 1.220923, 0.8235294, 0, 1, 1,
0.8493661, 0.1104172, 2.943009, 0.8313726, 0, 1, 1,
0.8550634, -1.284819, 1.826775, 0.8352941, 0, 1, 1,
0.855074, -0.6876501, 2.627031, 0.8431373, 0, 1, 1,
0.8631773, 0.3964213, 0.9018904, 0.8470588, 0, 1, 1,
0.8643618, 2.033002, 0.4990369, 0.854902, 0, 1, 1,
0.8758269, 0.1062336, 0.728276, 0.8588235, 0, 1, 1,
0.8853841, -0.9365465, 1.661016, 0.8666667, 0, 1, 1,
0.8862517, -0.4200836, 2.291144, 0.8705882, 0, 1, 1,
0.8888302, 0.9390917, -0.7217379, 0.8784314, 0, 1, 1,
0.8989002, -0.361821, 3.425142, 0.8823529, 0, 1, 1,
0.9021406, -0.07087261, 0.3451249, 0.8901961, 0, 1, 1,
0.9144771, -1.028306, 3.551777, 0.8941177, 0, 1, 1,
0.914847, -1.038849, 1.311357, 0.9019608, 0, 1, 1,
0.9248465, -0.2407266, 2.228663, 0.9098039, 0, 1, 1,
0.9290456, 0.5099965, 0.9852112, 0.9137255, 0, 1, 1,
0.9305373, 0.07463031, 1.306857, 0.9215686, 0, 1, 1,
0.9335985, -1.093078, 2.195365, 0.9254902, 0, 1, 1,
0.9352292, -1.250003, 4.227918, 0.9333333, 0, 1, 1,
0.9428805, 1.488379, 0.8374439, 0.9372549, 0, 1, 1,
0.9456409, -1.534257, 1.982924, 0.945098, 0, 1, 1,
0.9470435, -1.25386, 1.580172, 0.9490196, 0, 1, 1,
0.9475188, -0.4772405, 3.322132, 0.9568627, 0, 1, 1,
0.9506768, -0.3920875, 3.180271, 0.9607843, 0, 1, 1,
0.9516025, 1.47051, 0.8419417, 0.9686275, 0, 1, 1,
0.9596997, 1.400242, -0.3939138, 0.972549, 0, 1, 1,
0.9628205, -0.006499161, 2.514974, 0.9803922, 0, 1, 1,
0.9666249, 1.277195, -0.04666839, 0.9843137, 0, 1, 1,
0.9722159, 0.7403306, 1.414802, 0.9921569, 0, 1, 1,
0.9740108, 1.664144, -1.889745, 0.9960784, 0, 1, 1,
0.9753077, -1.019529, 3.438969, 1, 0, 0.9960784, 1,
0.978815, -1.468726, 2.749827, 1, 0, 0.9882353, 1,
0.9917973, -0.5328038, 2.39372, 1, 0, 0.9843137, 1,
0.994812, 0.9396011, 0.598882, 1, 0, 0.9764706, 1,
1.004319, 0.2652627, 0.8426751, 1, 0, 0.972549, 1,
1.007485, 0.7167044, -0.1882735, 1, 0, 0.9647059, 1,
1.011574, -1.460973, 3.709483, 1, 0, 0.9607843, 1,
1.015011, -1.181378, 2.162453, 1, 0, 0.9529412, 1,
1.018327, -0.5976539, 3.292129, 1, 0, 0.9490196, 1,
1.018345, 0.8571463, 1.409304, 1, 0, 0.9411765, 1,
1.019777, -0.003090162, 1.340769, 1, 0, 0.9372549, 1,
1.024827, -0.1429491, 2.650409, 1, 0, 0.9294118, 1,
1.024924, 0.6179446, 0.2863135, 1, 0, 0.9254902, 1,
1.032952, 0.9627573, 0.01482106, 1, 0, 0.9176471, 1,
1.037395, 0.1061136, 0.4064795, 1, 0, 0.9137255, 1,
1.043474, -1.381607, 3.480309, 1, 0, 0.9058824, 1,
1.048841, -0.7323806, 2.082705, 1, 0, 0.9019608, 1,
1.054398, -1.154592, 3.262533, 1, 0, 0.8941177, 1,
1.054962, -0.9634182, 0.8335471, 1, 0, 0.8862745, 1,
1.055538, 0.6559476, 2.554498, 1, 0, 0.8823529, 1,
1.059221, -0.2607076, 1.551429, 1, 0, 0.8745098, 1,
1.061307, 0.1119646, 0.8369928, 1, 0, 0.8705882, 1,
1.072747, 0.1212328, 1.231367, 1, 0, 0.8627451, 1,
1.074249, -1.096635, 3.009558, 1, 0, 0.8588235, 1,
1.075887, 0.6361084, 1.365621, 1, 0, 0.8509804, 1,
1.079932, -0.1832241, -0.3153548, 1, 0, 0.8470588, 1,
1.083375, 1.03048, 1.853778, 1, 0, 0.8392157, 1,
1.084399, -0.9404792, 2.317994, 1, 0, 0.8352941, 1,
1.107139, -0.625599, 2.092938, 1, 0, 0.827451, 1,
1.11021, 0.6909975, 0.682141, 1, 0, 0.8235294, 1,
1.11767, -0.1506844, 1.317818, 1, 0, 0.8156863, 1,
1.121241, -0.8943306, 3.153102, 1, 0, 0.8117647, 1,
1.123266, 0.5241212, -0.5020454, 1, 0, 0.8039216, 1,
1.128889, 1.975968, 2.22754, 1, 0, 0.7960784, 1,
1.139172, 0.2991415, -0.2416266, 1, 0, 0.7921569, 1,
1.147527, 0.5674124, 1.239168, 1, 0, 0.7843137, 1,
1.152955, -0.03992099, 2.633033, 1, 0, 0.7803922, 1,
1.156688, 1.340738, 1.376513, 1, 0, 0.772549, 1,
1.157237, 1.674614, -1.013721, 1, 0, 0.7686275, 1,
1.162685, 0.6473576, 0.9954937, 1, 0, 0.7607843, 1,
1.166762, 0.7397233, 2.465112, 1, 0, 0.7568628, 1,
1.167242, 1.392343, 0.977118, 1, 0, 0.7490196, 1,
1.167471, 0.007550728, 0.04406729, 1, 0, 0.7450981, 1,
1.174769, -0.9915895, 3.502636, 1, 0, 0.7372549, 1,
1.181155, 0.0310538, 2.827652, 1, 0, 0.7333333, 1,
1.182483, 1.103313, 0.8150195, 1, 0, 0.7254902, 1,
1.18548, -3.278538, 0.9996314, 1, 0, 0.7215686, 1,
1.194018, 0.08048633, 2.537915, 1, 0, 0.7137255, 1,
1.200197, -0.3180426, 1.057354, 1, 0, 0.7098039, 1,
1.206672, 1.121272, 0.2921012, 1, 0, 0.7019608, 1,
1.216303, 0.6297165, 0.1024673, 1, 0, 0.6941177, 1,
1.222598, 0.1023379, 2.366013, 1, 0, 0.6901961, 1,
1.22406, -0.197284, 1.792539, 1, 0, 0.682353, 1,
1.228818, 0.5285749, 0.3715739, 1, 0, 0.6784314, 1,
1.235377, 0.1907165, 3.051056, 1, 0, 0.6705883, 1,
1.235624, -0.9022376, 3.830731, 1, 0, 0.6666667, 1,
1.237373, 0.1894066, -0.2088756, 1, 0, 0.6588235, 1,
1.243751, -0.3645056, 0.639123, 1, 0, 0.654902, 1,
1.248149, -0.7348991, 1.889639, 1, 0, 0.6470588, 1,
1.250424, 2.013524, -0.1011196, 1, 0, 0.6431373, 1,
1.265984, 0.1463655, 0.3794199, 1, 0, 0.6352941, 1,
1.278985, -0.2383763, 2.713071, 1, 0, 0.6313726, 1,
1.28168, 1.072611, 2.076611, 1, 0, 0.6235294, 1,
1.283674, -2.049984, 2.35768, 1, 0, 0.6196079, 1,
1.284061, -0.3337252, 2.685026, 1, 0, 0.6117647, 1,
1.284924, -0.8539857, 1.62011, 1, 0, 0.6078432, 1,
1.287227, 0.5695328, 1.469259, 1, 0, 0.6, 1,
1.29125, 1.485661, -1.381678, 1, 0, 0.5921569, 1,
1.294928, 0.1618618, 2.377145, 1, 0, 0.5882353, 1,
1.309117, 1.087589, 0.1851059, 1, 0, 0.5803922, 1,
1.309951, -0.1857934, 2.239371, 1, 0, 0.5764706, 1,
1.312396, 0.3075908, 0.1143535, 1, 0, 0.5686275, 1,
1.314791, -1.062992, 3.078284, 1, 0, 0.5647059, 1,
1.321938, 0.420568, 0.3176714, 1, 0, 0.5568628, 1,
1.32619, 0.5520753, 1.859327, 1, 0, 0.5529412, 1,
1.329779, -0.04809136, 1.603372, 1, 0, 0.5450981, 1,
1.329982, -0.3428073, 2.036862, 1, 0, 0.5411765, 1,
1.336076, -0.7585346, 0.9582476, 1, 0, 0.5333334, 1,
1.344745, 0.2783237, 1.645512, 1, 0, 0.5294118, 1,
1.345559, 0.1949751, 1.884066, 1, 0, 0.5215687, 1,
1.347316, -0.3682859, 0.9546641, 1, 0, 0.5176471, 1,
1.352872, 0.38486, 1.388659, 1, 0, 0.509804, 1,
1.35897, 0.9190779, 1.681972, 1, 0, 0.5058824, 1,
1.380503, 0.1628005, 3.118612, 1, 0, 0.4980392, 1,
1.391126, -0.3637557, 1.243259, 1, 0, 0.4901961, 1,
1.411351, 0.8132879, 1.150029, 1, 0, 0.4862745, 1,
1.413099, 1.189474, 1.300166, 1, 0, 0.4784314, 1,
1.440247, 1.436562, 0.3763874, 1, 0, 0.4745098, 1,
1.445046, -0.5621837, 2.5201, 1, 0, 0.4666667, 1,
1.45005, 0.1659713, 0.8114341, 1, 0, 0.4627451, 1,
1.450716, -0.908299, 3.342289, 1, 0, 0.454902, 1,
1.452008, 1.788563, 1.480932, 1, 0, 0.4509804, 1,
1.458776, -0.2883487, 0.193633, 1, 0, 0.4431373, 1,
1.472603, -0.2842269, 1.729528, 1, 0, 0.4392157, 1,
1.499607, 0.8076147, -0.3471976, 1, 0, 0.4313726, 1,
1.507657, -0.3982024, 0.2382623, 1, 0, 0.427451, 1,
1.521059, 0.3589531, 0.7261643, 1, 0, 0.4196078, 1,
1.526598, 0.7705467, 1.577867, 1, 0, 0.4156863, 1,
1.534271, -1.301439, 2.965749, 1, 0, 0.4078431, 1,
1.550684, -1.717001, 3.111669, 1, 0, 0.4039216, 1,
1.567147, 1.43646, 0.6914253, 1, 0, 0.3960784, 1,
1.568885, 1.150384, 0.4619702, 1, 0, 0.3882353, 1,
1.577954, -0.7164964, 2.333458, 1, 0, 0.3843137, 1,
1.58, -0.189433, 1.809799, 1, 0, 0.3764706, 1,
1.583905, 1.816494, 0.01432754, 1, 0, 0.372549, 1,
1.590781, 1.343609, 0.08561784, 1, 0, 0.3647059, 1,
1.603659, 1.057416, 1.019988, 1, 0, 0.3607843, 1,
1.623345, -0.3904548, 2.392058, 1, 0, 0.3529412, 1,
1.631688, 0.6323971, 3.066878, 1, 0, 0.3490196, 1,
1.632808, -2.155022, 3.77367, 1, 0, 0.3411765, 1,
1.649847, 0.7195513, 1.135302, 1, 0, 0.3372549, 1,
1.654345, 0.1106973, 0.4869525, 1, 0, 0.3294118, 1,
1.671201, -0.1160396, 1.929811, 1, 0, 0.3254902, 1,
1.678985, -0.003522923, 0.02272224, 1, 0, 0.3176471, 1,
1.683617, -0.4458686, 1.349089, 1, 0, 0.3137255, 1,
1.69132, -1.58301, 2.845326, 1, 0, 0.3058824, 1,
1.695583, 0.08654892, 1.887138, 1, 0, 0.2980392, 1,
1.699963, -2.300875, 2.902046, 1, 0, 0.2941177, 1,
1.703107, -0.001360039, 1.555717, 1, 0, 0.2862745, 1,
1.727481, -0.367616, 2.102172, 1, 0, 0.282353, 1,
1.73193, -0.2408058, 1.96115, 1, 0, 0.2745098, 1,
1.732664, 1.694719, 1.016501, 1, 0, 0.2705882, 1,
1.749601, 0.4630243, 1.787998, 1, 0, 0.2627451, 1,
1.757508, -1.978119, 3.842683, 1, 0, 0.2588235, 1,
1.75863, 1.475806, 0.3394689, 1, 0, 0.2509804, 1,
1.761395, -1.065478, 2.946217, 1, 0, 0.2470588, 1,
1.779059, -0.610965, 1.392768, 1, 0, 0.2392157, 1,
1.798828, 0.6762441, 2.044523, 1, 0, 0.2352941, 1,
1.805875, -1.675216, 1.133804, 1, 0, 0.227451, 1,
1.807248, 0.003194359, 3.489974, 1, 0, 0.2235294, 1,
1.853342, -1.605488, 2.057593, 1, 0, 0.2156863, 1,
1.862801, 0.1807289, 0.5192513, 1, 0, 0.2117647, 1,
1.893938, -0.07559256, 2.715652, 1, 0, 0.2039216, 1,
1.943443, 1.019634, 1.816348, 1, 0, 0.1960784, 1,
1.958991, 0.1227079, 2.080666, 1, 0, 0.1921569, 1,
1.972727, -1.622823, 3.378392, 1, 0, 0.1843137, 1,
1.97677, 1.680929, 1.188744, 1, 0, 0.1803922, 1,
1.9778, 1.198885, 1.963577, 1, 0, 0.172549, 1,
1.980292, -1.854475, 2.514485, 1, 0, 0.1686275, 1,
2.006574, -0.2149236, 0.8287466, 1, 0, 0.1607843, 1,
2.026131, -0.2536292, 0.9528694, 1, 0, 0.1568628, 1,
2.044805, 1.394515, 1.37774, 1, 0, 0.1490196, 1,
2.064531, -0.3169305, 1.818884, 1, 0, 0.145098, 1,
2.086865, -0.9927657, 0.8386061, 1, 0, 0.1372549, 1,
2.130171, 0.2089462, 2.982439, 1, 0, 0.1333333, 1,
2.133025, 0.5734186, 1.506205, 1, 0, 0.1254902, 1,
2.170102, -0.4210184, 2.592923, 1, 0, 0.1215686, 1,
2.173053, -0.8166006, 2.287946, 1, 0, 0.1137255, 1,
2.197876, 1.213834, 2.089337, 1, 0, 0.1098039, 1,
2.237208, 1.493892, -0.5119182, 1, 0, 0.1019608, 1,
2.243448, -0.2823665, 1.30188, 1, 0, 0.09411765, 1,
2.253864, 1.999188, -0.1201239, 1, 0, 0.09019608, 1,
2.275243, -0.6359822, 2.374257, 1, 0, 0.08235294, 1,
2.326594, -1.71363, 2.779727, 1, 0, 0.07843138, 1,
2.33287, -2.376494, 1.27217, 1, 0, 0.07058824, 1,
2.374954, 0.4005587, 1.18767, 1, 0, 0.06666667, 1,
2.378547, -0.262252, 4.053711, 1, 0, 0.05882353, 1,
2.389564, -1.581919, 2.676857, 1, 0, 0.05490196, 1,
2.419582, 0.5526525, 1.29788, 1, 0, 0.04705882, 1,
2.516866, 0.515677, 3.159057, 1, 0, 0.04313726, 1,
2.648271, 0.01166006, 1.133217, 1, 0, 0.03529412, 1,
2.708839, 0.3131716, 0.8821921, 1, 0, 0.03137255, 1,
2.716181, 0.3855415, 3.112419, 1, 0, 0.02352941, 1,
2.898545, -0.002892229, 3.050633, 1, 0, 0.01960784, 1,
3.190951, 0.7966312, 1.182864, 1, 0, 0.01176471, 1,
3.234458, 0.5555529, 0.6385372, 1, 0, 0.007843138, 1
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
0.02123988, -4.417619, -7.561145, 0, -0.5, 0.5, 0.5,
0.02123988, -4.417619, -7.561145, 1, -0.5, 0.5, 0.5,
0.02123988, -4.417619, -7.561145, 1, 1.5, 0.5, 0.5,
0.02123988, -4.417619, -7.561145, 0, 1.5, 0.5, 0.5
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
-4.28126, 0.0815841, -7.561145, 0, -0.5, 0.5, 0.5,
-4.28126, 0.0815841, -7.561145, 1, -0.5, 0.5, 0.5,
-4.28126, 0.0815841, -7.561145, 1, 1.5, 0.5, 0.5,
-4.28126, 0.0815841, -7.561145, 0, 1.5, 0.5, 0.5
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
-4.28126, -4.417619, -0.0923481, 0, -0.5, 0.5, 0.5,
-4.28126, -4.417619, -0.0923481, 1, -0.5, 0.5, 0.5,
-4.28126, -4.417619, -0.0923481, 1, 1.5, 0.5, 0.5,
-4.28126, -4.417619, -0.0923481, 0, 1.5, 0.5, 0.5
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
-3, -3.379342, -5.837576,
3, -3.379342, -5.837576,
-3, -3.379342, -5.837576,
-3, -3.552388, -6.124837,
-2, -3.379342, -5.837576,
-2, -3.552388, -6.124837,
-1, -3.379342, -5.837576,
-1, -3.552388, -6.124837,
0, -3.379342, -5.837576,
0, -3.552388, -6.124837,
1, -3.379342, -5.837576,
1, -3.552388, -6.124837,
2, -3.379342, -5.837576,
2, -3.552388, -6.124837,
3, -3.379342, -5.837576,
3, -3.552388, -6.124837
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
-3, -3.89848, -6.69936, 0, -0.5, 0.5, 0.5,
-3, -3.89848, -6.69936, 1, -0.5, 0.5, 0.5,
-3, -3.89848, -6.69936, 1, 1.5, 0.5, 0.5,
-3, -3.89848, -6.69936, 0, 1.5, 0.5, 0.5,
-2, -3.89848, -6.69936, 0, -0.5, 0.5, 0.5,
-2, -3.89848, -6.69936, 1, -0.5, 0.5, 0.5,
-2, -3.89848, -6.69936, 1, 1.5, 0.5, 0.5,
-2, -3.89848, -6.69936, 0, 1.5, 0.5, 0.5,
-1, -3.89848, -6.69936, 0, -0.5, 0.5, 0.5,
-1, -3.89848, -6.69936, 1, -0.5, 0.5, 0.5,
-1, -3.89848, -6.69936, 1, 1.5, 0.5, 0.5,
-1, -3.89848, -6.69936, 0, 1.5, 0.5, 0.5,
0, -3.89848, -6.69936, 0, -0.5, 0.5, 0.5,
0, -3.89848, -6.69936, 1, -0.5, 0.5, 0.5,
0, -3.89848, -6.69936, 1, 1.5, 0.5, 0.5,
0, -3.89848, -6.69936, 0, 1.5, 0.5, 0.5,
1, -3.89848, -6.69936, 0, -0.5, 0.5, 0.5,
1, -3.89848, -6.69936, 1, -0.5, 0.5, 0.5,
1, -3.89848, -6.69936, 1, 1.5, 0.5, 0.5,
1, -3.89848, -6.69936, 0, 1.5, 0.5, 0.5,
2, -3.89848, -6.69936, 0, -0.5, 0.5, 0.5,
2, -3.89848, -6.69936, 1, -0.5, 0.5, 0.5,
2, -3.89848, -6.69936, 1, 1.5, 0.5, 0.5,
2, -3.89848, -6.69936, 0, 1.5, 0.5, 0.5,
3, -3.89848, -6.69936, 0, -0.5, 0.5, 0.5,
3, -3.89848, -6.69936, 1, -0.5, 0.5, 0.5,
3, -3.89848, -6.69936, 1, 1.5, 0.5, 0.5,
3, -3.89848, -6.69936, 0, 1.5, 0.5, 0.5
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
-3.288375, -3, -5.837576,
-3.288375, 3, -5.837576,
-3.288375, -3, -5.837576,
-3.453856, -3, -6.124837,
-3.288375, -2, -5.837576,
-3.453856, -2, -6.124837,
-3.288375, -1, -5.837576,
-3.453856, -1, -6.124837,
-3.288375, 0, -5.837576,
-3.453856, 0, -6.124837,
-3.288375, 1, -5.837576,
-3.453856, 1, -6.124837,
-3.288375, 2, -5.837576,
-3.453856, 2, -6.124837,
-3.288375, 3, -5.837576,
-3.453856, 3, -6.124837
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
-3.784817, -3, -6.69936, 0, -0.5, 0.5, 0.5,
-3.784817, -3, -6.69936, 1, -0.5, 0.5, 0.5,
-3.784817, -3, -6.69936, 1, 1.5, 0.5, 0.5,
-3.784817, -3, -6.69936, 0, 1.5, 0.5, 0.5,
-3.784817, -2, -6.69936, 0, -0.5, 0.5, 0.5,
-3.784817, -2, -6.69936, 1, -0.5, 0.5, 0.5,
-3.784817, -2, -6.69936, 1, 1.5, 0.5, 0.5,
-3.784817, -2, -6.69936, 0, 1.5, 0.5, 0.5,
-3.784817, -1, -6.69936, 0, -0.5, 0.5, 0.5,
-3.784817, -1, -6.69936, 1, -0.5, 0.5, 0.5,
-3.784817, -1, -6.69936, 1, 1.5, 0.5, 0.5,
-3.784817, -1, -6.69936, 0, 1.5, 0.5, 0.5,
-3.784817, 0, -6.69936, 0, -0.5, 0.5, 0.5,
-3.784817, 0, -6.69936, 1, -0.5, 0.5, 0.5,
-3.784817, 0, -6.69936, 1, 1.5, 0.5, 0.5,
-3.784817, 0, -6.69936, 0, 1.5, 0.5, 0.5,
-3.784817, 1, -6.69936, 0, -0.5, 0.5, 0.5,
-3.784817, 1, -6.69936, 1, -0.5, 0.5, 0.5,
-3.784817, 1, -6.69936, 1, 1.5, 0.5, 0.5,
-3.784817, 1, -6.69936, 0, 1.5, 0.5, 0.5,
-3.784817, 2, -6.69936, 0, -0.5, 0.5, 0.5,
-3.784817, 2, -6.69936, 1, -0.5, 0.5, 0.5,
-3.784817, 2, -6.69936, 1, 1.5, 0.5, 0.5,
-3.784817, 2, -6.69936, 0, 1.5, 0.5, 0.5,
-3.784817, 3, -6.69936, 0, -0.5, 0.5, 0.5,
-3.784817, 3, -6.69936, 1, -0.5, 0.5, 0.5,
-3.784817, 3, -6.69936, 1, 1.5, 0.5, 0.5,
-3.784817, 3, -6.69936, 0, 1.5, 0.5, 0.5
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
-3.288375, -3.379342, -4,
-3.288375, -3.379342, 4,
-3.288375, -3.379342, -4,
-3.453856, -3.552388, -4,
-3.288375, -3.379342, -2,
-3.453856, -3.552388, -2,
-3.288375, -3.379342, 0,
-3.453856, -3.552388, 0,
-3.288375, -3.379342, 2,
-3.453856, -3.552388, 2,
-3.288375, -3.379342, 4,
-3.453856, -3.552388, 4
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
-3.784817, -3.89848, -4, 0, -0.5, 0.5, 0.5,
-3.784817, -3.89848, -4, 1, -0.5, 0.5, 0.5,
-3.784817, -3.89848, -4, 1, 1.5, 0.5, 0.5,
-3.784817, -3.89848, -4, 0, 1.5, 0.5, 0.5,
-3.784817, -3.89848, -2, 0, -0.5, 0.5, 0.5,
-3.784817, -3.89848, -2, 1, -0.5, 0.5, 0.5,
-3.784817, -3.89848, -2, 1, 1.5, 0.5, 0.5,
-3.784817, -3.89848, -2, 0, 1.5, 0.5, 0.5,
-3.784817, -3.89848, 0, 0, -0.5, 0.5, 0.5,
-3.784817, -3.89848, 0, 1, -0.5, 0.5, 0.5,
-3.784817, -3.89848, 0, 1, 1.5, 0.5, 0.5,
-3.784817, -3.89848, 0, 0, 1.5, 0.5, 0.5,
-3.784817, -3.89848, 2, 0, -0.5, 0.5, 0.5,
-3.784817, -3.89848, 2, 1, -0.5, 0.5, 0.5,
-3.784817, -3.89848, 2, 1, 1.5, 0.5, 0.5,
-3.784817, -3.89848, 2, 0, 1.5, 0.5, 0.5,
-3.784817, -3.89848, 4, 0, -0.5, 0.5, 0.5,
-3.784817, -3.89848, 4, 1, -0.5, 0.5, 0.5,
-3.784817, -3.89848, 4, 1, 1.5, 0.5, 0.5,
-3.784817, -3.89848, 4, 0, 1.5, 0.5, 0.5
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
-3.288375, -3.379342, -5.837576,
-3.288375, 3.54251, -5.837576,
-3.288375, -3.379342, 5.65288,
-3.288375, 3.54251, 5.65288,
-3.288375, -3.379342, -5.837576,
-3.288375, -3.379342, 5.65288,
-3.288375, 3.54251, -5.837576,
-3.288375, 3.54251, 5.65288,
-3.288375, -3.379342, -5.837576,
3.330855, -3.379342, -5.837576,
-3.288375, -3.379342, 5.65288,
3.330855, -3.379342, 5.65288,
-3.288375, 3.54251, -5.837576,
3.330855, 3.54251, -5.837576,
-3.288375, 3.54251, 5.65288,
3.330855, 3.54251, 5.65288,
3.330855, -3.379342, -5.837576,
3.330855, 3.54251, -5.837576,
3.330855, -3.379342, 5.65288,
3.330855, 3.54251, 5.65288,
3.330855, -3.379342, -5.837576,
3.330855, -3.379342, 5.65288,
3.330855, 3.54251, -5.837576,
3.330855, 3.54251, 5.65288
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
var radius = 7.98755;
var distance = 35.53751;
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
mvMatrix.translate( -0.02123988, -0.0815841, 0.0923481 );
mvMatrix.scale( 1.304728, 1.247686, 0.751606 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.53751);
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
thiophene-2-carboxyl<-read.table("thiophene-2-carboxyl.xyz")
```

```
## Error in read.table("thiophene-2-carboxyl.xyz"): no lines available in input
```

```r
x<-thiophene-2-carboxyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiophene' not found
```

```r
y<-thiophene-2-carboxyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiophene' not found
```

```r
z<-thiophene-2-carboxyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiophene' not found
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
-3.191978, 2.020146, -1.433325, 0, 0, 1, 1, 1,
-3.037131, -0.5716856, -0.254181, 1, 0, 0, 1, 1,
-2.709126, -1.912177, -2.269649, 1, 0, 0, 1, 1,
-2.665124, -1.141728, -1.724862, 1, 0, 0, 1, 1,
-2.656058, 0.2088217, -2.372643, 1, 0, 0, 1, 1,
-2.562618, -1.176105, -1.285925, 1, 0, 0, 1, 1,
-2.542846, 0.09261428, -0.6897126, 0, 0, 0, 1, 1,
-2.493079, 0.1932732, -2.797147, 0, 0, 0, 1, 1,
-2.418219, 1.177426, -1.018506, 0, 0, 0, 1, 1,
-2.416699, 1.2097, -1.827331, 0, 0, 0, 1, 1,
-2.412215, -0.03376697, -1.154872, 0, 0, 0, 1, 1,
-2.345302, 1.434482, 0.2616285, 0, 0, 0, 1, 1,
-2.340721, -2.228335, -3.345942, 0, 0, 0, 1, 1,
-2.330014, -0.5162871, -1.178949, 1, 1, 1, 1, 1,
-2.295635, -0.7267465, -1.645714, 1, 1, 1, 1, 1,
-2.287895, -0.2344627, -1.889483, 1, 1, 1, 1, 1,
-2.268404, -0.7638395, -1.142501, 1, 1, 1, 1, 1,
-2.267635, -1.283471, -1.218631, 1, 1, 1, 1, 1,
-2.264529, 0.4129013, 0.1105318, 1, 1, 1, 1, 1,
-2.203214, 0.3348324, -1.452063, 1, 1, 1, 1, 1,
-2.168862, 0.200779, -0.03809766, 1, 1, 1, 1, 1,
-2.099702, -1.66239, 0.2023124, 1, 1, 1, 1, 1,
-2.099119, -0.3011873, -1.954915, 1, 1, 1, 1, 1,
-2.082842, 1.246826, -0.1391313, 1, 1, 1, 1, 1,
-2.069109, -1.254333, -2.426305, 1, 1, 1, 1, 1,
-2.057791, 1.813437, -2.362849, 1, 1, 1, 1, 1,
-2.015675, 1.048081, -2.140594, 1, 1, 1, 1, 1,
-2.002289, 1.031189, -0.7389763, 1, 1, 1, 1, 1,
-1.999316, -0.6953349, -3.253477, 0, 0, 1, 1, 1,
-1.934178, -0.3038253, -1.375855, 1, 0, 0, 1, 1,
-1.932419, -0.9734113, -0.6782929, 1, 0, 0, 1, 1,
-1.890784, -1.274959, -2.081199, 1, 0, 0, 1, 1,
-1.869792, 0.6600922, -2.214194, 1, 0, 0, 1, 1,
-1.867045, 0.8143575, -0.6036677, 1, 0, 0, 1, 1,
-1.83093, -0.4101279, -1.184759, 0, 0, 0, 1, 1,
-1.796785, 1.077045, -0.7534593, 0, 0, 0, 1, 1,
-1.780154, -0.4310012, -3.178021, 0, 0, 0, 1, 1,
-1.767932, -0.07651536, -2.198241, 0, 0, 0, 1, 1,
-1.74939, 0.6633392, -1.899757, 0, 0, 0, 1, 1,
-1.748023, 0.1828708, -1.735147, 0, 0, 0, 1, 1,
-1.7426, -0.8217636, -1.378506, 0, 0, 0, 1, 1,
-1.740688, -0.4956735, -1.598178, 1, 1, 1, 1, 1,
-1.726151, -0.5253969, -2.597226, 1, 1, 1, 1, 1,
-1.709816, -0.2680117, -2.149358, 1, 1, 1, 1, 1,
-1.705276, 0.6994021, -1.070411, 1, 1, 1, 1, 1,
-1.694437, 0.3288804, -1.369797, 1, 1, 1, 1, 1,
-1.681316, 1.922118, -1.115944, 1, 1, 1, 1, 1,
-1.662028, -0.6597911, -3.111099, 1, 1, 1, 1, 1,
-1.655429, -1.058047, -3.433105, 1, 1, 1, 1, 1,
-1.643059, 0.9866394, -1.095352, 1, 1, 1, 1, 1,
-1.634707, 0.5646552, -0.7307755, 1, 1, 1, 1, 1,
-1.634498, 0.0181096, -3.016298, 1, 1, 1, 1, 1,
-1.624933, -0.654418, -1.272232, 1, 1, 1, 1, 1,
-1.610783, 0.1410429, -1.712527, 1, 1, 1, 1, 1,
-1.600917, -1.571571, -1.470428, 1, 1, 1, 1, 1,
-1.572577, -1.002272, -2.772224, 1, 1, 1, 1, 1,
-1.571449, 1.780525, 0.1279269, 0, 0, 1, 1, 1,
-1.568457, -0.5578747, -1.702767, 1, 0, 0, 1, 1,
-1.566686, 1.035442, -0.7831014, 1, 0, 0, 1, 1,
-1.557398, 0.3859879, -1.681885, 1, 0, 0, 1, 1,
-1.550471, 0.4084202, -0.4293566, 1, 0, 0, 1, 1,
-1.54837, 0.1485245, -4.2736, 1, 0, 0, 1, 1,
-1.535524, 0.1036165, -1.055007, 0, 0, 0, 1, 1,
-1.510468, 1.516116, -0.7528945, 0, 0, 0, 1, 1,
-1.498139, 0.6360725, -2.35874, 0, 0, 0, 1, 1,
-1.495836, 0.1998153, -1.699825, 0, 0, 0, 1, 1,
-1.478151, -0.1326407, -3.303994, 0, 0, 0, 1, 1,
-1.469898, 0.919035, -1.798466, 0, 0, 0, 1, 1,
-1.46904, 0.4516473, -1.290162, 0, 0, 0, 1, 1,
-1.465581, -0.9242515, -4.420778, 1, 1, 1, 1, 1,
-1.461953, -1.104884, -1.616694, 1, 1, 1, 1, 1,
-1.461383, -0.4318629, -2.795997, 1, 1, 1, 1, 1,
-1.429874, 0.1112272, -1.264094, 1, 1, 1, 1, 1,
-1.422144, -1.132373, -3.06073, 1, 1, 1, 1, 1,
-1.409965, -0.5032065, -3.126331, 1, 1, 1, 1, 1,
-1.397946, 2.894935, 0.1453714, 1, 1, 1, 1, 1,
-1.390843, -0.3734407, -1.10179, 1, 1, 1, 1, 1,
-1.388193, -1.875633, -2.423685, 1, 1, 1, 1, 1,
-1.384771, 1.567515, -0.8366098, 1, 1, 1, 1, 1,
-1.384532, 0.2968799, -1.07107, 1, 1, 1, 1, 1,
-1.368828, -0.444039, -1.437507, 1, 1, 1, 1, 1,
-1.367104, 0.6629184, -2.489983, 1, 1, 1, 1, 1,
-1.366416, -0.8905969, -2.549036, 1, 1, 1, 1, 1,
-1.359318, -1.831505, -4.14311, 1, 1, 1, 1, 1,
-1.355736, -0.7898431, -1.552284, 0, 0, 1, 1, 1,
-1.354605, 2.421349, -0.8507503, 1, 0, 0, 1, 1,
-1.351902, -0.682353, -1.423152, 1, 0, 0, 1, 1,
-1.338229, -0.3773926, -2.694482, 1, 0, 0, 1, 1,
-1.336491, -0.7732068, -1.674129, 1, 0, 0, 1, 1,
-1.332528, -1.850971, -4.246912, 1, 0, 0, 1, 1,
-1.323553, -0.8662592, -1.954964, 0, 0, 0, 1, 1,
-1.322057, 0.8530471, -0.09050124, 0, 0, 0, 1, 1,
-1.316516, -0.6994311, -1.123054, 0, 0, 0, 1, 1,
-1.308402, 0.2392912, -0.7027819, 0, 0, 0, 1, 1,
-1.297558, 1.26925, 1.092115, 0, 0, 0, 1, 1,
-1.294013, 0.8546653, -2.083807, 0, 0, 0, 1, 1,
-1.287136, 2.438388, -0.8556607, 0, 0, 0, 1, 1,
-1.285204, 0.2041079, 1.455562, 1, 1, 1, 1, 1,
-1.284306, 1.293934, -0.3469242, 1, 1, 1, 1, 1,
-1.274855, 1.976154, 0.3746703, 1, 1, 1, 1, 1,
-1.26524, 0.3211991, -3.677455, 1, 1, 1, 1, 1,
-1.25761, -0.5287285, -2.989835, 1, 1, 1, 1, 1,
-1.252645, -1.464779, -1.761332, 1, 1, 1, 1, 1,
-1.243812, 0.4479618, -1.480952, 1, 1, 1, 1, 1,
-1.227317, -1.434622, -1.819444, 1, 1, 1, 1, 1,
-1.221547, -0.584546, -2.57217, 1, 1, 1, 1, 1,
-1.214849, 0.6725711, -0.9501162, 1, 1, 1, 1, 1,
-1.211863, -0.167913, -0.6407815, 1, 1, 1, 1, 1,
-1.2098, -0.08481818, -0.41432, 1, 1, 1, 1, 1,
-1.199889, -0.3357017, -0.615531, 1, 1, 1, 1, 1,
-1.199712, 0.7675534, 0.3175112, 1, 1, 1, 1, 1,
-1.196456, -1.558635, -3.195227, 1, 1, 1, 1, 1,
-1.196394, 1.215631, -0.0897705, 0, 0, 1, 1, 1,
-1.194706, -0.2143479, -1.420689, 1, 0, 0, 1, 1,
-1.185212, 1.610387, -0.6030364, 1, 0, 0, 1, 1,
-1.180276, -1.139307, -0.5929976, 1, 0, 0, 1, 1,
-1.179872, 0.05727773, -2.301534, 1, 0, 0, 1, 1,
-1.17862, 2.194435, 0.3749469, 1, 0, 0, 1, 1,
-1.176976, -0.6676686, -0.6114569, 0, 0, 0, 1, 1,
-1.175727, 0.4585171, -2.546552, 0, 0, 0, 1, 1,
-1.17419, -1.141134, -3.219203, 0, 0, 0, 1, 1,
-1.173578, 0.5906966, -2.408159, 0, 0, 0, 1, 1,
-1.165461, 1.796737, -1.564361, 0, 0, 0, 1, 1,
-1.16258, 0.9239219, 0.2708512, 0, 0, 0, 1, 1,
-1.160548, 1.082942, -1.521988, 0, 0, 0, 1, 1,
-1.157603, 0.4435065, -1.272284, 1, 1, 1, 1, 1,
-1.151237, 0.2617685, -0.4150566, 1, 1, 1, 1, 1,
-1.150176, -0.8351201, -1.899845, 1, 1, 1, 1, 1,
-1.14435, -0.6509749, -1.674393, 1, 1, 1, 1, 1,
-1.134192, 0.7505625, -0.7272658, 1, 1, 1, 1, 1,
-1.127265, 0.2092865, -1.298085, 1, 1, 1, 1, 1,
-1.124256, 0.8930785, -1.3015, 1, 1, 1, 1, 1,
-1.121668, 1.891592, -0.6599276, 1, 1, 1, 1, 1,
-1.118909, 0.2064218, -2.588942, 1, 1, 1, 1, 1,
-1.114251, -0.9889662, -2.793169, 1, 1, 1, 1, 1,
-1.11419, -0.8352225, -1.14187, 1, 1, 1, 1, 1,
-1.112104, 1.126526, -0.8424373, 1, 1, 1, 1, 1,
-1.107032, 1.639885, -0.4704297, 1, 1, 1, 1, 1,
-1.106037, 1.481258, -1.947957, 1, 1, 1, 1, 1,
-1.103643, -0.3163994, -1.562648, 1, 1, 1, 1, 1,
-1.100857, 1.108953, 0.2264165, 0, 0, 1, 1, 1,
-1.099352, -0.4319858, -1.872594, 1, 0, 0, 1, 1,
-1.097954, -1.814281, -3.716635, 1, 0, 0, 1, 1,
-1.094497, 0.6548303, -3.186438, 1, 0, 0, 1, 1,
-1.090351, 1.052835, -1.426838, 1, 0, 0, 1, 1,
-1.088426, -0.5124287, -1.691302, 1, 0, 0, 1, 1,
-1.086928, 0.680516, -1.160231, 0, 0, 0, 1, 1,
-1.085841, -1.109103, -0.8866911, 0, 0, 0, 1, 1,
-1.084166, -1.32772, -2.149925, 0, 0, 0, 1, 1,
-1.080962, -0.2956313, -3.166919, 0, 0, 0, 1, 1,
-1.071425, 0.7758483, -2.771107, 0, 0, 0, 1, 1,
-1.067674, 0.6307466, -0.2137912, 0, 0, 0, 1, 1,
-1.063926, 0.1186374, 0.1607195, 0, 0, 0, 1, 1,
-1.063534, 2.293283, 0.8708616, 1, 1, 1, 1, 1,
-1.054155, 0.8868672, -2.047794, 1, 1, 1, 1, 1,
-1.038952, 1.329318, -0.9298117, 1, 1, 1, 1, 1,
-1.037647, 0.532208, 0.1202587, 1, 1, 1, 1, 1,
-1.035538, -0.2558194, -2.412359, 1, 1, 1, 1, 1,
-1.028521, -1.330065, -3.020591, 1, 1, 1, 1, 1,
-1.028359, -0.2182346, -0.5617635, 1, 1, 1, 1, 1,
-1.021417, -0.1763907, -1.46879, 1, 1, 1, 1, 1,
-1.018733, -0.785962, -3.40876, 1, 1, 1, 1, 1,
-1.007209, 0.6074675, -0.7076693, 1, 1, 1, 1, 1,
-1.001518, -0.7470872, -0.5914478, 1, 1, 1, 1, 1,
-1.000421, -1.555787, -4.249116, 1, 1, 1, 1, 1,
-0.999264, -0.8924421, -2.749769, 1, 1, 1, 1, 1,
-0.9989085, 0.6255701, -2.032642, 1, 1, 1, 1, 1,
-0.9971215, 0.2020826, -0.5423747, 1, 1, 1, 1, 1,
-0.9954948, 0.3500005, -1.249157, 0, 0, 1, 1, 1,
-0.9886045, 0.05000146, -0.7259038, 1, 0, 0, 1, 1,
-0.9881847, -0.7431573, -2.994459, 1, 0, 0, 1, 1,
-0.9849054, -1.282738, -0.8900928, 1, 0, 0, 1, 1,
-0.9845149, -0.7433261, -2.742377, 1, 0, 0, 1, 1,
-0.9785767, -0.7460479, -2.630577, 1, 0, 0, 1, 1,
-0.9752981, 1.031136, -2.916689, 0, 0, 0, 1, 1,
-0.9700428, 0.8337383, -2.617895, 0, 0, 0, 1, 1,
-0.9664087, -0.2717505, -3.074606, 0, 0, 0, 1, 1,
-0.9645442, 0.8199804, 0.03747752, 0, 0, 0, 1, 1,
-0.9588351, 0.3132409, -1.206422, 0, 0, 0, 1, 1,
-0.9586458, 0.7939774, 2.121958, 0, 0, 0, 1, 1,
-0.953294, 0.5699717, -1.4945, 0, 0, 0, 1, 1,
-0.9532083, -1.082565, -2.095082, 1, 1, 1, 1, 1,
-0.9518238, -1.756258, -1.083152, 1, 1, 1, 1, 1,
-0.9501187, 2.201377, 1.669254, 1, 1, 1, 1, 1,
-0.9414276, -0.06324847, -1.516779, 1, 1, 1, 1, 1,
-0.9412917, -1.029515, -2.048838, 1, 1, 1, 1, 1,
-0.9405298, 0.3877408, -1.290202, 1, 1, 1, 1, 1,
-0.927205, 0.6659569, -1.991969, 1, 1, 1, 1, 1,
-0.922212, 0.5460147, -3.447536, 1, 1, 1, 1, 1,
-0.9188145, -0.7076278, -2.922301, 1, 1, 1, 1, 1,
-0.9000326, -0.3576892, -1.938434, 1, 1, 1, 1, 1,
-0.8877332, 0.9619995, -1.735367, 1, 1, 1, 1, 1,
-0.8813989, -0.3264351, -2.415878, 1, 1, 1, 1, 1,
-0.8801127, 0.6249434, -1.775608, 1, 1, 1, 1, 1,
-0.8758067, -0.1287698, -0.8498054, 1, 1, 1, 1, 1,
-0.8640275, 0.8335577, -0.3686418, 1, 1, 1, 1, 1,
-0.8603708, 0.1446198, -1.640775, 0, 0, 1, 1, 1,
-0.8557951, 0.5212113, -1.681484, 1, 0, 0, 1, 1,
-0.8538346, 0.5411516, -0.6537985, 1, 0, 0, 1, 1,
-0.8513622, 1.714319, 1.031579, 1, 0, 0, 1, 1,
-0.8498018, -0.5461697, -1.152026, 1, 0, 0, 1, 1,
-0.8496831, -1.217333, -2.586241, 1, 0, 0, 1, 1,
-0.8474978, -0.08358619, -1.587616, 0, 0, 0, 1, 1,
-0.8459234, 0.6049539, -0.180131, 0, 0, 0, 1, 1,
-0.8428748, 0.1749094, -0.06222929, 0, 0, 0, 1, 1,
-0.8313363, 0.03309191, -2.672404, 0, 0, 0, 1, 1,
-0.830174, 0.892222, -0.2277328, 0, 0, 0, 1, 1,
-0.8300968, 1.960965, -0.4207687, 0, 0, 0, 1, 1,
-0.8298811, -0.780651, -4.127619, 0, 0, 0, 1, 1,
-0.8286879, -0.4844173, -1.305238, 1, 1, 1, 1, 1,
-0.8245804, 0.2258422, -0.294741, 1, 1, 1, 1, 1,
-0.8216489, -1.110566, -2.130486, 1, 1, 1, 1, 1,
-0.8208592, 0.153078, -1.351308, 1, 1, 1, 1, 1,
-0.8201565, -2.023625, -4.195866, 1, 1, 1, 1, 1,
-0.8064869, 0.2490752, 1.136096, 1, 1, 1, 1, 1,
-0.800764, -0.4882534, -2.407654, 1, 1, 1, 1, 1,
-0.7991001, 2.236605, -0.4486852, 1, 1, 1, 1, 1,
-0.7986307, -0.02683146, -0.0457568, 1, 1, 1, 1, 1,
-0.7985334, 0.02525192, -0.9693519, 1, 1, 1, 1, 1,
-0.7924278, 0.9104913, -0.4720839, 1, 1, 1, 1, 1,
-0.7903211, -0.8928978, -3.259879, 1, 1, 1, 1, 1,
-0.787803, 0.8240525, -1.999763, 1, 1, 1, 1, 1,
-0.7864468, -2.164977, -0.8154739, 1, 1, 1, 1, 1,
-0.785814, 0.877628, -0.6035668, 1, 1, 1, 1, 1,
-0.7798557, -0.7557099, -1.108027, 0, 0, 1, 1, 1,
-0.7760255, -0.4390937, -3.829875, 1, 0, 0, 1, 1,
-0.7751488, 0.8520975, -1.114214, 1, 0, 0, 1, 1,
-0.7749413, 0.1563301, -1.881763, 1, 0, 0, 1, 1,
-0.7731106, 1.509139, -1.232113, 1, 0, 0, 1, 1,
-0.7688907, -0.1950299, -3.749993, 1, 0, 0, 1, 1,
-0.7656383, -0.6698649, -2.226205, 0, 0, 0, 1, 1,
-0.763587, -0.488497, -3.639696, 0, 0, 0, 1, 1,
-0.7625868, 0.08743169, -1.582394, 0, 0, 0, 1, 1,
-0.749981, -0.7653486, -1.70025, 0, 0, 0, 1, 1,
-0.7455789, 0.6444213, -0.9240137, 0, 0, 0, 1, 1,
-0.7401897, 1.393399, -0.4301873, 0, 0, 0, 1, 1,
-0.7392177, -1.500328, -2.775998, 0, 0, 0, 1, 1,
-0.7384166, -0.6699269, -2.592723, 1, 1, 1, 1, 1,
-0.7294331, -0.3200079, 0.04996995, 1, 1, 1, 1, 1,
-0.7288551, -1.177542, -1.933458, 1, 1, 1, 1, 1,
-0.7204887, -0.1997953, -1.497075, 1, 1, 1, 1, 1,
-0.7168798, -1.060431, -1.949028, 1, 1, 1, 1, 1,
-0.7160664, -0.8702996, -2.235204, 1, 1, 1, 1, 1,
-0.7126468, -0.415316, -1.719561, 1, 1, 1, 1, 1,
-0.7075306, -1.005059, -4.109268, 1, 1, 1, 1, 1,
-0.6877714, 1.103383, -1.051432, 1, 1, 1, 1, 1,
-0.686603, 0.6834329, -1.476512, 1, 1, 1, 1, 1,
-0.6852748, -0.7960398, -1.991242, 1, 1, 1, 1, 1,
-0.6817576, 0.04274916, -0.5730181, 1, 1, 1, 1, 1,
-0.6814643, 0.5942583, -1.208201, 1, 1, 1, 1, 1,
-0.6782092, -0.130431, -0.7433648, 1, 1, 1, 1, 1,
-0.6750045, -0.4100512, -2.65768, 1, 1, 1, 1, 1,
-0.6710741, 0.4582344, -1.093558, 0, 0, 1, 1, 1,
-0.6660884, 0.0577802, -2.55813, 1, 0, 0, 1, 1,
-0.6582651, -0.9648678, -2.177118, 1, 0, 0, 1, 1,
-0.6559271, -0.4119737, -0.1239227, 1, 0, 0, 1, 1,
-0.6556603, 1.108647, 0.03104472, 1, 0, 0, 1, 1,
-0.6530337, 0.08340199, -0.6402842, 1, 0, 0, 1, 1,
-0.6522352, -0.1923766, -1.587423, 0, 0, 0, 1, 1,
-0.6520978, 1.128985, -0.4305049, 0, 0, 0, 1, 1,
-0.6484199, 0.1805466, -0.5253668, 0, 0, 0, 1, 1,
-0.6469427, -0.1595324, -3.296526, 0, 0, 0, 1, 1,
-0.64576, -1.590041, -1.636328, 0, 0, 0, 1, 1,
-0.6456655, -0.5099971, -2.358445, 0, 0, 0, 1, 1,
-0.6348397, 0.1662843, -0.8048503, 0, 0, 0, 1, 1,
-0.6324526, 1.19856, 0.0406318, 1, 1, 1, 1, 1,
-0.6312573, -1.503331, -3.104149, 1, 1, 1, 1, 1,
-0.6302265, -2.188779, -2.68091, 1, 1, 1, 1, 1,
-0.6257358, -1.174075, -2.170084, 1, 1, 1, 1, 1,
-0.6219272, 2.270995, -1.51126, 1, 1, 1, 1, 1,
-0.6191691, 2.134241, -1.032917, 1, 1, 1, 1, 1,
-0.6187589, 0.8836721, -0.08512202, 1, 1, 1, 1, 1,
-0.6175, 1.013573, -1.011185, 1, 1, 1, 1, 1,
-0.6115954, -0.6421295, -1.439571, 1, 1, 1, 1, 1,
-0.6095455, 1.247929, 0.6364556, 1, 1, 1, 1, 1,
-0.6056075, -0.889984, -2.121187, 1, 1, 1, 1, 1,
-0.6042943, -0.7361061, -3.459548, 1, 1, 1, 1, 1,
-0.5988656, -0.8190152, -1.791537, 1, 1, 1, 1, 1,
-0.5972753, 0.5896336, -3.864604, 1, 1, 1, 1, 1,
-0.5918247, 0.3512504, -1.472551, 1, 1, 1, 1, 1,
-0.59152, 0.7723722, -2.215925, 0, 0, 1, 1, 1,
-0.5903247, -0.7607319, -1.526049, 1, 0, 0, 1, 1,
-0.5880291, 0.5986199, 1.093209, 1, 0, 0, 1, 1,
-0.5764596, -0.2176594, -2.664782, 1, 0, 0, 1, 1,
-0.5706586, -1.251704, -2.24884, 1, 0, 0, 1, 1,
-0.5674548, -0.8720827, -2.286381, 1, 0, 0, 1, 1,
-0.5632992, 0.4244184, -1.754506, 0, 0, 0, 1, 1,
-0.5620927, -1.0066, -1.580362, 0, 0, 0, 1, 1,
-0.5593874, 0.2632612, -1.027415, 0, 0, 0, 1, 1,
-0.5547395, 1.315607, -0.39467, 0, 0, 0, 1, 1,
-0.5529066, 0.004784781, -1.169628, 0, 0, 0, 1, 1,
-0.5521417, 1.269023, -1.590502, 0, 0, 0, 1, 1,
-0.5461072, 0.5194603, -0.02653462, 0, 0, 0, 1, 1,
-0.5449234, -0.3879308, -3.458108, 1, 1, 1, 1, 1,
-0.5419143, -0.2356236, -1.645163, 1, 1, 1, 1, 1,
-0.5399216, -0.2016723, -0.7011263, 1, 1, 1, 1, 1,
-0.5275162, -0.00962662, -1.447681, 1, 1, 1, 1, 1,
-0.525596, 0.1439821, -0.970376, 1, 1, 1, 1, 1,
-0.5242729, -0.03834379, -1.471337, 1, 1, 1, 1, 1,
-0.5238549, -0.9976757, -2.496944, 1, 1, 1, 1, 1,
-0.5235397, -0.321108, -1.643595, 1, 1, 1, 1, 1,
-0.5228071, -0.6241432, -3.87668, 1, 1, 1, 1, 1,
-0.5206804, 0.08553821, -1.524537, 1, 1, 1, 1, 1,
-0.5176482, 0.4528804, 0.6742501, 1, 1, 1, 1, 1,
-0.5165533, -0.7879775, -3.511563, 1, 1, 1, 1, 1,
-0.5157648, -1.766687, -3.983708, 1, 1, 1, 1, 1,
-0.5130912, 1.476748, -1.422585, 1, 1, 1, 1, 1,
-0.5121208, -1.889081, -5.117147, 1, 1, 1, 1, 1,
-0.5120164, -1.195711, -3.554677, 0, 0, 1, 1, 1,
-0.5060343, 0.7395743, -0.1207125, 1, 0, 0, 1, 1,
-0.5052965, -0.1592312, -1.307067, 1, 0, 0, 1, 1,
-0.5049891, -0.465976, -1.701873, 1, 0, 0, 1, 1,
-0.499607, 1.169212, -0.5240496, 1, 0, 0, 1, 1,
-0.4939481, 0.7948515, -1.132524, 1, 0, 0, 1, 1,
-0.4916612, -0.728703, -3.685211, 0, 0, 0, 1, 1,
-0.4886923, -1.916087, -3.750639, 0, 0, 0, 1, 1,
-0.4828522, -0.5910407, -3.044439, 0, 0, 0, 1, 1,
-0.4810674, 0.6466863, -0.09011912, 0, 0, 0, 1, 1,
-0.4741814, -1.294616, -1.924749, 0, 0, 0, 1, 1,
-0.4725416, -0.8131628, -2.569974, 0, 0, 0, 1, 1,
-0.4717867, 0.6808873, -2.871413, 0, 0, 0, 1, 1,
-0.4717062, 1.188806, -0.9993222, 1, 1, 1, 1, 1,
-0.4698316, 0.7255046, -1.089272, 1, 1, 1, 1, 1,
-0.4647465, 0.4269426, -1.751412, 1, 1, 1, 1, 1,
-0.463575, -0.45116, -1.268219, 1, 1, 1, 1, 1,
-0.4607612, 2.308769, -1.802223, 1, 1, 1, 1, 1,
-0.4578318, 1.311592, 1.008048, 1, 1, 1, 1, 1,
-0.4553253, -1.263615, -4.275015, 1, 1, 1, 1, 1,
-0.4527463, 0.7590002, -1.725747, 1, 1, 1, 1, 1,
-0.4490706, -1.173612, -2.526783, 1, 1, 1, 1, 1,
-0.447911, 0.1853043, -0.6778787, 1, 1, 1, 1, 1,
-0.4464572, 0.6054215, 0.9336743, 1, 1, 1, 1, 1,
-0.4452553, 2.169842, 1.017423, 1, 1, 1, 1, 1,
-0.4394223, 0.2734032, -0.9631296, 1, 1, 1, 1, 1,
-0.4381899, -1.124399, -2.248994, 1, 1, 1, 1, 1,
-0.4361234, 0.9633532, -1.680133, 1, 1, 1, 1, 1,
-0.4267479, 1.779094, -0.5685498, 0, 0, 1, 1, 1,
-0.4248241, -0.09976739, -1.749575, 1, 0, 0, 1, 1,
-0.4219129, -0.711175, -1.363348, 1, 0, 0, 1, 1,
-0.4214765, 0.343011, 0.5550233, 1, 0, 0, 1, 1,
-0.4206524, -0.7425219, -2.61314, 1, 0, 0, 1, 1,
-0.4168302, -1.25975, -5.386775, 1, 0, 0, 1, 1,
-0.4113959, 1.256624, 0.3489598, 0, 0, 0, 1, 1,
-0.4092577, -0.1070698, -1.991862, 0, 0, 0, 1, 1,
-0.4049737, 0.5889067, -2.118482, 0, 0, 0, 1, 1,
-0.3973219, -1.505305, -2.859653, 0, 0, 0, 1, 1,
-0.3963925, 0.4660766, -0.4763435, 0, 0, 0, 1, 1,
-0.3961858, -0.8567149, -2.197798, 0, 0, 0, 1, 1,
-0.3939675, -1.214344, -2.927992, 0, 0, 0, 1, 1,
-0.3931729, -0.259569, -2.088086, 1, 1, 1, 1, 1,
-0.3924897, 1.445939, 0.1306767, 1, 1, 1, 1, 1,
-0.3901545, -0.6921154, -4.024999, 1, 1, 1, 1, 1,
-0.3890825, -0.7379019, -1.913312, 1, 1, 1, 1, 1,
-0.3890556, -1.328071, -3.098262, 1, 1, 1, 1, 1,
-0.3835823, -0.4679676, -0.8119233, 1, 1, 1, 1, 1,
-0.3823839, -0.2873797, -1.334662, 1, 1, 1, 1, 1,
-0.3809164, -0.4775776, -2.027977, 1, 1, 1, 1, 1,
-0.3767868, -0.8563029, -1.976627, 1, 1, 1, 1, 1,
-0.3732198, -0.0977355, -2.869895, 1, 1, 1, 1, 1,
-0.3726906, 0.9191414, 1.510292, 1, 1, 1, 1, 1,
-0.3695508, 0.3795128, 0.1587465, 1, 1, 1, 1, 1,
-0.3660667, 0.6783745, -1.596273, 1, 1, 1, 1, 1,
-0.3660605, -0.5997456, -2.747578, 1, 1, 1, 1, 1,
-0.3607773, 0.1422958, -0.4878636, 1, 1, 1, 1, 1,
-0.3585799, -1.336787, -2.995351, 0, 0, 1, 1, 1,
-0.3519506, 0.2049193, -1.230754, 1, 0, 0, 1, 1,
-0.3509748, -0.4703483, -2.414575, 1, 0, 0, 1, 1,
-0.3476817, 0.4147052, -1.68785, 1, 0, 0, 1, 1,
-0.3475088, 0.5665078, -0.6868723, 1, 0, 0, 1, 1,
-0.3450635, -0.8065528, -1.746625, 1, 0, 0, 1, 1,
-0.343414, 0.3014876, 0.6855581, 0, 0, 0, 1, 1,
-0.3431436, 0.4381256, 2.020288, 0, 0, 0, 1, 1,
-0.3404886, 0.4377491, -1.961692, 0, 0, 0, 1, 1,
-0.339793, 0.7557194, -1.791985, 0, 0, 0, 1, 1,
-0.3395936, -0.4119015, -2.862077, 0, 0, 0, 1, 1,
-0.338202, -0.3095747, -2.404923, 0, 0, 0, 1, 1,
-0.3351859, 0.5734043, -0.1928336, 0, 0, 0, 1, 1,
-0.331119, 0.1429153, -1.585258, 1, 1, 1, 1, 1,
-0.3270296, -0.7236047, -3.308589, 1, 1, 1, 1, 1,
-0.3257231, 0.3046381, -0.7770075, 1, 1, 1, 1, 1,
-0.3228032, -0.4320956, -2.749062, 1, 1, 1, 1, 1,
-0.3156939, 0.9914394, 0.328828, 1, 1, 1, 1, 1,
-0.2973608, -1.479472, -2.800285, 1, 1, 1, 1, 1,
-0.2956016, 0.9475164, 1.646506, 1, 1, 1, 1, 1,
-0.29515, -0.2321604, -2.452063, 1, 1, 1, 1, 1,
-0.288839, 0.1456899, -0.5018486, 1, 1, 1, 1, 1,
-0.2883222, 0.9919378, 0.1399157, 1, 1, 1, 1, 1,
-0.2863718, -0.8468953, -4.828041, 1, 1, 1, 1, 1,
-0.280255, 1.290171, -0.4339094, 1, 1, 1, 1, 1,
-0.2802, 1.15927, -1.148226, 1, 1, 1, 1, 1,
-0.2788285, -0.6820787, -3.86529, 1, 1, 1, 1, 1,
-0.2786123, -0.4368395, -1.303742, 1, 1, 1, 1, 1,
-0.2758309, 0.873905, -0.04103539, 0, 0, 1, 1, 1,
-0.2740749, -0.452762, -3.047345, 1, 0, 0, 1, 1,
-0.2726945, 0.4977911, 0.6703875, 1, 0, 0, 1, 1,
-0.2726573, -0.9180843, -3.326548, 1, 0, 0, 1, 1,
-0.269464, -0.3396423, -2.785581, 1, 0, 0, 1, 1,
-0.2624094, -0.97065, -3.837835, 1, 0, 0, 1, 1,
-0.2591007, 0.8578421, -0.476743, 0, 0, 0, 1, 1,
-0.2561064, 0.7591828, 0.4605231, 0, 0, 0, 1, 1,
-0.2537623, 0.6500154, 0.3456649, 0, 0, 0, 1, 1,
-0.2524344, -0.8663183, -2.725221, 0, 0, 0, 1, 1,
-0.2509557, -0.6398994, -4.55378, 0, 0, 0, 1, 1,
-0.2452508, 0.01785537, -0.4012131, 0, 0, 0, 1, 1,
-0.2430062, -1.023449, -3.320467, 0, 0, 0, 1, 1,
-0.2426993, 0.2497745, -1.880777, 1, 1, 1, 1, 1,
-0.2390179, -0.8295307, -2.184194, 1, 1, 1, 1, 1,
-0.2383702, 0.8454512, -1.172202, 1, 1, 1, 1, 1,
-0.2368577, 0.03230357, -1.216458, 1, 1, 1, 1, 1,
-0.2359792, 1.619069, 0.6785251, 1, 1, 1, 1, 1,
-0.2275773, -0.9017976, -4.070245, 1, 1, 1, 1, 1,
-0.2224494, 1.174263, 1.128004, 1, 1, 1, 1, 1,
-0.2208652, -0.02925845, -2.636449, 1, 1, 1, 1, 1,
-0.2175657, 0.4147599, 1.055849, 1, 1, 1, 1, 1,
-0.2155357, -0.07170928, -3.793025, 1, 1, 1, 1, 1,
-0.2144824, -1.159977, -0.6640363, 1, 1, 1, 1, 1,
-0.2141691, -0.271165, -1.68351, 1, 1, 1, 1, 1,
-0.2124757, 1.451035, -0.7169188, 1, 1, 1, 1, 1,
-0.2118702, 0.4965585, 0.6327072, 1, 1, 1, 1, 1,
-0.2081693, -0.09710956, -1.983087, 1, 1, 1, 1, 1,
-0.2081018, 0.2767255, 1.35722, 0, 0, 1, 1, 1,
-0.2063442, -0.3438573, -2.266899, 1, 0, 0, 1, 1,
-0.2043313, -0.2063889, -0.09478289, 1, 0, 0, 1, 1,
-0.1998916, 0.9316393, 0.3582546, 1, 0, 0, 1, 1,
-0.1988083, -0.08347134, -1.104971, 1, 0, 0, 1, 1,
-0.1983388, -0.8732351, -3.654158, 1, 0, 0, 1, 1,
-0.1970236, 0.3439112, -2.60451, 0, 0, 0, 1, 1,
-0.1961317, 1.727537, 0.2844647, 0, 0, 0, 1, 1,
-0.1940839, 0.5646409, -0.5432819, 0, 0, 0, 1, 1,
-0.1912608, 2.884884, 0.6146963, 0, 0, 0, 1, 1,
-0.1906347, 1.276434, 0.6030799, 0, 0, 0, 1, 1,
-0.1871284, 0.6352397, 0.3909539, 0, 0, 0, 1, 1,
-0.1870548, -1.390535, -2.868199, 0, 0, 0, 1, 1,
-0.1870112, 1.076475, -0.3673984, 1, 1, 1, 1, 1,
-0.1861012, -1.74382, -1.13117, 1, 1, 1, 1, 1,
-0.1836648, 1.23262, 0.4977525, 1, 1, 1, 1, 1,
-0.1829585, 1.362839, 0.2138447, 1, 1, 1, 1, 1,
-0.1820717, 0.1470437, -0.4843871, 1, 1, 1, 1, 1,
-0.1767885, -1.155862, -1.99743, 1, 1, 1, 1, 1,
-0.1734695, -0.1762626, -1.109449, 1, 1, 1, 1, 1,
-0.1715091, -1.10205, 0.08805627, 1, 1, 1, 1, 1,
-0.1712471, -0.5234489, -2.345684, 1, 1, 1, 1, 1,
-0.1691066, 0.1400084, 0.07941327, 1, 1, 1, 1, 1,
-0.1689198, -1.93994, -2.695221, 1, 1, 1, 1, 1,
-0.1654884, -0.1808252, -2.378577, 1, 1, 1, 1, 1,
-0.1582349, 1.22752, -0.5996672, 1, 1, 1, 1, 1,
-0.1565498, -0.2924257, -3.06266, 1, 1, 1, 1, 1,
-0.1558749, 1.070282, -1.291046, 1, 1, 1, 1, 1,
-0.1543518, -0.9979171, -2.66436, 0, 0, 1, 1, 1,
-0.1531003, -1.313214, -2.813158, 1, 0, 0, 1, 1,
-0.1466144, 0.391663, 0.07373358, 1, 0, 0, 1, 1,
-0.1464625, 0.1488112, -0.8145665, 1, 0, 0, 1, 1,
-0.1363303, 1.553931, -1.419341, 1, 0, 0, 1, 1,
-0.1353478, -2.137602, -3.820449, 1, 0, 0, 1, 1,
-0.1347851, -0.9602731, -2.095773, 0, 0, 0, 1, 1,
-0.1293652, 0.1838459, -0.836811, 0, 0, 0, 1, 1,
-0.1277829, 0.07427043, -2.119355, 0, 0, 0, 1, 1,
-0.1165372, -1.008244, -1.986089, 0, 0, 0, 1, 1,
-0.1129713, 0.4784904, -0.5825745, 0, 0, 0, 1, 1,
-0.1117624, 0.2678715, -0.1365913, 0, 0, 0, 1, 1,
-0.103452, -1.107701, -1.698115, 0, 0, 0, 1, 1,
-0.1026188, -0.03350489, -1.778227, 1, 1, 1, 1, 1,
-0.1005828, -1.168837, -5.670239, 1, 1, 1, 1, 1,
-0.09944034, 3.441706, -0.2182079, 1, 1, 1, 1, 1,
-0.09926578, 1.073807, -0.2757235, 1, 1, 1, 1, 1,
-0.09809493, 0.3121985, -0.2790489, 1, 1, 1, 1, 1,
-0.09322096, 0.6799698, 0.7244127, 1, 1, 1, 1, 1,
-0.09184213, -0.4688339, -1.87988, 1, 1, 1, 1, 1,
-0.08969798, -0.7546599, -4.711404, 1, 1, 1, 1, 1,
-0.08949918, 1.810802, 1.444429, 1, 1, 1, 1, 1,
-0.08608761, -0.3873989, -3.154181, 1, 1, 1, 1, 1,
-0.08246459, 0.2924447, 1.71963, 1, 1, 1, 1, 1,
-0.07866269, -1.192834, -2.268745, 1, 1, 1, 1, 1,
-0.07696605, 0.07287463, 0.1314119, 1, 1, 1, 1, 1,
-0.07487321, -0.8172158, -2.408159, 1, 1, 1, 1, 1,
-0.07423552, -0.8422567, -4.823094, 1, 1, 1, 1, 1,
-0.07207319, 1.837057, -0.9397577, 0, 0, 1, 1, 1,
-0.06899982, 0.1592355, -2.073004, 1, 0, 0, 1, 1,
-0.06888112, 0.2090663, -1.288817, 1, 0, 0, 1, 1,
-0.06840295, -0.8563687, -3.503349, 1, 0, 0, 1, 1,
-0.06222726, -2.52342, -1.832068, 1, 0, 0, 1, 1,
-0.06200062, 0.2668964, -0.3240374, 1, 0, 0, 1, 1,
-0.05979645, -0.4260186, -2.130142, 0, 0, 0, 1, 1,
-0.05859183, 0.09759717, -1.664838, 0, 0, 0, 1, 1,
-0.04562026, 0.3647633, 1.026856, 0, 0, 0, 1, 1,
-0.04472914, -0.09683558, -1.86226, 0, 0, 0, 1, 1,
-0.04110982, -0.3305719, -4.677077, 0, 0, 0, 1, 1,
-0.04094034, -0.09640336, -2.328145, 0, 0, 0, 1, 1,
-0.03907004, 0.1830719, -1.384249, 0, 0, 0, 1, 1,
-0.03748291, -0.5864691, -2.611707, 1, 1, 1, 1, 1,
-0.03702654, -0.01322947, -3.909992, 1, 1, 1, 1, 1,
-0.03493607, -0.3950369, -2.3079, 1, 1, 1, 1, 1,
-0.03359481, -0.03328955, -2.888134, 1, 1, 1, 1, 1,
-0.02720313, 0.2206931, 0.9176902, 1, 1, 1, 1, 1,
-0.02670491, -1.276312, -2.875981, 1, 1, 1, 1, 1,
-0.02555009, 0.2705644, 0.2131497, 1, 1, 1, 1, 1,
-0.01978701, -0.2103244, -1.601372, 1, 1, 1, 1, 1,
-0.01733073, -0.5025281, -3.81345, 1, 1, 1, 1, 1,
-0.01133174, 0.3295988, -1.85965, 1, 1, 1, 1, 1,
-0.003188, -0.896714, -3.713059, 1, 1, 1, 1, 1,
-0.002965496, -0.4968653, -4.120363, 1, 1, 1, 1, 1,
-0.001784676, -0.8213479, -3.455508, 1, 1, 1, 1, 1,
0.002550627, 1.038478, 0.1199704, 1, 1, 1, 1, 1,
0.004179454, -0.2149121, 2.867248, 1, 1, 1, 1, 1,
0.008934876, 0.8696789, 0.09066107, 0, 0, 1, 1, 1,
0.0108285, -0.9203732, 1.084475, 1, 0, 0, 1, 1,
0.01195609, -0.4806349, 3.616349, 1, 0, 0, 1, 1,
0.01316298, -1.330323, 4.472436, 1, 0, 0, 1, 1,
0.01434958, -0.4214821, 2.078602, 1, 0, 0, 1, 1,
0.01619098, -0.03383156, 2.210239, 1, 0, 0, 1, 1,
0.02057545, 0.1380043, -1.767062, 0, 0, 0, 1, 1,
0.02089059, 1.699451, 0.9404892, 0, 0, 0, 1, 1,
0.02880013, 0.678188, 1.781336, 0, 0, 0, 1, 1,
0.03129632, 0.414141, 0.1226233, 0, 0, 0, 1, 1,
0.03285059, 2.223115, 0.870458, 0, 0, 0, 1, 1,
0.03503875, -0.3260508, 4.046035, 0, 0, 0, 1, 1,
0.03905824, 0.3700895, 0.3992036, 0, 0, 0, 1, 1,
0.04298877, 1.077066, 1.502861, 1, 1, 1, 1, 1,
0.04878331, -0.6280512, 5.485543, 1, 1, 1, 1, 1,
0.05307218, 2.017754, 1.040805, 1, 1, 1, 1, 1,
0.05407143, 1.278822, -1.598155, 1, 1, 1, 1, 1,
0.05794457, 0.8403368, 1.232294, 1, 1, 1, 1, 1,
0.06146545, -0.4234367, 3.355536, 1, 1, 1, 1, 1,
0.06367096, -0.1930671, 2.706821, 1, 1, 1, 1, 1,
0.06464624, 0.2984879, -0.05444727, 1, 1, 1, 1, 1,
0.07391522, -1.320537, 4.287559, 1, 1, 1, 1, 1,
0.07562646, -0.5043349, 1.147222, 1, 1, 1, 1, 1,
0.07738157, 0.8593023, 1.106718, 1, 1, 1, 1, 1,
0.08014613, -0.2160252, 2.563047, 1, 1, 1, 1, 1,
0.08345174, -0.0595593, 2.904487, 1, 1, 1, 1, 1,
0.08545285, 0.2127723, 0.6532339, 1, 1, 1, 1, 1,
0.08875817, 0.3170913, -1.39455, 1, 1, 1, 1, 1,
0.08890802, -0.2445376, 3.252933, 0, 0, 1, 1, 1,
0.09162457, 1.544706, -0.128133, 1, 0, 0, 1, 1,
0.0929314, -1.312473, 3.208154, 1, 0, 0, 1, 1,
0.09722453, 1.273086, 0.01441688, 1, 0, 0, 1, 1,
0.106907, -0.5258373, 2.503962, 1, 0, 0, 1, 1,
0.1089425, -0.6451017, 3.376564, 1, 0, 0, 1, 1,
0.1126553, 1.517109, -1.540057, 0, 0, 0, 1, 1,
0.1127452, 0.07198749, -0.09866557, 0, 0, 0, 1, 1,
0.113816, -0.7043169, 3.065334, 0, 0, 0, 1, 1,
0.1141128, -3.006626, 2.608238, 0, 0, 0, 1, 1,
0.1175354, 0.8406152, 1.905585, 0, 0, 0, 1, 1,
0.1176894, -0.5258669, 2.834901, 0, 0, 0, 1, 1,
0.1227301, 1.106251, -0.2031661, 0, 0, 0, 1, 1,
0.1244663, 0.1145473, 1.210285, 1, 1, 1, 1, 1,
0.1258474, -0.8261127, 3.297794, 1, 1, 1, 1, 1,
0.1284705, 0.7910724, -0.6840969, 1, 1, 1, 1, 1,
0.1294859, -1.085731, 3.192454, 1, 1, 1, 1, 1,
0.1328938, 1.111294, 1.252104, 1, 1, 1, 1, 1,
0.1372706, 0.03795008, 0.2498943, 1, 1, 1, 1, 1,
0.1390301, 0.04853708, 2.292032, 1, 1, 1, 1, 1,
0.1393006, -1.369068, 3.245683, 1, 1, 1, 1, 1,
0.1424816, 0.7013459, -0.01405791, 1, 1, 1, 1, 1,
0.1462924, 0.8296476, 1.030994, 1, 1, 1, 1, 1,
0.1470272, 0.1088426, -0.1884624, 1, 1, 1, 1, 1,
0.1493235, 1.241122, 0.3281126, 1, 1, 1, 1, 1,
0.1517781, -0.3032651, 3.077641, 1, 1, 1, 1, 1,
0.153127, 0.6581509, -0.5674343, 1, 1, 1, 1, 1,
0.1615383, -0.5791011, 3.022237, 1, 1, 1, 1, 1,
0.1808091, 0.6955058, -0.7048223, 0, 0, 1, 1, 1,
0.1845591, 0.684225, -0.5336248, 1, 0, 0, 1, 1,
0.1853362, -0.09289579, 1.878092, 1, 0, 0, 1, 1,
0.1872248, 1.125105, -0.1484656, 1, 0, 0, 1, 1,
0.1872401, -0.7002779, 3.60658, 1, 0, 0, 1, 1,
0.1899502, 0.2121657, 1.453195, 1, 0, 0, 1, 1,
0.1905121, -0.2835552, 2.867429, 0, 0, 0, 1, 1,
0.1911943, 1.143766, -0.4119313, 0, 0, 0, 1, 1,
0.197248, 0.7328762, 0.3322113, 0, 0, 0, 1, 1,
0.2001705, -1.118224, 1.862879, 0, 0, 0, 1, 1,
0.2013771, 0.2106716, 0.443204, 0, 0, 0, 1, 1,
0.2119156, -0.5012719, 3.31044, 0, 0, 0, 1, 1,
0.2120177, -0.335148, 3.547464, 0, 0, 0, 1, 1,
0.2149367, -0.9896405, 4.29341, 1, 1, 1, 1, 1,
0.2191223, -1.152481, 2.591372, 1, 1, 1, 1, 1,
0.2221137, 1.129189, 1.423717, 1, 1, 1, 1, 1,
0.2279804, 0.2478439, 0.472853, 1, 1, 1, 1, 1,
0.2326442, 1.018517, -0.8271485, 1, 1, 1, 1, 1,
0.2334101, -0.1069491, 3.331664, 1, 1, 1, 1, 1,
0.2382588, -1.49203, 2.563918, 1, 1, 1, 1, 1,
0.2382623, -2.148772, 1.407346, 1, 1, 1, 1, 1,
0.2383109, 0.3143501, -1.13033, 1, 1, 1, 1, 1,
0.2439116, 2.211781, -0.9285498, 1, 1, 1, 1, 1,
0.2470421, -0.1008297, 1.327535, 1, 1, 1, 1, 1,
0.2474289, -0.3244125, 2.155278, 1, 1, 1, 1, 1,
0.2485361, 0.3461612, -1.446545, 1, 1, 1, 1, 1,
0.2487246, 0.4156248, -1.420422, 1, 1, 1, 1, 1,
0.2547853, 0.199864, 1.589314, 1, 1, 1, 1, 1,
0.257016, -0.1442659, 1.458179, 0, 0, 1, 1, 1,
0.2602881, 0.6976674, -0.5582941, 1, 0, 0, 1, 1,
0.262416, -0.7532482, 0.2880693, 1, 0, 0, 1, 1,
0.2631567, -0.3407117, 3.194131, 1, 0, 0, 1, 1,
0.2646633, 0.02728227, 1.815232, 1, 0, 0, 1, 1,
0.267474, -0.3867032, 1.822801, 1, 0, 0, 1, 1,
0.2688854, 1.047143, -0.9083993, 0, 0, 0, 1, 1,
0.2695021, -0.357999, 1.812651, 0, 0, 0, 1, 1,
0.2715625, 0.3124731, -0.07835086, 0, 0, 0, 1, 1,
0.2719124, 1.633194, -0.1028626, 0, 0, 0, 1, 1,
0.2729775, 0.7052518, 0.8313348, 0, 0, 0, 1, 1,
0.2738365, 0.04152627, 0.3004265, 0, 0, 0, 1, 1,
0.2748534, -0.2582977, 3.259316, 0, 0, 0, 1, 1,
0.2762682, 1.34253, 1.112513, 1, 1, 1, 1, 1,
0.2764927, 0.9436815, -2.098364, 1, 1, 1, 1, 1,
0.2775607, -0.1033354, 1.773196, 1, 1, 1, 1, 1,
0.2792753, 2.140251, -0.8242781, 1, 1, 1, 1, 1,
0.2805056, -0.5518288, 2.288265, 1, 1, 1, 1, 1,
0.2837548, -0.2004417, 0.9171586, 1, 1, 1, 1, 1,
0.2848504, -1.071369, 3.575499, 1, 1, 1, 1, 1,
0.2854427, -1.168106, 3.852853, 1, 1, 1, 1, 1,
0.2925989, -0.9733186, 2.205209, 1, 1, 1, 1, 1,
0.296571, -0.6858858, 3.934232, 1, 1, 1, 1, 1,
0.2971847, -0.3060815, 1.508014, 1, 1, 1, 1, 1,
0.3018574, 0.310981, 2.172499, 1, 1, 1, 1, 1,
0.3044633, -1.351575, 1.83015, 1, 1, 1, 1, 1,
0.3051871, -1.660481, 2.193223, 1, 1, 1, 1, 1,
0.3086819, 0.9959018, 0.1210017, 1, 1, 1, 1, 1,
0.3116357, -1.693645, 1.308155, 0, 0, 1, 1, 1,
0.3143168, -0.5516669, 1.309116, 1, 0, 0, 1, 1,
0.3165578, -0.610461, 4.574076, 1, 0, 0, 1, 1,
0.3177976, -0.4973109, 1.048922, 1, 0, 0, 1, 1,
0.3186684, -0.2768932, 2.245791, 1, 0, 0, 1, 1,
0.3211375, -0.4581308, 1.333583, 1, 0, 0, 1, 1,
0.3241285, -1.403034, 2.748881, 0, 0, 0, 1, 1,
0.3262158, 0.7159523, 0.3162098, 0, 0, 0, 1, 1,
0.3314092, 0.816348, 1.829562, 0, 0, 0, 1, 1,
0.3320652, -2.573892, 4.492066, 0, 0, 0, 1, 1,
0.3323931, 0.6749285, 0.9827523, 0, 0, 0, 1, 1,
0.3355424, 0.655563, 2.165381, 0, 0, 0, 1, 1,
0.3357072, 0.24107, 1.458503, 0, 0, 0, 1, 1,
0.3377018, 1.542034, 0.1906962, 1, 1, 1, 1, 1,
0.3422297, -0.9102875, 3.088635, 1, 1, 1, 1, 1,
0.3422313, 0.8842134, -0.3424291, 1, 1, 1, 1, 1,
0.3444592, -0.6520255, 3.333192, 1, 1, 1, 1, 1,
0.3450981, -0.9841068, 3.266718, 1, 1, 1, 1, 1,
0.358152, 2.241628, -0.5841289, 1, 1, 1, 1, 1,
0.3622449, 2.352929, -0.2641911, 1, 1, 1, 1, 1,
0.365441, 1.434175, 0.9183537, 1, 1, 1, 1, 1,
0.3665824, 0.5257762, 0.762656, 1, 1, 1, 1, 1,
0.3701209, 0.06647728, 0.8964695, 1, 1, 1, 1, 1,
0.3701418, 0.8422273, 1.380706, 1, 1, 1, 1, 1,
0.3744612, 0.1595512, 1.856616, 1, 1, 1, 1, 1,
0.3931544, -0.1635534, 1.737253, 1, 1, 1, 1, 1,
0.3931636, 0.7597491, 0.3068542, 1, 1, 1, 1, 1,
0.3955165, -0.06900629, 1.838401, 1, 1, 1, 1, 1,
0.3994724, -0.2434244, 1.344448, 0, 0, 1, 1, 1,
0.4040079, 0.6494206, -1.198319, 1, 0, 0, 1, 1,
0.4044922, -1.389949, 2.991166, 1, 0, 0, 1, 1,
0.4047073, -0.4016762, 1.94868, 1, 0, 0, 1, 1,
0.4068456, -0.9414064, 2.396829, 1, 0, 0, 1, 1,
0.4096279, 0.3606756, 1.321941, 1, 0, 0, 1, 1,
0.4107544, 0.5720727, -0.3629923, 0, 0, 0, 1, 1,
0.4128989, 0.6285295, 1.55812, 0, 0, 0, 1, 1,
0.414108, 0.2965678, -0.6545144, 0, 0, 0, 1, 1,
0.4149861, -0.2694531, 3.55209, 0, 0, 0, 1, 1,
0.4197897, -0.5718002, 3.68393, 0, 0, 0, 1, 1,
0.4268441, -0.9242083, 3.782813, 0, 0, 0, 1, 1,
0.4285725, 0.2699502, 1.027997, 0, 0, 0, 1, 1,
0.4303007, 1.135541, -0.222467, 1, 1, 1, 1, 1,
0.4364301, 0.0743153, 3.489719, 1, 1, 1, 1, 1,
0.4428309, -0.1313069, 1.376256, 1, 1, 1, 1, 1,
0.4503389, 0.9219698, 0.07330706, 1, 1, 1, 1, 1,
0.4509999, 0.002607897, 1.064061, 1, 1, 1, 1, 1,
0.4517586, -1.593091, 2.903606, 1, 1, 1, 1, 1,
0.4553123, -0.1317192, 2.401328, 1, 1, 1, 1, 1,
0.4562775, 0.8690593, -1.575364, 1, 1, 1, 1, 1,
0.4597548, -0.08531903, -0.3787937, 1, 1, 1, 1, 1,
0.4615995, 0.1693671, 0.7609864, 1, 1, 1, 1, 1,
0.4636507, 1.348424, -0.5787992, 1, 1, 1, 1, 1,
0.4645614, 0.09028489, 0.4269745, 1, 1, 1, 1, 1,
0.4682536, 1.106243, -0.7967175, 1, 1, 1, 1, 1,
0.4683348, -0.8861027, 3.397398, 1, 1, 1, 1, 1,
0.4686011, 1.179596, -0.4051439, 1, 1, 1, 1, 1,
0.4696993, -1.092747, 3.122481, 0, 0, 1, 1, 1,
0.4720291, -1.340034, 2.234221, 1, 0, 0, 1, 1,
0.4757278, -0.9761193, 3.343309, 1, 0, 0, 1, 1,
0.4774599, 0.9820052, 0.4433126, 1, 0, 0, 1, 1,
0.4793668, -0.7539437, 0.192655, 1, 0, 0, 1, 1,
0.4851071, 0.6560149, 0.2674822, 1, 0, 0, 1, 1,
0.4866715, -0.1984708, 0.5071116, 0, 0, 0, 1, 1,
0.4880001, 0.7705395, -0.5370038, 0, 0, 0, 1, 1,
0.4940581, 1.592472, 0.08275748, 0, 0, 0, 1, 1,
0.4940894, 1.401774, -0.1762346, 0, 0, 0, 1, 1,
0.4949502, 1.803147, 0.09518413, 0, 0, 0, 1, 1,
0.4954723, 0.5535005, 1.306713, 0, 0, 0, 1, 1,
0.4993021, -1.352878, 2.669124, 0, 0, 0, 1, 1,
0.5019611, 0.6349199, 0.3518659, 1, 1, 1, 1, 1,
0.5020378, -1.458459, 2.340107, 1, 1, 1, 1, 1,
0.5027547, 0.7333713, 0.1627413, 1, 1, 1, 1, 1,
0.5053533, -0.005341376, 1.131375, 1, 1, 1, 1, 1,
0.5054929, 0.2571, 1.257148, 1, 1, 1, 1, 1,
0.5075699, 0.2180328, 0.8424718, 1, 1, 1, 1, 1,
0.5133159, 0.3891256, 1.60668, 1, 1, 1, 1, 1,
0.5167655, 0.3034485, 0.2947712, 1, 1, 1, 1, 1,
0.5172395, -0.2482013, 1.767699, 1, 1, 1, 1, 1,
0.5175983, 0.5486336, 1.120337, 1, 1, 1, 1, 1,
0.5210426, 0.8295293, 0.987818, 1, 1, 1, 1, 1,
0.5238373, -1.148967, 1.842433, 1, 1, 1, 1, 1,
0.5264724, -1.244439, 3.215795, 1, 1, 1, 1, 1,
0.5267047, 0.1731618, 1.047569, 1, 1, 1, 1, 1,
0.5273528, -0.9022488, 3.673307, 1, 1, 1, 1, 1,
0.5293711, -0.594922, 1.293547, 0, 0, 1, 1, 1,
0.5294086, 1.122259, 0.6956455, 1, 0, 0, 1, 1,
0.5346557, -0.5681408, 2.942858, 1, 0, 0, 1, 1,
0.5393524, 0.09635098, 2.587686, 1, 0, 0, 1, 1,
0.5406118, -0.70469, 2.704181, 1, 0, 0, 1, 1,
0.5424425, 1.514229, -0.3414498, 1, 0, 0, 1, 1,
0.5487037, -0.3618909, 0.9172779, 0, 0, 0, 1, 1,
0.5507534, 1.611235, -2.029579, 0, 0, 0, 1, 1,
0.5527697, 0.1070888, 1.139283, 0, 0, 0, 1, 1,
0.5593265, -1.665424, 2.929417, 0, 0, 0, 1, 1,
0.5609275, 0.6033522, 0.5622492, 0, 0, 0, 1, 1,
0.5649351, -0.05325329, 3.309762, 0, 0, 0, 1, 1,
0.5673747, -0.6512334, 3.450279, 0, 0, 0, 1, 1,
0.5675494, 0.9181776, 1.509645, 1, 1, 1, 1, 1,
0.5735046, -0.3131639, 1.742255, 1, 1, 1, 1, 1,
0.5743575, 0.08771938, 1.804008, 1, 1, 1, 1, 1,
0.5755105, 0.1329697, 1.728556, 1, 1, 1, 1, 1,
0.5760903, 0.3026859, -0.662895, 1, 1, 1, 1, 1,
0.5770375, -0.3743229, 1.531557, 1, 1, 1, 1, 1,
0.5781174, -0.8787332, 3.384903, 1, 1, 1, 1, 1,
0.5788492, 0.2371014, 1.901265, 1, 1, 1, 1, 1,
0.5851868, -0.3312502, 1.935542, 1, 1, 1, 1, 1,
0.5857993, -0.7651195, 2.065561, 1, 1, 1, 1, 1,
0.5870799, 1.002494, 0.6245395, 1, 1, 1, 1, 1,
0.5886292, -0.2257851, 1.961343, 1, 1, 1, 1, 1,
0.5984997, -0.4517057, 3.078287, 1, 1, 1, 1, 1,
0.6020806, 1.341833, 2.009189, 1, 1, 1, 1, 1,
0.6022925, -1.863579, 1.07556, 1, 1, 1, 1, 1,
0.60353, -0.06129195, 1.869856, 0, 0, 1, 1, 1,
0.6131096, -1.408874, 3.090395, 1, 0, 0, 1, 1,
0.6170619, 0.6976722, 2.625222, 1, 0, 0, 1, 1,
0.6178132, -2.35171, 0.7043363, 1, 0, 0, 1, 1,
0.6212406, 0.4287983, 2.074419, 1, 0, 0, 1, 1,
0.6235343, -0.4437668, 4.795612, 1, 0, 0, 1, 1,
0.6236916, 0.7370242, -0.1968199, 0, 0, 0, 1, 1,
0.6291682, 0.4831957, 0.7005204, 0, 0, 0, 1, 1,
0.6393396, 0.2507109, 0.5769605, 0, 0, 0, 1, 1,
0.644713, 0.8177038, 0.6069264, 0, 0, 0, 1, 1,
0.6454785, 2.801361, -0.2803077, 0, 0, 0, 1, 1,
0.6460506, -1.135967, 3.019083, 0, 0, 0, 1, 1,
0.652894, -0.6754724, 1.743839, 0, 0, 0, 1, 1,
0.6532906, -1.123371, 3.739149, 1, 1, 1, 1, 1,
0.6614666, -0.5814088, 2.585842, 1, 1, 1, 1, 1,
0.6700816, 1.358911, -0.7953085, 1, 1, 1, 1, 1,
0.6759107, -0.593716, 2.053903, 1, 1, 1, 1, 1,
0.6774821, 0.48721, 2.845409, 1, 1, 1, 1, 1,
0.6785448, 0.06702277, 0.7982279, 1, 1, 1, 1, 1,
0.679189, 0.6723516, 2.258571, 1, 1, 1, 1, 1,
0.6885707, 0.906496, 1.501397, 1, 1, 1, 1, 1,
0.6961431, 0.2480471, 1.58756, 1, 1, 1, 1, 1,
0.6994566, 0.2325512, 1.368438, 1, 1, 1, 1, 1,
0.7016135, 0.8674239, 1.453688, 1, 1, 1, 1, 1,
0.7068474, -2.021823, 1.473173, 1, 1, 1, 1, 1,
0.7107251, 0.5225626, 2.269072, 1, 1, 1, 1, 1,
0.7182419, 1.178649, -0.1813171, 1, 1, 1, 1, 1,
0.723979, 0.5629779, 0.7637823, 1, 1, 1, 1, 1,
0.7273341, 0.1549942, 1.555549, 0, 0, 1, 1, 1,
0.7296066, 0.838932, 0.3291584, 1, 0, 0, 1, 1,
0.7306964, 0.1488599, 1.448942, 1, 0, 0, 1, 1,
0.7309842, -1.832181, 1.43576, 1, 0, 0, 1, 1,
0.7330214, -0.2991164, 1.567305, 1, 0, 0, 1, 1,
0.7364364, -1.901508, 3.086445, 1, 0, 0, 1, 1,
0.7378296, -0.9641345, 2.355881, 0, 0, 0, 1, 1,
0.7383174, 1.705723, -0.4004838, 0, 0, 0, 1, 1,
0.7435649, 0.3799398, 1.473931, 0, 0, 0, 1, 1,
0.7480608, 2.610363, 0.6661062, 0, 0, 0, 1, 1,
0.7509966, -0.415393, 0.951813, 0, 0, 0, 1, 1,
0.7532787, 0.4637743, -0.5314942, 0, 0, 0, 1, 1,
0.7573793, 0.3426321, 1.509033, 0, 0, 0, 1, 1,
0.7580593, -1.238017, 2.551601, 1, 1, 1, 1, 1,
0.7606815, 0.01878908, 0.1982061, 1, 1, 1, 1, 1,
0.7710124, -0.07247655, 1.174684, 1, 1, 1, 1, 1,
0.7726175, 0.8009396, 2.121949, 1, 1, 1, 1, 1,
0.7753735, 0.9837343, 0.4457856, 1, 1, 1, 1, 1,
0.7757376, -1.988808, 0.9048702, 1, 1, 1, 1, 1,
0.7762449, 0.2887034, 1.360626, 1, 1, 1, 1, 1,
0.7762602, 0.6556554, 1.508003, 1, 1, 1, 1, 1,
0.7795016, -0.2219549, 0.6753463, 1, 1, 1, 1, 1,
0.7801215, -1.177082, 2.087853, 1, 1, 1, 1, 1,
0.7826204, -0.5517613, 1.991271, 1, 1, 1, 1, 1,
0.7827733, 0.3674265, 0.9734593, 1, 1, 1, 1, 1,
0.7898863, -0.984455, 3.133139, 1, 1, 1, 1, 1,
0.791244, 0.07690953, 1.492204, 1, 1, 1, 1, 1,
0.7938009, -0.3426577, 2.043803, 1, 1, 1, 1, 1,
0.7940223, 1.18243, 0.04235174, 0, 0, 1, 1, 1,
0.7958148, 0.4060416, 0.3190106, 1, 0, 0, 1, 1,
0.7981378, 0.5915239, 2.253644, 1, 0, 0, 1, 1,
0.7984002, 0.1562367, 1.682022, 1, 0, 0, 1, 1,
0.8070233, -1.26442, 0.2185133, 1, 0, 0, 1, 1,
0.8094114, 0.5983112, 2.503646, 1, 0, 0, 1, 1,
0.8098688, 1.644951, 0.3167243, 0, 0, 0, 1, 1,
0.8124265, 0.9007838, 0.6816415, 0, 0, 0, 1, 1,
0.8162518, -0.644843, 2.593177, 0, 0, 0, 1, 1,
0.8170724, -1.213753, 0.3724755, 0, 0, 0, 1, 1,
0.821736, -0.434699, 3.027678, 0, 0, 0, 1, 1,
0.8239166, 0.2194559, 0.421762, 0, 0, 0, 1, 1,
0.824151, 1.257359, 0.462671, 0, 0, 0, 1, 1,
0.8311741, -0.8497861, 3.454494, 1, 1, 1, 1, 1,
0.8338029, 0.6761216, 2.255881, 1, 1, 1, 1, 1,
0.8350453, -1.546812, 2.230545, 1, 1, 1, 1, 1,
0.8357187, -2.323072, 1.929292, 1, 1, 1, 1, 1,
0.8387777, -0.6834126, 1.773946, 1, 1, 1, 1, 1,
0.8407542, 1.403266, 0.0568013, 1, 1, 1, 1, 1,
0.8416946, -0.1284007, 1.835655, 1, 1, 1, 1, 1,
0.842842, -0.6078617, 1.220923, 1, 1, 1, 1, 1,
0.8493661, 0.1104172, 2.943009, 1, 1, 1, 1, 1,
0.8550634, -1.284819, 1.826775, 1, 1, 1, 1, 1,
0.855074, -0.6876501, 2.627031, 1, 1, 1, 1, 1,
0.8631773, 0.3964213, 0.9018904, 1, 1, 1, 1, 1,
0.8643618, 2.033002, 0.4990369, 1, 1, 1, 1, 1,
0.8758269, 0.1062336, 0.728276, 1, 1, 1, 1, 1,
0.8853841, -0.9365465, 1.661016, 1, 1, 1, 1, 1,
0.8862517, -0.4200836, 2.291144, 0, 0, 1, 1, 1,
0.8888302, 0.9390917, -0.7217379, 1, 0, 0, 1, 1,
0.8989002, -0.361821, 3.425142, 1, 0, 0, 1, 1,
0.9021406, -0.07087261, 0.3451249, 1, 0, 0, 1, 1,
0.9144771, -1.028306, 3.551777, 1, 0, 0, 1, 1,
0.914847, -1.038849, 1.311357, 1, 0, 0, 1, 1,
0.9248465, -0.2407266, 2.228663, 0, 0, 0, 1, 1,
0.9290456, 0.5099965, 0.9852112, 0, 0, 0, 1, 1,
0.9305373, 0.07463031, 1.306857, 0, 0, 0, 1, 1,
0.9335985, -1.093078, 2.195365, 0, 0, 0, 1, 1,
0.9352292, -1.250003, 4.227918, 0, 0, 0, 1, 1,
0.9428805, 1.488379, 0.8374439, 0, 0, 0, 1, 1,
0.9456409, -1.534257, 1.982924, 0, 0, 0, 1, 1,
0.9470435, -1.25386, 1.580172, 1, 1, 1, 1, 1,
0.9475188, -0.4772405, 3.322132, 1, 1, 1, 1, 1,
0.9506768, -0.3920875, 3.180271, 1, 1, 1, 1, 1,
0.9516025, 1.47051, 0.8419417, 1, 1, 1, 1, 1,
0.9596997, 1.400242, -0.3939138, 1, 1, 1, 1, 1,
0.9628205, -0.006499161, 2.514974, 1, 1, 1, 1, 1,
0.9666249, 1.277195, -0.04666839, 1, 1, 1, 1, 1,
0.9722159, 0.7403306, 1.414802, 1, 1, 1, 1, 1,
0.9740108, 1.664144, -1.889745, 1, 1, 1, 1, 1,
0.9753077, -1.019529, 3.438969, 1, 1, 1, 1, 1,
0.978815, -1.468726, 2.749827, 1, 1, 1, 1, 1,
0.9917973, -0.5328038, 2.39372, 1, 1, 1, 1, 1,
0.994812, 0.9396011, 0.598882, 1, 1, 1, 1, 1,
1.004319, 0.2652627, 0.8426751, 1, 1, 1, 1, 1,
1.007485, 0.7167044, -0.1882735, 1, 1, 1, 1, 1,
1.011574, -1.460973, 3.709483, 0, 0, 1, 1, 1,
1.015011, -1.181378, 2.162453, 1, 0, 0, 1, 1,
1.018327, -0.5976539, 3.292129, 1, 0, 0, 1, 1,
1.018345, 0.8571463, 1.409304, 1, 0, 0, 1, 1,
1.019777, -0.003090162, 1.340769, 1, 0, 0, 1, 1,
1.024827, -0.1429491, 2.650409, 1, 0, 0, 1, 1,
1.024924, 0.6179446, 0.2863135, 0, 0, 0, 1, 1,
1.032952, 0.9627573, 0.01482106, 0, 0, 0, 1, 1,
1.037395, 0.1061136, 0.4064795, 0, 0, 0, 1, 1,
1.043474, -1.381607, 3.480309, 0, 0, 0, 1, 1,
1.048841, -0.7323806, 2.082705, 0, 0, 0, 1, 1,
1.054398, -1.154592, 3.262533, 0, 0, 0, 1, 1,
1.054962, -0.9634182, 0.8335471, 0, 0, 0, 1, 1,
1.055538, 0.6559476, 2.554498, 1, 1, 1, 1, 1,
1.059221, -0.2607076, 1.551429, 1, 1, 1, 1, 1,
1.061307, 0.1119646, 0.8369928, 1, 1, 1, 1, 1,
1.072747, 0.1212328, 1.231367, 1, 1, 1, 1, 1,
1.074249, -1.096635, 3.009558, 1, 1, 1, 1, 1,
1.075887, 0.6361084, 1.365621, 1, 1, 1, 1, 1,
1.079932, -0.1832241, -0.3153548, 1, 1, 1, 1, 1,
1.083375, 1.03048, 1.853778, 1, 1, 1, 1, 1,
1.084399, -0.9404792, 2.317994, 1, 1, 1, 1, 1,
1.107139, -0.625599, 2.092938, 1, 1, 1, 1, 1,
1.11021, 0.6909975, 0.682141, 1, 1, 1, 1, 1,
1.11767, -0.1506844, 1.317818, 1, 1, 1, 1, 1,
1.121241, -0.8943306, 3.153102, 1, 1, 1, 1, 1,
1.123266, 0.5241212, -0.5020454, 1, 1, 1, 1, 1,
1.128889, 1.975968, 2.22754, 1, 1, 1, 1, 1,
1.139172, 0.2991415, -0.2416266, 0, 0, 1, 1, 1,
1.147527, 0.5674124, 1.239168, 1, 0, 0, 1, 1,
1.152955, -0.03992099, 2.633033, 1, 0, 0, 1, 1,
1.156688, 1.340738, 1.376513, 1, 0, 0, 1, 1,
1.157237, 1.674614, -1.013721, 1, 0, 0, 1, 1,
1.162685, 0.6473576, 0.9954937, 1, 0, 0, 1, 1,
1.166762, 0.7397233, 2.465112, 0, 0, 0, 1, 1,
1.167242, 1.392343, 0.977118, 0, 0, 0, 1, 1,
1.167471, 0.007550728, 0.04406729, 0, 0, 0, 1, 1,
1.174769, -0.9915895, 3.502636, 0, 0, 0, 1, 1,
1.181155, 0.0310538, 2.827652, 0, 0, 0, 1, 1,
1.182483, 1.103313, 0.8150195, 0, 0, 0, 1, 1,
1.18548, -3.278538, 0.9996314, 0, 0, 0, 1, 1,
1.194018, 0.08048633, 2.537915, 1, 1, 1, 1, 1,
1.200197, -0.3180426, 1.057354, 1, 1, 1, 1, 1,
1.206672, 1.121272, 0.2921012, 1, 1, 1, 1, 1,
1.216303, 0.6297165, 0.1024673, 1, 1, 1, 1, 1,
1.222598, 0.1023379, 2.366013, 1, 1, 1, 1, 1,
1.22406, -0.197284, 1.792539, 1, 1, 1, 1, 1,
1.228818, 0.5285749, 0.3715739, 1, 1, 1, 1, 1,
1.235377, 0.1907165, 3.051056, 1, 1, 1, 1, 1,
1.235624, -0.9022376, 3.830731, 1, 1, 1, 1, 1,
1.237373, 0.1894066, -0.2088756, 1, 1, 1, 1, 1,
1.243751, -0.3645056, 0.639123, 1, 1, 1, 1, 1,
1.248149, -0.7348991, 1.889639, 1, 1, 1, 1, 1,
1.250424, 2.013524, -0.1011196, 1, 1, 1, 1, 1,
1.265984, 0.1463655, 0.3794199, 1, 1, 1, 1, 1,
1.278985, -0.2383763, 2.713071, 1, 1, 1, 1, 1,
1.28168, 1.072611, 2.076611, 0, 0, 1, 1, 1,
1.283674, -2.049984, 2.35768, 1, 0, 0, 1, 1,
1.284061, -0.3337252, 2.685026, 1, 0, 0, 1, 1,
1.284924, -0.8539857, 1.62011, 1, 0, 0, 1, 1,
1.287227, 0.5695328, 1.469259, 1, 0, 0, 1, 1,
1.29125, 1.485661, -1.381678, 1, 0, 0, 1, 1,
1.294928, 0.1618618, 2.377145, 0, 0, 0, 1, 1,
1.309117, 1.087589, 0.1851059, 0, 0, 0, 1, 1,
1.309951, -0.1857934, 2.239371, 0, 0, 0, 1, 1,
1.312396, 0.3075908, 0.1143535, 0, 0, 0, 1, 1,
1.314791, -1.062992, 3.078284, 0, 0, 0, 1, 1,
1.321938, 0.420568, 0.3176714, 0, 0, 0, 1, 1,
1.32619, 0.5520753, 1.859327, 0, 0, 0, 1, 1,
1.329779, -0.04809136, 1.603372, 1, 1, 1, 1, 1,
1.329982, -0.3428073, 2.036862, 1, 1, 1, 1, 1,
1.336076, -0.7585346, 0.9582476, 1, 1, 1, 1, 1,
1.344745, 0.2783237, 1.645512, 1, 1, 1, 1, 1,
1.345559, 0.1949751, 1.884066, 1, 1, 1, 1, 1,
1.347316, -0.3682859, 0.9546641, 1, 1, 1, 1, 1,
1.352872, 0.38486, 1.388659, 1, 1, 1, 1, 1,
1.35897, 0.9190779, 1.681972, 1, 1, 1, 1, 1,
1.380503, 0.1628005, 3.118612, 1, 1, 1, 1, 1,
1.391126, -0.3637557, 1.243259, 1, 1, 1, 1, 1,
1.411351, 0.8132879, 1.150029, 1, 1, 1, 1, 1,
1.413099, 1.189474, 1.300166, 1, 1, 1, 1, 1,
1.440247, 1.436562, 0.3763874, 1, 1, 1, 1, 1,
1.445046, -0.5621837, 2.5201, 1, 1, 1, 1, 1,
1.45005, 0.1659713, 0.8114341, 1, 1, 1, 1, 1,
1.450716, -0.908299, 3.342289, 0, 0, 1, 1, 1,
1.452008, 1.788563, 1.480932, 1, 0, 0, 1, 1,
1.458776, -0.2883487, 0.193633, 1, 0, 0, 1, 1,
1.472603, -0.2842269, 1.729528, 1, 0, 0, 1, 1,
1.499607, 0.8076147, -0.3471976, 1, 0, 0, 1, 1,
1.507657, -0.3982024, 0.2382623, 1, 0, 0, 1, 1,
1.521059, 0.3589531, 0.7261643, 0, 0, 0, 1, 1,
1.526598, 0.7705467, 1.577867, 0, 0, 0, 1, 1,
1.534271, -1.301439, 2.965749, 0, 0, 0, 1, 1,
1.550684, -1.717001, 3.111669, 0, 0, 0, 1, 1,
1.567147, 1.43646, 0.6914253, 0, 0, 0, 1, 1,
1.568885, 1.150384, 0.4619702, 0, 0, 0, 1, 1,
1.577954, -0.7164964, 2.333458, 0, 0, 0, 1, 1,
1.58, -0.189433, 1.809799, 1, 1, 1, 1, 1,
1.583905, 1.816494, 0.01432754, 1, 1, 1, 1, 1,
1.590781, 1.343609, 0.08561784, 1, 1, 1, 1, 1,
1.603659, 1.057416, 1.019988, 1, 1, 1, 1, 1,
1.623345, -0.3904548, 2.392058, 1, 1, 1, 1, 1,
1.631688, 0.6323971, 3.066878, 1, 1, 1, 1, 1,
1.632808, -2.155022, 3.77367, 1, 1, 1, 1, 1,
1.649847, 0.7195513, 1.135302, 1, 1, 1, 1, 1,
1.654345, 0.1106973, 0.4869525, 1, 1, 1, 1, 1,
1.671201, -0.1160396, 1.929811, 1, 1, 1, 1, 1,
1.678985, -0.003522923, 0.02272224, 1, 1, 1, 1, 1,
1.683617, -0.4458686, 1.349089, 1, 1, 1, 1, 1,
1.69132, -1.58301, 2.845326, 1, 1, 1, 1, 1,
1.695583, 0.08654892, 1.887138, 1, 1, 1, 1, 1,
1.699963, -2.300875, 2.902046, 1, 1, 1, 1, 1,
1.703107, -0.001360039, 1.555717, 0, 0, 1, 1, 1,
1.727481, -0.367616, 2.102172, 1, 0, 0, 1, 1,
1.73193, -0.2408058, 1.96115, 1, 0, 0, 1, 1,
1.732664, 1.694719, 1.016501, 1, 0, 0, 1, 1,
1.749601, 0.4630243, 1.787998, 1, 0, 0, 1, 1,
1.757508, -1.978119, 3.842683, 1, 0, 0, 1, 1,
1.75863, 1.475806, 0.3394689, 0, 0, 0, 1, 1,
1.761395, -1.065478, 2.946217, 0, 0, 0, 1, 1,
1.779059, -0.610965, 1.392768, 0, 0, 0, 1, 1,
1.798828, 0.6762441, 2.044523, 0, 0, 0, 1, 1,
1.805875, -1.675216, 1.133804, 0, 0, 0, 1, 1,
1.807248, 0.003194359, 3.489974, 0, 0, 0, 1, 1,
1.853342, -1.605488, 2.057593, 0, 0, 0, 1, 1,
1.862801, 0.1807289, 0.5192513, 1, 1, 1, 1, 1,
1.893938, -0.07559256, 2.715652, 1, 1, 1, 1, 1,
1.943443, 1.019634, 1.816348, 1, 1, 1, 1, 1,
1.958991, 0.1227079, 2.080666, 1, 1, 1, 1, 1,
1.972727, -1.622823, 3.378392, 1, 1, 1, 1, 1,
1.97677, 1.680929, 1.188744, 1, 1, 1, 1, 1,
1.9778, 1.198885, 1.963577, 1, 1, 1, 1, 1,
1.980292, -1.854475, 2.514485, 1, 1, 1, 1, 1,
2.006574, -0.2149236, 0.8287466, 1, 1, 1, 1, 1,
2.026131, -0.2536292, 0.9528694, 1, 1, 1, 1, 1,
2.044805, 1.394515, 1.37774, 1, 1, 1, 1, 1,
2.064531, -0.3169305, 1.818884, 1, 1, 1, 1, 1,
2.086865, -0.9927657, 0.8386061, 1, 1, 1, 1, 1,
2.130171, 0.2089462, 2.982439, 1, 1, 1, 1, 1,
2.133025, 0.5734186, 1.506205, 1, 1, 1, 1, 1,
2.170102, -0.4210184, 2.592923, 0, 0, 1, 1, 1,
2.173053, -0.8166006, 2.287946, 1, 0, 0, 1, 1,
2.197876, 1.213834, 2.089337, 1, 0, 0, 1, 1,
2.237208, 1.493892, -0.5119182, 1, 0, 0, 1, 1,
2.243448, -0.2823665, 1.30188, 1, 0, 0, 1, 1,
2.253864, 1.999188, -0.1201239, 1, 0, 0, 1, 1,
2.275243, -0.6359822, 2.374257, 0, 0, 0, 1, 1,
2.326594, -1.71363, 2.779727, 0, 0, 0, 1, 1,
2.33287, -2.376494, 1.27217, 0, 0, 0, 1, 1,
2.374954, 0.4005587, 1.18767, 0, 0, 0, 1, 1,
2.378547, -0.262252, 4.053711, 0, 0, 0, 1, 1,
2.389564, -1.581919, 2.676857, 0, 0, 0, 1, 1,
2.419582, 0.5526525, 1.29788, 0, 0, 0, 1, 1,
2.516866, 0.515677, 3.159057, 1, 1, 1, 1, 1,
2.648271, 0.01166006, 1.133217, 1, 1, 1, 1, 1,
2.708839, 0.3131716, 0.8821921, 1, 1, 1, 1, 1,
2.716181, 0.3855415, 3.112419, 1, 1, 1, 1, 1,
2.898545, -0.002892229, 3.050633, 1, 1, 1, 1, 1,
3.190951, 0.7966312, 1.182864, 1, 1, 1, 1, 1,
3.234458, 0.5555529, 0.6385372, 1, 1, 1, 1, 1
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
var radius = 9.840576;
var distance = 34.56461;
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
mvMatrix.translate( -0.02123976, -0.08158422, 0.0923481 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.56461);
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
