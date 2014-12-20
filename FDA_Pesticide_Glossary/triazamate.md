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
-3.636628, 1.308695, -1.395405, 1, 0, 0, 1,
-2.919109, -0.01050821, -1.349864, 1, 0.007843138, 0, 1,
-2.640205, -0.7843698, -1.366674, 1, 0.01176471, 0, 1,
-2.621815, -1.155172, -1.624291, 1, 0.01960784, 0, 1,
-2.515822, -0.5027909, -1.273315, 1, 0.02352941, 0, 1,
-2.470144, -0.8967401, 0.8294743, 1, 0.03137255, 0, 1,
-2.377545, 0.2196504, -2.544208, 1, 0.03529412, 0, 1,
-2.375963, -0.4202775, -2.398388, 1, 0.04313726, 0, 1,
-2.293219, 0.8169526, -0.2428477, 1, 0.04705882, 0, 1,
-2.263238, -0.07774153, -1.112285, 1, 0.05490196, 0, 1,
-2.244259, -0.4804669, -0.1256514, 1, 0.05882353, 0, 1,
-2.243799, -1.413604, -2.574015, 1, 0.06666667, 0, 1,
-2.207773, -0.8084127, -0.6559737, 1, 0.07058824, 0, 1,
-2.070089, -0.310862, -2.885112, 1, 0.07843138, 0, 1,
-1.995791, 0.9847201, -1.569957, 1, 0.08235294, 0, 1,
-1.989286, -0.7147076, -1.907797, 1, 0.09019608, 0, 1,
-1.970359, -1.317207, -2.821754, 1, 0.09411765, 0, 1,
-1.958361, -0.3282278, -0.6460742, 1, 0.1019608, 0, 1,
-1.917364, -0.4448316, -1.796051, 1, 0.1098039, 0, 1,
-1.906316, 0.5195991, -1.050862, 1, 0.1137255, 0, 1,
-1.902512, 0.3892062, -1.116727, 1, 0.1215686, 0, 1,
-1.884437, -1.352432, -2.809616, 1, 0.1254902, 0, 1,
-1.879982, 0.2070353, -3.806157, 1, 0.1333333, 0, 1,
-1.875113, -1.518826, -2.155066, 1, 0.1372549, 0, 1,
-1.870597, 0.01536278, -1.199804, 1, 0.145098, 0, 1,
-1.783421, -1.108676, -3.776445, 1, 0.1490196, 0, 1,
-1.768638, 1.324904, -1.788516, 1, 0.1568628, 0, 1,
-1.768052, 0.9265231, -1.249509, 1, 0.1607843, 0, 1,
-1.760386, -0.5965497, -2.001611, 1, 0.1686275, 0, 1,
-1.754874, 1.407155, -1.372416, 1, 0.172549, 0, 1,
-1.753785, -0.2959262, -2.159242, 1, 0.1803922, 0, 1,
-1.745294, -0.6227037, -1.077016, 1, 0.1843137, 0, 1,
-1.737032, -0.6349556, -2.187804, 1, 0.1921569, 0, 1,
-1.73343, 0.8932401, 0.9084674, 1, 0.1960784, 0, 1,
-1.727634, -0.5962043, -0.206982, 1, 0.2039216, 0, 1,
-1.692382, -1.687286, -1.215565, 1, 0.2117647, 0, 1,
-1.685066, 0.07529065, -3.270317, 1, 0.2156863, 0, 1,
-1.679557, -0.3363875, -0.2159225, 1, 0.2235294, 0, 1,
-1.674912, 0.2473156, -2.033746, 1, 0.227451, 0, 1,
-1.65711, 1.094239, -0.01158999, 1, 0.2352941, 0, 1,
-1.654996, -0.3370588, -1.580461, 1, 0.2392157, 0, 1,
-1.630023, 0.8420986, -1.075955, 1, 0.2470588, 0, 1,
-1.613726, -0.4147094, -1.978127, 1, 0.2509804, 0, 1,
-1.612542, 0.7337929, -1.386776, 1, 0.2588235, 0, 1,
-1.61179, -0.2325278, -2.563245, 1, 0.2627451, 0, 1,
-1.607291, 0.06733643, -2.50064, 1, 0.2705882, 0, 1,
-1.604558, 0.2525539, -1.258346, 1, 0.2745098, 0, 1,
-1.597791, -0.5286758, -1.233219, 1, 0.282353, 0, 1,
-1.588349, 1.418496, -0.07744734, 1, 0.2862745, 0, 1,
-1.586293, -0.2418683, -3.063114, 1, 0.2941177, 0, 1,
-1.579046, 0.02000938, -2.207394, 1, 0.3019608, 0, 1,
-1.568501, -0.6461134, -2.427228, 1, 0.3058824, 0, 1,
-1.564721, 0.8255625, 0.2439281, 1, 0.3137255, 0, 1,
-1.558088, 0.7387955, -0.375703, 1, 0.3176471, 0, 1,
-1.555882, -0.5741782, -0.7209647, 1, 0.3254902, 0, 1,
-1.548361, -0.8502628, -3.080493, 1, 0.3294118, 0, 1,
-1.547292, -0.8201779, -1.979092, 1, 0.3372549, 0, 1,
-1.535711, 1.202173, -1.95977, 1, 0.3411765, 0, 1,
-1.528915, -1.041072, -3.393245, 1, 0.3490196, 0, 1,
-1.527221, -0.3598412, -2.870527, 1, 0.3529412, 0, 1,
-1.521611, 0.2604809, -1.183491, 1, 0.3607843, 0, 1,
-1.508855, -0.08917744, -1.947711, 1, 0.3647059, 0, 1,
-1.492405, 0.8192984, -1.225304, 1, 0.372549, 0, 1,
-1.484394, -0.5756527, -2.77911, 1, 0.3764706, 0, 1,
-1.457389, 1.610622, -0.5250009, 1, 0.3843137, 0, 1,
-1.456432, -0.0638473, -1.307848, 1, 0.3882353, 0, 1,
-1.450597, 0.1033813, -1.365172, 1, 0.3960784, 0, 1,
-1.448168, -0.355824, -3.113868, 1, 0.4039216, 0, 1,
-1.436405, 1.073164, -1.20616, 1, 0.4078431, 0, 1,
-1.430449, 1.122459, -0.1736909, 1, 0.4156863, 0, 1,
-1.423398, 1.205562, -2.248522, 1, 0.4196078, 0, 1,
-1.421239, 1.083515, -1.033416, 1, 0.427451, 0, 1,
-1.414367, -0.7157587, -1.925284, 1, 0.4313726, 0, 1,
-1.407416, 0.5653499, -2.920646, 1, 0.4392157, 0, 1,
-1.39743, 0.2064092, -0.2998744, 1, 0.4431373, 0, 1,
-1.396916, -1.296398, -3.030681, 1, 0.4509804, 0, 1,
-1.392175, -0.3922537, -1.341004, 1, 0.454902, 0, 1,
-1.388243, -1.639073, -4.538229, 1, 0.4627451, 0, 1,
-1.38813, 0.102057, -2.178581, 1, 0.4666667, 0, 1,
-1.382716, -0.9276609, -1.055387, 1, 0.4745098, 0, 1,
-1.367953, -0.8074707, -2.379526, 1, 0.4784314, 0, 1,
-1.361592, -0.599811, 0.2148336, 1, 0.4862745, 0, 1,
-1.353656, 0.2873807, -0.6422717, 1, 0.4901961, 0, 1,
-1.344413, -0.808714, -2.312941, 1, 0.4980392, 0, 1,
-1.339486, -1.969313, -1.438308, 1, 0.5058824, 0, 1,
-1.339064, 0.7835622, -0.9389746, 1, 0.509804, 0, 1,
-1.334302, -0.3721944, -1.244593, 1, 0.5176471, 0, 1,
-1.332666, 0.586729, -0.7822117, 1, 0.5215687, 0, 1,
-1.330683, 1.008306, -0.6689882, 1, 0.5294118, 0, 1,
-1.315981, -0.3646474, -1.744182, 1, 0.5333334, 0, 1,
-1.314767, 0.3237407, -0.6248052, 1, 0.5411765, 0, 1,
-1.314332, -0.7160197, -3.784216, 1, 0.5450981, 0, 1,
-1.307343, 0.776242, -0.8492227, 1, 0.5529412, 0, 1,
-1.304717, 1.886279, -0.02787192, 1, 0.5568628, 0, 1,
-1.302617, -1.974684, -2.862271, 1, 0.5647059, 0, 1,
-1.27823, -1.027995, -1.817701, 1, 0.5686275, 0, 1,
-1.276819, -0.2191161, -2.294528, 1, 0.5764706, 0, 1,
-1.274675, -1.438185, -3.651922, 1, 0.5803922, 0, 1,
-1.271591, -0.0478997, -0.3724156, 1, 0.5882353, 0, 1,
-1.269523, 0.1239581, -2.532914, 1, 0.5921569, 0, 1,
-1.257677, -1.089432, -4.104012, 1, 0.6, 0, 1,
-1.253211, -1.979952, -3.107171, 1, 0.6078432, 0, 1,
-1.253008, 0.3115202, -1.013249, 1, 0.6117647, 0, 1,
-1.233826, 0.06391054, -3.248138, 1, 0.6196079, 0, 1,
-1.227988, 0.5616418, -0.9986427, 1, 0.6235294, 0, 1,
-1.22666, -1.055436, -1.827521, 1, 0.6313726, 0, 1,
-1.206885, 0.06948145, -1.310976, 1, 0.6352941, 0, 1,
-1.203918, 1.02525, -1.199007, 1, 0.6431373, 0, 1,
-1.201855, 0.1531347, -1.85341, 1, 0.6470588, 0, 1,
-1.196084, 1.075686, -0.9717086, 1, 0.654902, 0, 1,
-1.195897, -0.5435651, -2.597231, 1, 0.6588235, 0, 1,
-1.192733, -0.6287968, -3.141005, 1, 0.6666667, 0, 1,
-1.19258, -0.1066964, -1.585676, 1, 0.6705883, 0, 1,
-1.187182, -0.2699472, -2.52471, 1, 0.6784314, 0, 1,
-1.182481, -1.11825, -1.697141, 1, 0.682353, 0, 1,
-1.17898, -0.1806472, -2.41601, 1, 0.6901961, 0, 1,
-1.171418, -1.712658, -2.230356, 1, 0.6941177, 0, 1,
-1.17109, 0.8198786, 0.2578655, 1, 0.7019608, 0, 1,
-1.171054, -0.7944824, -0.8146142, 1, 0.7098039, 0, 1,
-1.167354, 0.193928, -0.0746096, 1, 0.7137255, 0, 1,
-1.166551, 0.0509222, -0.5578453, 1, 0.7215686, 0, 1,
-1.144601, -0.4825317, -2.05245, 1, 0.7254902, 0, 1,
-1.129803, -0.7862201, -1.044552, 1, 0.7333333, 0, 1,
-1.12942, 0.6185409, -1.210397, 1, 0.7372549, 0, 1,
-1.129101, 0.4064249, -0.8630579, 1, 0.7450981, 0, 1,
-1.125392, 0.1809324, -2.51425, 1, 0.7490196, 0, 1,
-1.12458, -0.3203002, -0.8225071, 1, 0.7568628, 0, 1,
-1.11475, -0.4170045, -0.01682647, 1, 0.7607843, 0, 1,
-1.114368, 0.8858113, -1.510355, 1, 0.7686275, 0, 1,
-1.111591, 0.3075126, -0.4126291, 1, 0.772549, 0, 1,
-1.111072, -0.1738081, -1.288074, 1, 0.7803922, 0, 1,
-1.108364, -1.210173, -1.252098, 1, 0.7843137, 0, 1,
-1.107004, -0.3222197, -1.938335, 1, 0.7921569, 0, 1,
-1.105128, 0.1606332, -1.813213, 1, 0.7960784, 0, 1,
-1.096965, 1.016383, -0.5762337, 1, 0.8039216, 0, 1,
-1.091196, -0.6121002, -2.689223, 1, 0.8117647, 0, 1,
-1.091093, -0.4532572, 0.4652216, 1, 0.8156863, 0, 1,
-1.091019, 0.8271811, -0.9322332, 1, 0.8235294, 0, 1,
-1.085868, 0.4521078, -1.108517, 1, 0.827451, 0, 1,
-1.080093, 1.235622, -1.165596, 1, 0.8352941, 0, 1,
-1.076971, 0.1085095, -1.77707, 1, 0.8392157, 0, 1,
-1.073162, -0.006508603, -1.460672, 1, 0.8470588, 0, 1,
-1.06923, -1.329294, -1.949652, 1, 0.8509804, 0, 1,
-1.048591, -1.470971, -1.393803, 1, 0.8588235, 0, 1,
-1.04652, -0.2501435, -1.683942, 1, 0.8627451, 0, 1,
-1.043496, -1.297186, -2.984748, 1, 0.8705882, 0, 1,
-1.043495, -0.5852087, -1.947505, 1, 0.8745098, 0, 1,
-1.038148, 1.004663, -0.3854581, 1, 0.8823529, 0, 1,
-1.033614, 0.7057296, -1.396374, 1, 0.8862745, 0, 1,
-1.03272, 0.2698015, -1.720083, 1, 0.8941177, 0, 1,
-1.03144, -1.199354, -3.914641, 1, 0.8980392, 0, 1,
-1.030713, 1.023963, -0.8137236, 1, 0.9058824, 0, 1,
-1.028708, 0.3194512, -1.671936, 1, 0.9137255, 0, 1,
-1.027234, 1.521182, 0.6071418, 1, 0.9176471, 0, 1,
-1.024505, -0.03777268, -0.8910007, 1, 0.9254902, 0, 1,
-1.023478, 1.756196, -0.3804835, 1, 0.9294118, 0, 1,
-1.020666, 0.5310737, -1.194624, 1, 0.9372549, 0, 1,
-1.014857, 1.776502, 1.63374, 1, 0.9411765, 0, 1,
-1.014763, 0.9230318, -1.648087, 1, 0.9490196, 0, 1,
-1.005551, 0.3301095, 0.2006202, 1, 0.9529412, 0, 1,
-1.000985, 0.6984723, -0.3669173, 1, 0.9607843, 0, 1,
-0.9789119, 0.5760922, -0.1659729, 1, 0.9647059, 0, 1,
-0.9786625, -0.2383364, -0.3509201, 1, 0.972549, 0, 1,
-0.9757553, -0.8376758, -1.798041, 1, 0.9764706, 0, 1,
-0.967856, 0.1425126, -4.055057, 1, 0.9843137, 0, 1,
-0.9592189, -0.27807, -1.833276, 1, 0.9882353, 0, 1,
-0.9491875, -0.1074948, -2.272588, 1, 0.9960784, 0, 1,
-0.9437431, 0.1484137, -1.598231, 0.9960784, 1, 0, 1,
-0.9434893, -1.645966, -1.597572, 0.9921569, 1, 0, 1,
-0.9425263, -0.5868045, -0.01772003, 0.9843137, 1, 0, 1,
-0.942142, 0.5275462, 0.3387143, 0.9803922, 1, 0, 1,
-0.9413785, 1.189989, 1.441451, 0.972549, 1, 0, 1,
-0.9380944, -0.2428365, -1.810516, 0.9686275, 1, 0, 1,
-0.9361339, -1.682246, -3.711249, 0.9607843, 1, 0, 1,
-0.9324468, 2.649544, 0.4736609, 0.9568627, 1, 0, 1,
-0.9268703, -0.007178199, -1.338784, 0.9490196, 1, 0, 1,
-0.9230118, -0.4438875, -2.783471, 0.945098, 1, 0, 1,
-0.9187534, 1.046633, 0.9027349, 0.9372549, 1, 0, 1,
-0.9155, -0.2875572, -2.396111, 0.9333333, 1, 0, 1,
-0.9130059, -0.4589415, -2.355655, 0.9254902, 1, 0, 1,
-0.9051487, -0.9481643, -3.521257, 0.9215686, 1, 0, 1,
-0.9018717, -1.37686, -4.041589, 0.9137255, 1, 0, 1,
-0.9010746, -1.307427, -3.640379, 0.9098039, 1, 0, 1,
-0.8988025, 1.457728, -0.5166823, 0.9019608, 1, 0, 1,
-0.8985575, -0.2630972, -1.503032, 0.8941177, 1, 0, 1,
-0.8951465, 2.357136, -2.076283, 0.8901961, 1, 0, 1,
-0.8876466, 0.1453754, 0.5943872, 0.8823529, 1, 0, 1,
-0.8842981, 0.6728251, -1.007793, 0.8784314, 1, 0, 1,
-0.8840753, 0.4167485, -2.91779, 0.8705882, 1, 0, 1,
-0.8777242, 0.03512462, -2.400903, 0.8666667, 1, 0, 1,
-0.8763318, 0.6159773, -1.607173, 0.8588235, 1, 0, 1,
-0.8758624, 0.2572274, -0.9956751, 0.854902, 1, 0, 1,
-0.8755883, 1.220807, -0.4559995, 0.8470588, 1, 0, 1,
-0.873717, 2.215732, -0.6632456, 0.8431373, 1, 0, 1,
-0.8701755, 0.649893, -0.7250843, 0.8352941, 1, 0, 1,
-0.8572991, -0.127882, -0.8637494, 0.8313726, 1, 0, 1,
-0.8569484, 0.1135228, -1.447431, 0.8235294, 1, 0, 1,
-0.8520779, -0.3669177, -2.949935, 0.8196079, 1, 0, 1,
-0.8508369, 0.15356, -1.319919, 0.8117647, 1, 0, 1,
-0.8465459, 0.8625238, -1.082794, 0.8078431, 1, 0, 1,
-0.8439645, 1.79959, -0.005471652, 0.8, 1, 0, 1,
-0.8430278, -0.1030835, -1.74682, 0.7921569, 1, 0, 1,
-0.8374517, -0.3592116, -2.70313, 0.7882353, 1, 0, 1,
-0.8324217, 0.05963973, -0.1402854, 0.7803922, 1, 0, 1,
-0.8320686, 0.2874086, -0.2776537, 0.7764706, 1, 0, 1,
-0.8307148, 0.6921852, -0.213598, 0.7686275, 1, 0, 1,
-0.824845, 0.481142, -0.8895701, 0.7647059, 1, 0, 1,
-0.8236216, -0.2749894, -1.801948, 0.7568628, 1, 0, 1,
-0.8234546, 1.798487, -0.3632092, 0.7529412, 1, 0, 1,
-0.8197889, 0.1356217, -2.341015, 0.7450981, 1, 0, 1,
-0.8133497, 1.017222, -1.639694, 0.7411765, 1, 0, 1,
-0.8128991, 2.344793, 0.2134819, 0.7333333, 1, 0, 1,
-0.8120334, 0.03135917, -0.3625799, 0.7294118, 1, 0, 1,
-0.8113348, 0.1026434, -2.130295, 0.7215686, 1, 0, 1,
-0.8111946, -0.1937123, -1.211589, 0.7176471, 1, 0, 1,
-0.8080317, 0.5947183, -2.301546, 0.7098039, 1, 0, 1,
-0.8068057, 0.9091994, -1.418424, 0.7058824, 1, 0, 1,
-0.8053, 0.4574172, -1.77155, 0.6980392, 1, 0, 1,
-0.8026181, 1.130322, -0.07443525, 0.6901961, 1, 0, 1,
-0.7986948, 0.954561, -1.297981, 0.6862745, 1, 0, 1,
-0.7954077, -1.048246, -2.361096, 0.6784314, 1, 0, 1,
-0.7931134, -0.1169886, -1.609177, 0.6745098, 1, 0, 1,
-0.79102, 0.5272714, -2.307239, 0.6666667, 1, 0, 1,
-0.7896246, -0.6476957, -3.775707, 0.6627451, 1, 0, 1,
-0.7849884, 1.82939, 0.2482924, 0.654902, 1, 0, 1,
-0.7780455, 0.3774186, -0.04270658, 0.6509804, 1, 0, 1,
-0.7775528, -0.2852283, -2.529797, 0.6431373, 1, 0, 1,
-0.7730278, 0.2231585, -0.5838634, 0.6392157, 1, 0, 1,
-0.7699484, -0.1843276, -0.5951046, 0.6313726, 1, 0, 1,
-0.7693052, -0.4944428, -1.784645, 0.627451, 1, 0, 1,
-0.7656156, -1.235759, -3.117321, 0.6196079, 1, 0, 1,
-0.7651502, 1.468612, 0.1780749, 0.6156863, 1, 0, 1,
-0.7644768, -0.648696, -1.472194, 0.6078432, 1, 0, 1,
-0.7637756, 0.6856272, -0.7747259, 0.6039216, 1, 0, 1,
-0.7573217, -1.258717, -2.031337, 0.5960785, 1, 0, 1,
-0.7536829, 0.6858923, -1.375862, 0.5882353, 1, 0, 1,
-0.7522218, 1.079461, -1.645232, 0.5843138, 1, 0, 1,
-0.7466912, 1.666709, -0.6954607, 0.5764706, 1, 0, 1,
-0.743926, -0.4812862, -2.205813, 0.572549, 1, 0, 1,
-0.7375315, -0.1006807, -1.863081, 0.5647059, 1, 0, 1,
-0.7312993, 1.677692, 0.866758, 0.5607843, 1, 0, 1,
-0.7298987, 0.05542299, -1.29516, 0.5529412, 1, 0, 1,
-0.7296622, -0.1633611, -2.599463, 0.5490196, 1, 0, 1,
-0.7291034, -0.5379404, -3.386111, 0.5411765, 1, 0, 1,
-0.7274765, 0.1174512, -0.6867033, 0.5372549, 1, 0, 1,
-0.721655, 0.2147877, -0.7386762, 0.5294118, 1, 0, 1,
-0.7148877, -2.188038, -3.510036, 0.5254902, 1, 0, 1,
-0.7132872, 2.039688, 0.2747141, 0.5176471, 1, 0, 1,
-0.703937, -1.517545, -3.705636, 0.5137255, 1, 0, 1,
-0.7037423, 1.938518, 0.1235757, 0.5058824, 1, 0, 1,
-0.702183, -0.8420951, -2.612601, 0.5019608, 1, 0, 1,
-0.7004156, -0.9416843, -2.784313, 0.4941176, 1, 0, 1,
-0.6980671, -0.09571131, 0.1239318, 0.4862745, 1, 0, 1,
-0.6957817, 0.07825223, -1.740187, 0.4823529, 1, 0, 1,
-0.6954665, -0.4293662, -2.002013, 0.4745098, 1, 0, 1,
-0.6923285, -0.4505772, -1.820522, 0.4705882, 1, 0, 1,
-0.6921791, -0.2379305, -2.658504, 0.4627451, 1, 0, 1,
-0.688008, -1.223019, -0.4587342, 0.4588235, 1, 0, 1,
-0.6830897, -0.5494191, -1.717965, 0.4509804, 1, 0, 1,
-0.68271, -1.161565, -3.348829, 0.4470588, 1, 0, 1,
-0.6818087, -0.3163421, -0.6628314, 0.4392157, 1, 0, 1,
-0.6810823, -0.842968, -2.4786, 0.4352941, 1, 0, 1,
-0.6804076, -0.3095224, -3.574932, 0.427451, 1, 0, 1,
-0.6700639, 0.1008993, -2.082327, 0.4235294, 1, 0, 1,
-0.6689779, 0.2308728, -0.3486824, 0.4156863, 1, 0, 1,
-0.6666265, 0.3184166, -1.107121, 0.4117647, 1, 0, 1,
-0.6646572, 1.583643, 0.1170664, 0.4039216, 1, 0, 1,
-0.6633324, 0.8692642, 2.052665, 0.3960784, 1, 0, 1,
-0.6590909, -2.839511, -2.799019, 0.3921569, 1, 0, 1,
-0.6583626, -0.1700379, -2.327191, 0.3843137, 1, 0, 1,
-0.6576713, -0.868809, -2.548468, 0.3803922, 1, 0, 1,
-0.6573349, -1.876737, -0.9408782, 0.372549, 1, 0, 1,
-0.6518788, -0.7224718, -1.857177, 0.3686275, 1, 0, 1,
-0.642598, 1.743943, 0.02906843, 0.3607843, 1, 0, 1,
-0.6376181, -1.535669, -0.3639538, 0.3568628, 1, 0, 1,
-0.6366414, 2.253307, 0.5682877, 0.3490196, 1, 0, 1,
-0.6356795, 1.119676, -0.03057768, 0.345098, 1, 0, 1,
-0.6353478, 0.908262, -1.056664, 0.3372549, 1, 0, 1,
-0.6335202, -0.3203668, -1.205403, 0.3333333, 1, 0, 1,
-0.6330874, -0.4482337, -3.109767, 0.3254902, 1, 0, 1,
-0.6309451, 1.345983, 1.231261, 0.3215686, 1, 0, 1,
-0.628495, 0.7741017, 1.081848, 0.3137255, 1, 0, 1,
-0.6228266, 0.2346954, -0.1725688, 0.3098039, 1, 0, 1,
-0.6209157, -0.6016754, -4.268545, 0.3019608, 1, 0, 1,
-0.6195391, 0.1508391, -2.328512, 0.2941177, 1, 0, 1,
-0.618067, 0.7077226, -0.08509226, 0.2901961, 1, 0, 1,
-0.6128529, 0.5175892, -0.6104726, 0.282353, 1, 0, 1,
-0.6127829, 0.6898159, 0.06153378, 0.2784314, 1, 0, 1,
-0.6071709, -1.600552, -2.892686, 0.2705882, 1, 0, 1,
-0.6067472, 0.4508879, -0.5620214, 0.2666667, 1, 0, 1,
-0.6055626, 1.832777, -1.563466, 0.2588235, 1, 0, 1,
-0.604596, 1.016674, 0.7737233, 0.254902, 1, 0, 1,
-0.603884, -0.2585164, -1.784895, 0.2470588, 1, 0, 1,
-0.6014071, -2.242195, -3.177985, 0.2431373, 1, 0, 1,
-0.5976701, 0.8261726, -1.634287, 0.2352941, 1, 0, 1,
-0.5968426, 2.30998, -0.7672883, 0.2313726, 1, 0, 1,
-0.5945817, 0.5079946, -0.5647107, 0.2235294, 1, 0, 1,
-0.5847583, 1.192556, 1.257157, 0.2196078, 1, 0, 1,
-0.5806963, -0.5160905, -2.71585, 0.2117647, 1, 0, 1,
-0.5805469, -0.5194309, -2.90646, 0.2078431, 1, 0, 1,
-0.5782688, 0.1257303, -2.274122, 0.2, 1, 0, 1,
-0.5777892, -0.1749841, -2.077539, 0.1921569, 1, 0, 1,
-0.5764996, 2.025777, -1.362272, 0.1882353, 1, 0, 1,
-0.5764641, -0.9251708, -4.25858, 0.1803922, 1, 0, 1,
-0.5747038, -0.09558495, -1.104424, 0.1764706, 1, 0, 1,
-0.5707487, 1.138005, -1.594552, 0.1686275, 1, 0, 1,
-0.5670848, -0.2550306, -1.683609, 0.1647059, 1, 0, 1,
-0.5657541, -0.2262927, -1.072248, 0.1568628, 1, 0, 1,
-0.5642025, -0.6852029, -2.977127, 0.1529412, 1, 0, 1,
-0.559734, -0.3530818, -1.597021, 0.145098, 1, 0, 1,
-0.5538257, 0.1279254, -2.838825, 0.1411765, 1, 0, 1,
-0.552855, 0.4835233, -2.716381, 0.1333333, 1, 0, 1,
-0.5520814, -0.1344743, -0.4745946, 0.1294118, 1, 0, 1,
-0.5483087, -1.356233, -3.548744, 0.1215686, 1, 0, 1,
-0.5456951, -1.290859, -1.875026, 0.1176471, 1, 0, 1,
-0.5455037, 0.002734448, -0.2405547, 0.1098039, 1, 0, 1,
-0.5425858, -0.168701, -0.365414, 0.1058824, 1, 0, 1,
-0.5421405, 1.236195, -1.586165, 0.09803922, 1, 0, 1,
-0.541603, 0.7330008, -2.232295, 0.09019608, 1, 0, 1,
-0.5378812, 0.1495133, -2.135384, 0.08627451, 1, 0, 1,
-0.5373783, 1.466993, -0.9513022, 0.07843138, 1, 0, 1,
-0.5356109, -1.140603, -2.80201, 0.07450981, 1, 0, 1,
-0.5333532, -0.8265565, -0.2505454, 0.06666667, 1, 0, 1,
-0.5314168, 0.2287655, -2.441264, 0.0627451, 1, 0, 1,
-0.531372, -0.1916296, -0.1517798, 0.05490196, 1, 0, 1,
-0.5312788, -0.7635446, -2.115827, 0.05098039, 1, 0, 1,
-0.5284353, 0.4870666, -2.624792, 0.04313726, 1, 0, 1,
-0.5249333, 0.9153866, -2.640637, 0.03921569, 1, 0, 1,
-0.5245696, 0.1813766, -2.141571, 0.03137255, 1, 0, 1,
-0.5230011, -1.262876, -1.860009, 0.02745098, 1, 0, 1,
-0.5225034, -1.311279, -1.462536, 0.01960784, 1, 0, 1,
-0.5190707, 0.03560213, -0.9006099, 0.01568628, 1, 0, 1,
-0.5145066, -1.266937, -2.155191, 0.007843138, 1, 0, 1,
-0.5132346, -1.179128, -1.119711, 0.003921569, 1, 0, 1,
-0.5128933, 0.2114472, -1.687362, 0, 1, 0.003921569, 1,
-0.5124241, 0.683737, -0.587592, 0, 1, 0.01176471, 1,
-0.5089483, -0.245374, -0.4955692, 0, 1, 0.01568628, 1,
-0.5088942, -0.2633289, -1.844948, 0, 1, 0.02352941, 1,
-0.5052413, 0.6199113, 0.5119802, 0, 1, 0.02745098, 1,
-0.5051095, -0.004542179, -1.312437, 0, 1, 0.03529412, 1,
-0.5002835, -0.6347122, -4.912893, 0, 1, 0.03921569, 1,
-0.4995642, 1.120268, -0.4802287, 0, 1, 0.04705882, 1,
-0.4991533, -0.9400312, -1.267678, 0, 1, 0.05098039, 1,
-0.4964082, 1.243654, -0.9210191, 0, 1, 0.05882353, 1,
-0.4936856, -0.434223, -3.269172, 0, 1, 0.0627451, 1,
-0.4889109, 1.735318, 0.739898, 0, 1, 0.07058824, 1,
-0.4861018, 0.9610993, -1.463339, 0, 1, 0.07450981, 1,
-0.4843796, -0.08792318, -0.8120933, 0, 1, 0.08235294, 1,
-0.4826242, 0.1791245, -1.627681, 0, 1, 0.08627451, 1,
-0.4815644, 0.06619263, -0.6148298, 0, 1, 0.09411765, 1,
-0.4742627, 2.273915, 0.06324887, 0, 1, 0.1019608, 1,
-0.4704931, -0.06867477, -0.8498219, 0, 1, 0.1058824, 1,
-0.4639521, -0.1200673, -0.8744528, 0, 1, 0.1137255, 1,
-0.4600607, -0.4037184, -1.56879, 0, 1, 0.1176471, 1,
-0.4583455, 0.9225944, -0.2235212, 0, 1, 0.1254902, 1,
-0.4582184, 1.186225, -0.1712012, 0, 1, 0.1294118, 1,
-0.4581714, -0.7829226, -1.148422, 0, 1, 0.1372549, 1,
-0.4496424, -1.49359, -3.472458, 0, 1, 0.1411765, 1,
-0.4476649, -1.838729, -1.536814, 0, 1, 0.1490196, 1,
-0.4471344, 1.025706, -1.865145, 0, 1, 0.1529412, 1,
-0.4430285, 0.9019755, -1.113997, 0, 1, 0.1607843, 1,
-0.4366621, -0.4988666, -2.645644, 0, 1, 0.1647059, 1,
-0.4352555, -0.4094612, -1.711676, 0, 1, 0.172549, 1,
-0.4334101, 0.247381, -1.529166, 0, 1, 0.1764706, 1,
-0.4313352, -1.466571, -1.5233, 0, 1, 0.1843137, 1,
-0.4303632, 1.502027, -1.198272, 0, 1, 0.1882353, 1,
-0.4264354, 0.8614033, -0.60116, 0, 1, 0.1960784, 1,
-0.4254107, 0.8850517, -0.5791354, 0, 1, 0.2039216, 1,
-0.4242401, -0.2936641, -2.884401, 0, 1, 0.2078431, 1,
-0.4240026, 2.10857, 0.128097, 0, 1, 0.2156863, 1,
-0.4178154, 0.005924849, -0.9527513, 0, 1, 0.2196078, 1,
-0.4146354, -0.8843926, -1.665498, 0, 1, 0.227451, 1,
-0.412225, -0.4974711, -4.538306, 0, 1, 0.2313726, 1,
-0.4066961, 0.4182514, 0.7983401, 0, 1, 0.2392157, 1,
-0.4058844, -2.572242, -1.940684, 0, 1, 0.2431373, 1,
-0.4049605, 3.013927, -0.6824774, 0, 1, 0.2509804, 1,
-0.4010643, -0.0712368, -0.4776535, 0, 1, 0.254902, 1,
-0.4004518, 0.9129441, -0.985086, 0, 1, 0.2627451, 1,
-0.3968332, -0.3326953, -3.264564, 0, 1, 0.2666667, 1,
-0.3954163, -1.043116, -1.281177, 0, 1, 0.2745098, 1,
-0.3868083, -1.465809, -1.118361, 0, 1, 0.2784314, 1,
-0.373016, -2.409819, -1.613183, 0, 1, 0.2862745, 1,
-0.3712686, 0.8110134, 0.1732762, 0, 1, 0.2901961, 1,
-0.3659858, 1.110869, -0.2927053, 0, 1, 0.2980392, 1,
-0.3643524, -0.02475632, -1.467586, 0, 1, 0.3058824, 1,
-0.3624856, 0.05438038, 0.6216535, 0, 1, 0.3098039, 1,
-0.3595362, 1.017406, 1.60114, 0, 1, 0.3176471, 1,
-0.3495891, 0.1483423, -0.5793967, 0, 1, 0.3215686, 1,
-0.343783, 0.461341, 0.4907214, 0, 1, 0.3294118, 1,
-0.3376965, -1.617096, -1.843552, 0, 1, 0.3333333, 1,
-0.3315588, 2.248741, -1.013982, 0, 1, 0.3411765, 1,
-0.3219642, 0.8078996, 0.2619126, 0, 1, 0.345098, 1,
-0.3212779, -1.241961, -4.370739, 0, 1, 0.3529412, 1,
-0.3182265, 0.09977936, -0.4213703, 0, 1, 0.3568628, 1,
-0.3136564, 2.35554, -0.2859689, 0, 1, 0.3647059, 1,
-0.3122333, -1.785746, -2.024629, 0, 1, 0.3686275, 1,
-0.310517, -0.3652708, -2.042501, 0, 1, 0.3764706, 1,
-0.3079196, -0.0997981, -2.816423, 0, 1, 0.3803922, 1,
-0.3077491, -0.924377, -2.269072, 0, 1, 0.3882353, 1,
-0.3017003, -0.647391, -2.985564, 0, 1, 0.3921569, 1,
-0.2946082, -0.2456617, -2.537768, 0, 1, 0.4, 1,
-0.2935409, 0.9655641, -0.8512186, 0, 1, 0.4078431, 1,
-0.2933519, 0.2568423, -2.175378, 0, 1, 0.4117647, 1,
-0.287995, -0.5344356, -4.311626, 0, 1, 0.4196078, 1,
-0.2857884, -1.106614, -3.71531, 0, 1, 0.4235294, 1,
-0.2793612, 0.6813098, -1.356688, 0, 1, 0.4313726, 1,
-0.2767854, -1.283138, -4.77612, 0, 1, 0.4352941, 1,
-0.2715678, -0.1133431, -0.2301274, 0, 1, 0.4431373, 1,
-0.2652962, 0.2123163, -0.1445471, 0, 1, 0.4470588, 1,
-0.265227, 1.323103, -0.9739541, 0, 1, 0.454902, 1,
-0.26449, 0.36788, 1.27714, 0, 1, 0.4588235, 1,
-0.2612392, 1.421384, -0.302682, 0, 1, 0.4666667, 1,
-0.2563016, 1.324834, -1.537675, 0, 1, 0.4705882, 1,
-0.2557992, -0.934297, -4.185524, 0, 1, 0.4784314, 1,
-0.2551631, -1.815014, -3.785282, 0, 1, 0.4823529, 1,
-0.2549142, -0.37968, -1.214514, 0, 1, 0.4901961, 1,
-0.2504954, -0.2881798, -2.158573, 0, 1, 0.4941176, 1,
-0.2502453, 0.2295372, -0.5788214, 0, 1, 0.5019608, 1,
-0.2396661, -2.438101, -3.228504, 0, 1, 0.509804, 1,
-0.23095, -0.7684963, -4.47799, 0, 1, 0.5137255, 1,
-0.2303516, -0.9111722, -1.512844, 0, 1, 0.5215687, 1,
-0.2189906, -1.275172, -4.555271, 0, 1, 0.5254902, 1,
-0.2163427, 1.71399, 0.3084999, 0, 1, 0.5333334, 1,
-0.2138791, 1.697341, -0.1308495, 0, 1, 0.5372549, 1,
-0.2127186, -0.04623216, -1.356632, 0, 1, 0.5450981, 1,
-0.2114608, 1.310448, 0.6165132, 0, 1, 0.5490196, 1,
-0.2114602, -2.159953, -4.892806, 0, 1, 0.5568628, 1,
-0.2099337, -0.5938191, -4.311703, 0, 1, 0.5607843, 1,
-0.2096655, 0.6360469, -0.5749069, 0, 1, 0.5686275, 1,
-0.2043915, -0.09089617, -1.36855, 0, 1, 0.572549, 1,
-0.2021349, -1.610062, -4.735578, 0, 1, 0.5803922, 1,
-0.2017559, -0.3979234, -3.062809, 0, 1, 0.5843138, 1,
-0.2016083, -0.800549, -1.685079, 0, 1, 0.5921569, 1,
-0.1965519, 0.6182401, -0.1394938, 0, 1, 0.5960785, 1,
-0.1890793, 1.271429, 0.487816, 0, 1, 0.6039216, 1,
-0.1819062, -1.818783, -2.509697, 0, 1, 0.6117647, 1,
-0.1788822, -1.899091, -3.477064, 0, 1, 0.6156863, 1,
-0.1781052, -0.6854001, -2.671484, 0, 1, 0.6235294, 1,
-0.1701729, -1.214223, -3.31927, 0, 1, 0.627451, 1,
-0.168624, -0.3233829, -2.709809, 0, 1, 0.6352941, 1,
-0.1677437, 0.9811711, 0.8348904, 0, 1, 0.6392157, 1,
-0.1664573, 0.332068, -2.107799, 0, 1, 0.6470588, 1,
-0.1654482, 0.07284153, -2.178031, 0, 1, 0.6509804, 1,
-0.1604191, -1.328524, -4.082415, 0, 1, 0.6588235, 1,
-0.1598469, -0.679253, 0.4534478, 0, 1, 0.6627451, 1,
-0.1592146, -0.861748, -2.878887, 0, 1, 0.6705883, 1,
-0.1580641, -1.703812, -1.360192, 0, 1, 0.6745098, 1,
-0.1560359, -1.031427, -3.826087, 0, 1, 0.682353, 1,
-0.1543762, 1.228571, 0.8611473, 0, 1, 0.6862745, 1,
-0.1518239, -1.323678, -2.917316, 0, 1, 0.6941177, 1,
-0.1475514, 0.9906801, 0.01975661, 0, 1, 0.7019608, 1,
-0.1458588, -1.337537, -2.556146, 0, 1, 0.7058824, 1,
-0.1413761, 0.9674508, -0.02254498, 0, 1, 0.7137255, 1,
-0.1397822, -1.426481, -2.483893, 0, 1, 0.7176471, 1,
-0.1364338, 0.5599474, -0.7996778, 0, 1, 0.7254902, 1,
-0.1305514, 0.3477478, -0.1928157, 0, 1, 0.7294118, 1,
-0.13, 1.154398, 0.4470421, 0, 1, 0.7372549, 1,
-0.1292236, -0.4678011, -3.228801, 0, 1, 0.7411765, 1,
-0.1291227, -0.8534757, -2.773761, 0, 1, 0.7490196, 1,
-0.1245434, -0.308193, -3.864309, 0, 1, 0.7529412, 1,
-0.1235339, -0.0044636, -4.784055, 0, 1, 0.7607843, 1,
-0.1159631, -0.1646335, -2.435785, 0, 1, 0.7647059, 1,
-0.1108373, 1.571012, -0.3318326, 0, 1, 0.772549, 1,
-0.1058268, -0.6045872, -3.540467, 0, 1, 0.7764706, 1,
-0.1047028, 0.2294343, -0.03772454, 0, 1, 0.7843137, 1,
-0.1011574, -0.1535913, -2.352032, 0, 1, 0.7882353, 1,
-0.1003262, 1.911653, 0.3109611, 0, 1, 0.7960784, 1,
-0.09986331, 0.009111424, -2.076287, 0, 1, 0.8039216, 1,
-0.0968229, 0.8322121, -0.5929941, 0, 1, 0.8078431, 1,
-0.09644512, 0.02697532, -2.646169, 0, 1, 0.8156863, 1,
-0.09499977, -0.4922672, -4.416168, 0, 1, 0.8196079, 1,
-0.08977627, 0.449496, -0.457951, 0, 1, 0.827451, 1,
-0.08523002, -0.6082551, -3.424145, 0, 1, 0.8313726, 1,
-0.08437157, -0.3602578, -3.81482, 0, 1, 0.8392157, 1,
-0.0828921, 0.6152588, 0.5101079, 0, 1, 0.8431373, 1,
-0.07887655, 1.521057, 2.663571, 0, 1, 0.8509804, 1,
-0.07670327, 1.434385, -0.0294421, 0, 1, 0.854902, 1,
-0.07311661, 1.742251, -1.714976, 0, 1, 0.8627451, 1,
-0.06973623, -0.8496603, -1.934829, 0, 1, 0.8666667, 1,
-0.06932535, -2.047451, -2.786581, 0, 1, 0.8745098, 1,
-0.0692064, -0.912049, -1.744011, 0, 1, 0.8784314, 1,
-0.06199519, 1.099208, -0.3708926, 0, 1, 0.8862745, 1,
-0.06078601, 0.1679186, 0.5969872, 0, 1, 0.8901961, 1,
-0.06050673, -1.2736, -3.542515, 0, 1, 0.8980392, 1,
-0.05850609, 0.4692842, -1.373074, 0, 1, 0.9058824, 1,
-0.05617536, 0.9508012, -0.4233748, 0, 1, 0.9098039, 1,
-0.05580167, -1.173958, -1.931199, 0, 1, 0.9176471, 1,
-0.05312376, 1.835114, 2.105368, 0, 1, 0.9215686, 1,
-0.04975979, -1.410961, -3.565223, 0, 1, 0.9294118, 1,
-0.04844377, -0.8368873, -1.736485, 0, 1, 0.9333333, 1,
-0.0465028, -2.188643, -1.514544, 0, 1, 0.9411765, 1,
-0.04475474, -1.094302, -1.726326, 0, 1, 0.945098, 1,
-0.04272186, 0.5105933, -0.1884565, 0, 1, 0.9529412, 1,
-0.04177363, 0.7956082, 3.262444, 0, 1, 0.9568627, 1,
-0.04107793, 1.432781, 0.6014861, 0, 1, 0.9647059, 1,
-0.03824782, 1.333876, -0.2348751, 0, 1, 0.9686275, 1,
-0.03761406, 0.2338145, -1.034775, 0, 1, 0.9764706, 1,
-0.02325352, -0.1953578, -4.617718, 0, 1, 0.9803922, 1,
-0.02013687, 1.609456, -1.119595, 0, 1, 0.9882353, 1,
-0.0178083, 0.2055703, 0.3152891, 0, 1, 0.9921569, 1,
-0.0174056, -0.8995568, -2.769173, 0, 1, 1, 1,
-0.0163007, 0.6711755, -0.1027224, 0, 0.9921569, 1, 1,
-0.01248963, 2.017253, -0.1221602, 0, 0.9882353, 1, 1,
-0.01155334, -0.04861479, -3.628167, 0, 0.9803922, 1, 1,
-0.01105283, -0.5869438, -1.948507, 0, 0.9764706, 1, 1,
-0.009594842, -0.9661895, -4.070526, 0, 0.9686275, 1, 1,
-0.003691493, 0.2586814, -0.8559161, 0, 0.9647059, 1, 1,
-0.003257236, -0.02042059, -1.962201, 0, 0.9568627, 1, 1,
0.0002593494, -0.5285344, 3.722286, 0, 0.9529412, 1, 1,
0.0009227737, -0.8368775, 2.501896, 0, 0.945098, 1, 1,
0.002102161, -0.6492159, 3.737789, 0, 0.9411765, 1, 1,
0.004352794, -0.221706, 3.129038, 0, 0.9333333, 1, 1,
0.004373592, -0.8432398, 2.512919, 0, 0.9294118, 1, 1,
0.004421439, 0.5883347, -1.36094, 0, 0.9215686, 1, 1,
0.004686556, -0.9036458, 3.172345, 0, 0.9176471, 1, 1,
0.00582245, -1.140897, 1.898916, 0, 0.9098039, 1, 1,
0.006210482, 0.1426465, -0.8545334, 0, 0.9058824, 1, 1,
0.01312893, -1.010245, 3.213262, 0, 0.8980392, 1, 1,
0.01760402, -1.759553, 4.657908, 0, 0.8901961, 1, 1,
0.0186533, -0.542787, 2.630763, 0, 0.8862745, 1, 1,
0.01897784, -1.19418, 2.177706, 0, 0.8784314, 1, 1,
0.01900158, -1.374957, 3.325893, 0, 0.8745098, 1, 1,
0.01946943, 0.3438805, -0.4088618, 0, 0.8666667, 1, 1,
0.01969122, -2.23933, 2.820082, 0, 0.8627451, 1, 1,
0.02131496, 0.1114478, 1.517031, 0, 0.854902, 1, 1,
0.02685354, -1.310671, 3.55596, 0, 0.8509804, 1, 1,
0.02693143, -0.688394, 2.815241, 0, 0.8431373, 1, 1,
0.02745869, -0.1670699, 3.371066, 0, 0.8392157, 1, 1,
0.0277945, 0.1942266, -1.387414, 0, 0.8313726, 1, 1,
0.02789903, -0.9833445, 3.370216, 0, 0.827451, 1, 1,
0.02793484, 0.7715407, -1.072206, 0, 0.8196079, 1, 1,
0.03097247, 1.316372, 1.260835, 0, 0.8156863, 1, 1,
0.03258365, 0.2832874, -0.5157256, 0, 0.8078431, 1, 1,
0.03377023, 0.5745385, -0.1271268, 0, 0.8039216, 1, 1,
0.03734984, -0.4985273, 4.150322, 0, 0.7960784, 1, 1,
0.03948227, -0.885736, 3.173389, 0, 0.7882353, 1, 1,
0.03953783, 0.7539073, 0.9789949, 0, 0.7843137, 1, 1,
0.03996523, 0.7723094, -0.5574749, 0, 0.7764706, 1, 1,
0.04073716, 0.5106915, -0.5506341, 0, 0.772549, 1, 1,
0.04404805, 0.6333928, 0.4413235, 0, 0.7647059, 1, 1,
0.04678677, 0.2579964, -0.3605737, 0, 0.7607843, 1, 1,
0.04958735, 0.9078291, -0.3563408, 0, 0.7529412, 1, 1,
0.05167656, -0.5974544, 3.949783, 0, 0.7490196, 1, 1,
0.05334245, 0.5348386, -0.7298331, 0, 0.7411765, 1, 1,
0.05623922, 2.68422, 0.0775551, 0, 0.7372549, 1, 1,
0.06563956, 0.7616877, 1.344875, 0, 0.7294118, 1, 1,
0.07257055, 2.348916, 0.764441, 0, 0.7254902, 1, 1,
0.0743864, 0.4212974, -0.2402593, 0, 0.7176471, 1, 1,
0.07713368, -0.5415967, 2.205986, 0, 0.7137255, 1, 1,
0.07931809, 0.7562649, 1.080735, 0, 0.7058824, 1, 1,
0.0802746, 0.1010164, 1.493671, 0, 0.6980392, 1, 1,
0.08840752, 1.073535, -0.397363, 0, 0.6941177, 1, 1,
0.08851848, 0.1666092, -0.5216009, 0, 0.6862745, 1, 1,
0.08895231, -0.7620397, 1.933332, 0, 0.682353, 1, 1,
0.0931362, -1.357719, 2.565755, 0, 0.6745098, 1, 1,
0.09385174, -0.08650325, 1.330195, 0, 0.6705883, 1, 1,
0.09388653, -0.7354201, 3.670669, 0, 0.6627451, 1, 1,
0.09985318, 0.3105477, 0.2075343, 0, 0.6588235, 1, 1,
0.103413, 1.116013, -0.5526246, 0, 0.6509804, 1, 1,
0.1071684, 0.07483678, 2.164708, 0, 0.6470588, 1, 1,
0.1079195, -0.7399021, 3.855932, 0, 0.6392157, 1, 1,
0.1089886, 0.4052689, -0.7082257, 0, 0.6352941, 1, 1,
0.1105696, -0.8036964, 2.103691, 0, 0.627451, 1, 1,
0.1133465, 1.936225, -0.2790307, 0, 0.6235294, 1, 1,
0.1136987, -0.1518405, 3.195699, 0, 0.6156863, 1, 1,
0.1177884, 0.169171, 1.503032, 0, 0.6117647, 1, 1,
0.1201546, 1.366196, 3.100152, 0, 0.6039216, 1, 1,
0.1245735, -1.507243, 3.412533, 0, 0.5960785, 1, 1,
0.1312395, -0.732451, 1.462654, 0, 0.5921569, 1, 1,
0.1316755, -0.7512323, 3.984567, 0, 0.5843138, 1, 1,
0.1321497, 0.1766158, 0.2540954, 0, 0.5803922, 1, 1,
0.1356927, -0.5353832, 3.357264, 0, 0.572549, 1, 1,
0.1360287, 1.569951, 1.776243, 0, 0.5686275, 1, 1,
0.1383973, -0.09738816, 2.365664, 0, 0.5607843, 1, 1,
0.1403083, 0.8695871, 1.709203, 0, 0.5568628, 1, 1,
0.1408345, -1.024048, 3.099775, 0, 0.5490196, 1, 1,
0.1413794, 1.056225, 2.570676, 0, 0.5450981, 1, 1,
0.1432611, 0.9034375, -0.408324, 0, 0.5372549, 1, 1,
0.1442412, -1.334987, 2.054825, 0, 0.5333334, 1, 1,
0.1500412, -0.4381848, 3.457619, 0, 0.5254902, 1, 1,
0.1505521, -0.1668732, 2.325882, 0, 0.5215687, 1, 1,
0.153249, 0.4723584, 1.498214, 0, 0.5137255, 1, 1,
0.1571179, -1.158214, 3.6818, 0, 0.509804, 1, 1,
0.1604892, -0.9099787, 1.779487, 0, 0.5019608, 1, 1,
0.1676936, -0.3634466, 3.169233, 0, 0.4941176, 1, 1,
0.1719508, -0.191454, 3.62306, 0, 0.4901961, 1, 1,
0.1726227, 0.4769538, -0.4389027, 0, 0.4823529, 1, 1,
0.1778357, 0.8574913, 0.1367273, 0, 0.4784314, 1, 1,
0.1816863, 0.6048312, 1.430325, 0, 0.4705882, 1, 1,
0.1832973, 0.02995591, 2.99834, 0, 0.4666667, 1, 1,
0.1846036, -1.095245, 2.262445, 0, 0.4588235, 1, 1,
0.1862456, -0.7498294, 2.966723, 0, 0.454902, 1, 1,
0.1878769, -0.4230049, 2.856007, 0, 0.4470588, 1, 1,
0.1886055, -0.295996, 1.429102, 0, 0.4431373, 1, 1,
0.1913727, 0.1662009, -0.02967583, 0, 0.4352941, 1, 1,
0.1925358, 0.7427029, 0.5511934, 0, 0.4313726, 1, 1,
0.1958017, 0.4681137, 0.007774901, 0, 0.4235294, 1, 1,
0.1965668, 1.872433, 0.7554837, 0, 0.4196078, 1, 1,
0.1980624, 0.0009630753, 1.330324, 0, 0.4117647, 1, 1,
0.1985129, -0.250885, 2.501812, 0, 0.4078431, 1, 1,
0.2014691, 1.981229, 0.894433, 0, 0.4, 1, 1,
0.2072184, -0.784417, 2.246791, 0, 0.3921569, 1, 1,
0.2077044, -1.029575, 4.281167, 0, 0.3882353, 1, 1,
0.210575, 0.2263058, 3.273537, 0, 0.3803922, 1, 1,
0.2106138, 0.2362796, 1.099532, 0, 0.3764706, 1, 1,
0.212135, -0.4271225, 2.966676, 0, 0.3686275, 1, 1,
0.2123031, -0.6199712, 3.329124, 0, 0.3647059, 1, 1,
0.2132818, -0.8759534, 3.280842, 0, 0.3568628, 1, 1,
0.2135621, -0.9253514, 3.803144, 0, 0.3529412, 1, 1,
0.2151715, 0.3632022, -0.8866737, 0, 0.345098, 1, 1,
0.2181307, 0.02776963, 0.811491, 0, 0.3411765, 1, 1,
0.2185724, 0.3288269, 1.552866, 0, 0.3333333, 1, 1,
0.2198389, 0.6109342, -1.1828, 0, 0.3294118, 1, 1,
0.223515, -0.9990001, 4.572231, 0, 0.3215686, 1, 1,
0.2268381, 0.7997275, 1.267702, 0, 0.3176471, 1, 1,
0.2284589, 0.3661502, 0.6386867, 0, 0.3098039, 1, 1,
0.2329483, 2.07131, -1.177007, 0, 0.3058824, 1, 1,
0.2341372, 1.301457, -0.5440122, 0, 0.2980392, 1, 1,
0.2347928, 0.3274528, -0.1568238, 0, 0.2901961, 1, 1,
0.2351013, 1.553369, -0.6799477, 0, 0.2862745, 1, 1,
0.2466244, -0.5081279, 1.303114, 0, 0.2784314, 1, 1,
0.2530063, 0.8684412, -1.027583, 0, 0.2745098, 1, 1,
0.2540897, -0.7711198, 3.039617, 0, 0.2666667, 1, 1,
0.2543875, 1.976264, 0.6090813, 0, 0.2627451, 1, 1,
0.2581328, -1.396935, 4.525569, 0, 0.254902, 1, 1,
0.2586181, 2.017292, 0.500825, 0, 0.2509804, 1, 1,
0.2595034, -0.5532176, 2.862208, 0, 0.2431373, 1, 1,
0.2616164, -1.62965, 0.7778766, 0, 0.2392157, 1, 1,
0.2662547, -1.259102, 2.869136, 0, 0.2313726, 1, 1,
0.2705853, 0.5532909, 0.05294225, 0, 0.227451, 1, 1,
0.2709869, 0.3417123, -1.150558, 0, 0.2196078, 1, 1,
0.2713792, -0.247803, 2.325624, 0, 0.2156863, 1, 1,
0.2779147, -0.09848478, 2.635991, 0, 0.2078431, 1, 1,
0.2819158, 0.4360746, -1.244536, 0, 0.2039216, 1, 1,
0.2824091, 0.2639467, -0.3756583, 0, 0.1960784, 1, 1,
0.2829835, -1.541513, 3.912906, 0, 0.1882353, 1, 1,
0.2857088, -1.74274, 1.848753, 0, 0.1843137, 1, 1,
0.2861057, -1.137119, 4.512003, 0, 0.1764706, 1, 1,
0.2863182, 0.9494108, -0.1117571, 0, 0.172549, 1, 1,
0.2864543, -0.8330244, 2.791519, 0, 0.1647059, 1, 1,
0.2956035, -0.3935401, 4.836143, 0, 0.1607843, 1, 1,
0.2992466, 1.489652, 0.1803271, 0, 0.1529412, 1, 1,
0.3041051, -0.1435471, 1.445822, 0, 0.1490196, 1, 1,
0.3047612, -0.184676, 2.083189, 0, 0.1411765, 1, 1,
0.3136264, -1.970985, 4.421758, 0, 0.1372549, 1, 1,
0.3164289, -0.6150917, 3.575613, 0, 0.1294118, 1, 1,
0.3176552, -0.8044601, 1.563815, 0, 0.1254902, 1, 1,
0.3193093, 1.220252, -0.5322299, 0, 0.1176471, 1, 1,
0.3292306, 0.369525, 1.101046, 0, 0.1137255, 1, 1,
0.3316393, 0.2678577, 1.694991, 0, 0.1058824, 1, 1,
0.3321786, 0.2174675, 3.263699, 0, 0.09803922, 1, 1,
0.3359332, -1.064768, 2.896174, 0, 0.09411765, 1, 1,
0.3394154, 1.558249, -0.2730303, 0, 0.08627451, 1, 1,
0.3488864, 0.6963103, 0.3108509, 0, 0.08235294, 1, 1,
0.3497022, 1.725993, -0.2156127, 0, 0.07450981, 1, 1,
0.3503369, -0.9606128, 4.232162, 0, 0.07058824, 1, 1,
0.352402, -1.700264, 1.124933, 0, 0.0627451, 1, 1,
0.3545428, -0.2089088, 1.518326, 0, 0.05882353, 1, 1,
0.3586897, -0.2256109, 1.449775, 0, 0.05098039, 1, 1,
0.3649195, 0.2617805, 0.5961924, 0, 0.04705882, 1, 1,
0.3679184, -0.6682558, 3.523359, 0, 0.03921569, 1, 1,
0.3741714, -1.965125, 3.541808, 0, 0.03529412, 1, 1,
0.3764457, 0.9379337, -0.9417501, 0, 0.02745098, 1, 1,
0.3831238, 0.3350485, -1.203826, 0, 0.02352941, 1, 1,
0.3856647, -0.7340978, 3.245671, 0, 0.01568628, 1, 1,
0.3876163, -0.2437792, 3.193078, 0, 0.01176471, 1, 1,
0.3877398, 1.265867, -0.7050599, 0, 0.003921569, 1, 1,
0.3928564, -0.1824272, 2.118488, 0.003921569, 0, 1, 1,
0.3969346, 3.636566, -0.395219, 0.007843138, 0, 1, 1,
0.3976928, -0.2823732, 3.118136, 0.01568628, 0, 1, 1,
0.3987798, -0.04418418, 2.826585, 0.01960784, 0, 1, 1,
0.3999164, 1.320993, -0.9691868, 0.02745098, 0, 1, 1,
0.4009205, -0.2909306, 2.871833, 0.03137255, 0, 1, 1,
0.4011462, 0.5552688, 1.683872, 0.03921569, 0, 1, 1,
0.4062769, -0.3703961, 0.933006, 0.04313726, 0, 1, 1,
0.4080079, -0.1220227, 1.810224, 0.05098039, 0, 1, 1,
0.410704, -0.7378333, 3.937548, 0.05490196, 0, 1, 1,
0.4137703, 1.295448, -1.959484, 0.0627451, 0, 1, 1,
0.4156269, -0.3467732, 2.305777, 0.06666667, 0, 1, 1,
0.4227682, 0.06532158, 0.5132124, 0.07450981, 0, 1, 1,
0.4275792, 0.3364713, 3.959979, 0.07843138, 0, 1, 1,
0.4320712, 0.9511445, -1.551655, 0.08627451, 0, 1, 1,
0.4380765, 1.340275, -1.784982, 0.09019608, 0, 1, 1,
0.4381999, -0.1145599, 2.099104, 0.09803922, 0, 1, 1,
0.4399608, 0.4276184, -0.7205994, 0.1058824, 0, 1, 1,
0.4415944, 2.9998, 0.5075839, 0.1098039, 0, 1, 1,
0.4433203, -0.1362384, 1.896278, 0.1176471, 0, 1, 1,
0.443437, -0.7897071, 2.887666, 0.1215686, 0, 1, 1,
0.4454025, -0.6969166, 4.247488, 0.1294118, 0, 1, 1,
0.4481703, 0.01600805, 1.530219, 0.1333333, 0, 1, 1,
0.4493692, 0.641751, 0.3811657, 0.1411765, 0, 1, 1,
0.4523895, -1.412628, 2.475974, 0.145098, 0, 1, 1,
0.4602639, 1.774144, 0.8631259, 0.1529412, 0, 1, 1,
0.4609062, -0.1465976, 3.907619, 0.1568628, 0, 1, 1,
0.4615228, 1.099487, -0.4403057, 0.1647059, 0, 1, 1,
0.465459, 1.134684, -0.4923803, 0.1686275, 0, 1, 1,
0.4672146, -1.178155, 2.298058, 0.1764706, 0, 1, 1,
0.4690992, 0.880047, -0.6731463, 0.1803922, 0, 1, 1,
0.4743159, 0.2371861, 0.7143579, 0.1882353, 0, 1, 1,
0.483182, -0.426203, 2.019615, 0.1921569, 0, 1, 1,
0.4835722, -0.002521157, 0.3643703, 0.2, 0, 1, 1,
0.484302, 1.416338, 1.4956, 0.2078431, 0, 1, 1,
0.4865106, 0.2356044, -0.3396323, 0.2117647, 0, 1, 1,
0.4908658, 0.3141201, 1.553386, 0.2196078, 0, 1, 1,
0.4970321, 1.228673, -0.9341871, 0.2235294, 0, 1, 1,
0.4997512, -2.13936, 1.800637, 0.2313726, 0, 1, 1,
0.5009077, 0.1185371, 1.23298, 0.2352941, 0, 1, 1,
0.5011213, -0.9499624, 0.9354895, 0.2431373, 0, 1, 1,
0.502726, -0.718826, 2.140302, 0.2470588, 0, 1, 1,
0.5029387, 0.633732, 1.739613, 0.254902, 0, 1, 1,
0.5040066, 0.1072837, 0.5562772, 0.2588235, 0, 1, 1,
0.5063186, 0.8737571, 1.905701, 0.2666667, 0, 1, 1,
0.5073327, -0.2172658, 2.41321, 0.2705882, 0, 1, 1,
0.5078717, -1.897384, 3.409574, 0.2784314, 0, 1, 1,
0.5100378, 0.6212795, 1.647125, 0.282353, 0, 1, 1,
0.5149491, 0.9648671, 0.129406, 0.2901961, 0, 1, 1,
0.5171279, 0.4182692, 1.514048, 0.2941177, 0, 1, 1,
0.5194342, 0.4141591, 1.83603, 0.3019608, 0, 1, 1,
0.5217744, -2.00725, 2.917333, 0.3098039, 0, 1, 1,
0.5233448, 1.212632, -0.9163787, 0.3137255, 0, 1, 1,
0.5247349, -1.576809, 1.776645, 0.3215686, 0, 1, 1,
0.5256179, -0.9280778, 3.228948, 0.3254902, 0, 1, 1,
0.5303735, 0.8225878, -0.9023509, 0.3333333, 0, 1, 1,
0.5311697, -0.8035108, 3.522699, 0.3372549, 0, 1, 1,
0.5331793, 0.2969252, 0.5179754, 0.345098, 0, 1, 1,
0.5374891, 0.4386891, 1.460733, 0.3490196, 0, 1, 1,
0.5417842, -0.7641611, 2.716926, 0.3568628, 0, 1, 1,
0.5419263, -1.025941, 0.6475253, 0.3607843, 0, 1, 1,
0.5424372, 0.2934117, 1.506049, 0.3686275, 0, 1, 1,
0.5487468, 1.395352, 0.8359033, 0.372549, 0, 1, 1,
0.5506837, -1.13899, 3.058531, 0.3803922, 0, 1, 1,
0.5525658, 0.3561658, -0.2937266, 0.3843137, 0, 1, 1,
0.5534506, 0.994563, -0.7283336, 0.3921569, 0, 1, 1,
0.5638025, 0.138107, 0.814365, 0.3960784, 0, 1, 1,
0.5647461, 1.158805, -1.474887, 0.4039216, 0, 1, 1,
0.5649046, 0.6966332, -0.278567, 0.4117647, 0, 1, 1,
0.5656011, -1.507607, 0.2743858, 0.4156863, 0, 1, 1,
0.5676766, 1.099054, -0.8600689, 0.4235294, 0, 1, 1,
0.5756791, -0.1445767, 1.495285, 0.427451, 0, 1, 1,
0.5811334, 1.788556, 0.2509722, 0.4352941, 0, 1, 1,
0.582036, -1.127841, 3.015913, 0.4392157, 0, 1, 1,
0.5945607, -1.425304, 3.115118, 0.4470588, 0, 1, 1,
0.598601, -0.3814706, 3.089391, 0.4509804, 0, 1, 1,
0.6060603, 0.4119663, 0.870775, 0.4588235, 0, 1, 1,
0.6152099, 0.2042133, 0.5690708, 0.4627451, 0, 1, 1,
0.6194328, 1.212542, 0.2702016, 0.4705882, 0, 1, 1,
0.6263365, -1.105983, 3.626771, 0.4745098, 0, 1, 1,
0.626355, 1.075557, -0.003636817, 0.4823529, 0, 1, 1,
0.6289195, 0.8132623, 1.995966, 0.4862745, 0, 1, 1,
0.6301302, 0.1891424, 1.409155, 0.4941176, 0, 1, 1,
0.6317607, -1.277416, 3.657154, 0.5019608, 0, 1, 1,
0.6375062, 0.1586861, 1.715728, 0.5058824, 0, 1, 1,
0.6403788, -0.8915642, 3.053483, 0.5137255, 0, 1, 1,
0.6419842, -1.018502, 2.602075, 0.5176471, 0, 1, 1,
0.6436518, 2.000324, 1.090034, 0.5254902, 0, 1, 1,
0.6510443, 0.1131535, 2.379636, 0.5294118, 0, 1, 1,
0.655593, 0.6145052, 3.092812, 0.5372549, 0, 1, 1,
0.6583495, 0.2441785, 3.211527, 0.5411765, 0, 1, 1,
0.6617094, -1.350025, 1.60567, 0.5490196, 0, 1, 1,
0.6663198, -0.8678056, 1.004642, 0.5529412, 0, 1, 1,
0.6675633, 0.9752526, 2.163654, 0.5607843, 0, 1, 1,
0.6688188, 0.04009595, 0.6407368, 0.5647059, 0, 1, 1,
0.6716475, -1.966449, 4.446566, 0.572549, 0, 1, 1,
0.6782157, 0.5607589, 0.3860563, 0.5764706, 0, 1, 1,
0.6786503, 0.9641801, -0.1602315, 0.5843138, 0, 1, 1,
0.6843727, 1.17642, 1.132687, 0.5882353, 0, 1, 1,
0.6948833, -0.5086523, 2.298444, 0.5960785, 0, 1, 1,
0.695177, -4.077242, 4.062097, 0.6039216, 0, 1, 1,
0.6962551, -1.41359, 3.399633, 0.6078432, 0, 1, 1,
0.7000782, 0.5842324, -0.06820069, 0.6156863, 0, 1, 1,
0.7099377, 0.7623296, 3.351504, 0.6196079, 0, 1, 1,
0.711234, 0.9229446, -0.3494176, 0.627451, 0, 1, 1,
0.7131871, 0.964288, 0.399419, 0.6313726, 0, 1, 1,
0.7239969, 2.393588, -0.1263417, 0.6392157, 0, 1, 1,
0.7268353, 0.3428154, 1.487342, 0.6431373, 0, 1, 1,
0.7403598, 1.090323, 1.309045, 0.6509804, 0, 1, 1,
0.7459726, 0.7457982, -0.02298757, 0.654902, 0, 1, 1,
0.7519871, 1.39435, 2.125932, 0.6627451, 0, 1, 1,
0.7563866, -0.436383, 1.933411, 0.6666667, 0, 1, 1,
0.7635456, 0.3221448, 2.096382, 0.6745098, 0, 1, 1,
0.7753945, 0.2676405, 1.393444, 0.6784314, 0, 1, 1,
0.77835, -0.997446, 1.090343, 0.6862745, 0, 1, 1,
0.7784845, 1.815311, 1.511185, 0.6901961, 0, 1, 1,
0.7841256, -0.8591852, 2.784257, 0.6980392, 0, 1, 1,
0.7883911, -0.8275717, 3.416034, 0.7058824, 0, 1, 1,
0.7928016, 1.167496, 0.5601071, 0.7098039, 0, 1, 1,
0.7929052, -0.4119061, 2.126439, 0.7176471, 0, 1, 1,
0.7984141, 1.391878, 2.311241, 0.7215686, 0, 1, 1,
0.7993923, 0.7475242, 1.904296, 0.7294118, 0, 1, 1,
0.7994167, -1.217788, 2.859328, 0.7333333, 0, 1, 1,
0.8018433, -0.1100416, 1.995892, 0.7411765, 0, 1, 1,
0.8073791, -2.276434, 1.261664, 0.7450981, 0, 1, 1,
0.812681, 0.4318119, 1.427723, 0.7529412, 0, 1, 1,
0.8156333, 0.8118515, 1.633223, 0.7568628, 0, 1, 1,
0.8163145, -0.7220879, 2.802485, 0.7647059, 0, 1, 1,
0.8176034, 1.745056, 1.162898, 0.7686275, 0, 1, 1,
0.8205433, -1.198304, 2.88603, 0.7764706, 0, 1, 1,
0.8231599, -1.799478, 4.425383, 0.7803922, 0, 1, 1,
0.8252844, -1.082672, 1.587784, 0.7882353, 0, 1, 1,
0.8334136, -0.2208614, 2.7433, 0.7921569, 0, 1, 1,
0.8354975, -0.7096056, 2.156137, 0.8, 0, 1, 1,
0.8376015, -0.2597797, 2.468358, 0.8078431, 0, 1, 1,
0.8376568, -0.113761, 1.574221, 0.8117647, 0, 1, 1,
0.850179, 0.3292228, -0.2337091, 0.8196079, 0, 1, 1,
0.8511198, 2.525654, 0.585438, 0.8235294, 0, 1, 1,
0.8523583, -1.047375, 2.269854, 0.8313726, 0, 1, 1,
0.853178, 1.009246, 1.402009, 0.8352941, 0, 1, 1,
0.8595222, -1.307511, 1.107593, 0.8431373, 0, 1, 1,
0.8605129, 0.9150226, -0.6196303, 0.8470588, 0, 1, 1,
0.8611736, 1.378015, 1.158196, 0.854902, 0, 1, 1,
0.8664038, 0.3533089, -0.4120361, 0.8588235, 0, 1, 1,
0.8699765, 0.05921466, 2.364084, 0.8666667, 0, 1, 1,
0.8790891, 0.9515489, 2.292579, 0.8705882, 0, 1, 1,
0.8808559, -0.006391033, 0.6986735, 0.8784314, 0, 1, 1,
0.8895649, -0.6940989, 3.496258, 0.8823529, 0, 1, 1,
0.8912055, 1.742748, 0.1017461, 0.8901961, 0, 1, 1,
0.8953991, -0.7349329, 3.060134, 0.8941177, 0, 1, 1,
0.8964285, -1.16027, 2.724474, 0.9019608, 0, 1, 1,
0.8974587, -0.4192746, 2.068701, 0.9098039, 0, 1, 1,
0.8980758, 0.2785945, 2.839528, 0.9137255, 0, 1, 1,
0.9017632, 0.7954574, -0.3781034, 0.9215686, 0, 1, 1,
0.9019611, 0.6637554, 1.537718, 0.9254902, 0, 1, 1,
0.9030114, -1.810519, 1.567255, 0.9333333, 0, 1, 1,
0.9095723, -2.024521, 2.729599, 0.9372549, 0, 1, 1,
0.9115011, -0.3605775, 2.065425, 0.945098, 0, 1, 1,
0.913188, 0.5207123, 0.4295211, 0.9490196, 0, 1, 1,
0.9140047, 1.534707, 1.015187, 0.9568627, 0, 1, 1,
0.9157003, -0.3808018, 3.088112, 0.9607843, 0, 1, 1,
0.9165093, 0.7806622, -1.123466, 0.9686275, 0, 1, 1,
0.9217004, 0.2627487, -0.453414, 0.972549, 0, 1, 1,
0.9244601, 0.1806508, 0.3067387, 0.9803922, 0, 1, 1,
0.9274963, 0.9932399, 0.2098341, 0.9843137, 0, 1, 1,
0.9290698, 0.5566061, 1.565541, 0.9921569, 0, 1, 1,
0.9297317, -0.7171896, 1.094978, 0.9960784, 0, 1, 1,
0.9314099, 2.637503, 0.9486861, 1, 0, 0.9960784, 1,
0.9327959, -0.2668755, 2.203238, 1, 0, 0.9882353, 1,
0.9365014, 0.2495279, 1.263518, 1, 0, 0.9843137, 1,
0.9394746, -0.5973253, 2.301001, 1, 0, 0.9764706, 1,
0.9452149, -1.315464, 1.588173, 1, 0, 0.972549, 1,
0.9556414, -0.08780078, 1.697861, 1, 0, 0.9647059, 1,
0.9640911, -1.41766, 3.497111, 1, 0, 0.9607843, 1,
0.9661881, -1.030187, 3.729308, 1, 0, 0.9529412, 1,
0.9723772, 0.384656, 0.5770606, 1, 0, 0.9490196, 1,
0.9747498, 0.6429897, 0.5218264, 1, 0, 0.9411765, 1,
0.9784386, 0.5986456, 1.329482, 1, 0, 0.9372549, 1,
0.9862436, 0.02098329, 0.9998059, 1, 0, 0.9294118, 1,
0.9884904, 0.05598775, 0.751926, 1, 0, 0.9254902, 1,
0.9983808, 0.7311872, 0.6641386, 1, 0, 0.9176471, 1,
1.005211, 1.17836, 0.1607531, 1, 0, 0.9137255, 1,
1.008153, 1.762397, 3.555481, 1, 0, 0.9058824, 1,
1.009526, -0.2301487, 3.655, 1, 0, 0.9019608, 1,
1.014417, 0.24367, 0.5868417, 1, 0, 0.8941177, 1,
1.017066, 1.253467, 0.5712367, 1, 0, 0.8862745, 1,
1.020099, -1.020323, 0.2880578, 1, 0, 0.8823529, 1,
1.026612, 0.2368912, 1.265674, 1, 0, 0.8745098, 1,
1.034156, 0.5980309, -0.2030432, 1, 0, 0.8705882, 1,
1.036315, -0.1637859, 2.908446, 1, 0, 0.8627451, 1,
1.039032, 2.782327, 0.5620971, 1, 0, 0.8588235, 1,
1.040867, -0.1671773, 2.669909, 1, 0, 0.8509804, 1,
1.046739, 0.2870222, 0.6229514, 1, 0, 0.8470588, 1,
1.052823, 0.1543099, 0.02025289, 1, 0, 0.8392157, 1,
1.058905, 1.213305, 3.61749, 1, 0, 0.8352941, 1,
1.067596, -0.1148697, 2.624106, 1, 0, 0.827451, 1,
1.07036, 0.5421279, 0.6382805, 1, 0, 0.8235294, 1,
1.073689, 0.2630371, -0.242977, 1, 0, 0.8156863, 1,
1.086115, 0.003190719, 2.044674, 1, 0, 0.8117647, 1,
1.088999, 1.001317, -0.2743641, 1, 0, 0.8039216, 1,
1.089528, -0.2749654, 0.9594483, 1, 0, 0.7960784, 1,
1.089741, -0.3245512, 3.322787, 1, 0, 0.7921569, 1,
1.09042, -1.105991, 0.8799593, 1, 0, 0.7843137, 1,
1.096238, -0.1667103, 2.005927, 1, 0, 0.7803922, 1,
1.099314, 0.764201, 0.2740386, 1, 0, 0.772549, 1,
1.105163, -0.07206436, 0.8170459, 1, 0, 0.7686275, 1,
1.106324, 0.2586786, 0.2140715, 1, 0, 0.7607843, 1,
1.106406, 0.7984142, -0.181008, 1, 0, 0.7568628, 1,
1.109009, 0.182962, -0.4454453, 1, 0, 0.7490196, 1,
1.110715, 0.2479138, 1.725833, 1, 0, 0.7450981, 1,
1.117182, -1.177669, 2.189485, 1, 0, 0.7372549, 1,
1.128231, 0.2922778, 1.280792, 1, 0, 0.7333333, 1,
1.129616, 0.05047916, 1.752221, 1, 0, 0.7254902, 1,
1.134803, -1.579942, 0.2546232, 1, 0, 0.7215686, 1,
1.135304, -0.7255876, 2.165073, 1, 0, 0.7137255, 1,
1.136127, 0.4328516, 1.37267, 1, 0, 0.7098039, 1,
1.141587, 1.514526, 0.2558195, 1, 0, 0.7019608, 1,
1.146453, 0.9734416, 0.2098499, 1, 0, 0.6941177, 1,
1.147751, -0.05029838, 0.8167889, 1, 0, 0.6901961, 1,
1.154877, 0.7099382, 0.9265569, 1, 0, 0.682353, 1,
1.16129, 0.1814453, 1.35549, 1, 0, 0.6784314, 1,
1.164675, -0.2128235, 1.136922, 1, 0, 0.6705883, 1,
1.16522, 0.2741078, 0.9551503, 1, 0, 0.6666667, 1,
1.187931, 1.852728, 0.2041607, 1, 0, 0.6588235, 1,
1.192258, -0.4626538, 4.293697, 1, 0, 0.654902, 1,
1.198596, -0.8946231, 1.054989, 1, 0, 0.6470588, 1,
1.198971, -0.06417528, 3.215601, 1, 0, 0.6431373, 1,
1.200205, -2.279438, 3.358176, 1, 0, 0.6352941, 1,
1.201544, -0.9275654, 3.121658, 1, 0, 0.6313726, 1,
1.224994, 0.8326566, 0.9481222, 1, 0, 0.6235294, 1,
1.228577, 0.1665425, 1.865122, 1, 0, 0.6196079, 1,
1.238647, -1.000026, 4.123005, 1, 0, 0.6117647, 1,
1.24907, -1.474176, 1.48332, 1, 0, 0.6078432, 1,
1.252361, -0.9113236, 2.825123, 1, 0, 0.6, 1,
1.255208, -1.144135, 4.196448, 1, 0, 0.5921569, 1,
1.257786, -0.5485644, 1.762376, 1, 0, 0.5882353, 1,
1.26028, 0.3649817, -1.048104, 1, 0, 0.5803922, 1,
1.266729, -0.2085714, -0.005893255, 1, 0, 0.5764706, 1,
1.271322, -0.5106348, 1.359711, 1, 0, 0.5686275, 1,
1.274742, 2.16291, 0.4735588, 1, 0, 0.5647059, 1,
1.27912, -1.111026, 2.933596, 1, 0, 0.5568628, 1,
1.282733, -1.52941, 3.142564, 1, 0, 0.5529412, 1,
1.285001, 0.4456361, 1.932839, 1, 0, 0.5450981, 1,
1.291454, 0.8710214, 1.625454, 1, 0, 0.5411765, 1,
1.293617, 0.749943, 1.849504, 1, 0, 0.5333334, 1,
1.297351, -0.05906244, 2.207809, 1, 0, 0.5294118, 1,
1.306341, -0.3914607, 2.078023, 1, 0, 0.5215687, 1,
1.307757, -0.4014962, 0.7054252, 1, 0, 0.5176471, 1,
1.317546, -0.749969, 2.585299, 1, 0, 0.509804, 1,
1.317864, -0.172709, 2.568079, 1, 0, 0.5058824, 1,
1.324435, 0.5868093, 0.6248208, 1, 0, 0.4980392, 1,
1.324621, 0.04797887, 0.9109805, 1, 0, 0.4901961, 1,
1.328368, 0.6607442, 1.77383, 1, 0, 0.4862745, 1,
1.330771, 1.692109, 1.518008, 1, 0, 0.4784314, 1,
1.347484, 0.8179033, 1.249452, 1, 0, 0.4745098, 1,
1.347925, 0.9578328, 0.1656267, 1, 0, 0.4666667, 1,
1.376048, -1.801123, 2.687657, 1, 0, 0.4627451, 1,
1.382691, -0.8046452, 0.8290511, 1, 0, 0.454902, 1,
1.388195, 1.928232, 0.2466951, 1, 0, 0.4509804, 1,
1.400172, 0.3210425, 1.867073, 1, 0, 0.4431373, 1,
1.408203, 0.780376, 0.5083585, 1, 0, 0.4392157, 1,
1.412204, 0.2836511, 0.815818, 1, 0, 0.4313726, 1,
1.420422, 0.5282265, 2.188616, 1, 0, 0.427451, 1,
1.422858, 0.2890735, -0.3485604, 1, 0, 0.4196078, 1,
1.42598, 1.637697, 1.165919, 1, 0, 0.4156863, 1,
1.448936, 1.246068, -1.044173, 1, 0, 0.4078431, 1,
1.449359, -0.3170026, 0.5716861, 1, 0, 0.4039216, 1,
1.450861, -1.773377, 2.820963, 1, 0, 0.3960784, 1,
1.453509, -0.8836206, 3.438815, 1, 0, 0.3882353, 1,
1.467576, 0.4282617, 0.4015183, 1, 0, 0.3843137, 1,
1.480468, 0.5373851, 2.469128, 1, 0, 0.3764706, 1,
1.481357, 1.19529, -1.217794, 1, 0, 0.372549, 1,
1.484394, -0.699137, -0.1106118, 1, 0, 0.3647059, 1,
1.49267, -0.9253294, 1.18825, 1, 0, 0.3607843, 1,
1.499882, -1.752502, 2.246976, 1, 0, 0.3529412, 1,
1.502232, 0.6738449, 0.2662516, 1, 0, 0.3490196, 1,
1.537222, -0.6890594, 1.053251, 1, 0, 0.3411765, 1,
1.540557, -1.104213, 3.028375, 1, 0, 0.3372549, 1,
1.55062, 1.465284, 2.406293, 1, 0, 0.3294118, 1,
1.554675, 0.6967731, 1.498044, 1, 0, 0.3254902, 1,
1.591561, 1.164661, 2.463591, 1, 0, 0.3176471, 1,
1.62115, -0.003559153, 0.7447933, 1, 0, 0.3137255, 1,
1.635568, 1.032467, 0.6462764, 1, 0, 0.3058824, 1,
1.635627, 0.1592712, 2.113422, 1, 0, 0.2980392, 1,
1.635807, 0.2612015, 1.627666, 1, 0, 0.2941177, 1,
1.636391, -0.007023794, 1.625207, 1, 0, 0.2862745, 1,
1.648955, -0.6024723, 2.13254, 1, 0, 0.282353, 1,
1.65395, 0.9983095, 0.425714, 1, 0, 0.2745098, 1,
1.656793, 0.2909374, 3.818497, 1, 0, 0.2705882, 1,
1.675813, 1.20358, 1.281885, 1, 0, 0.2627451, 1,
1.676589, 1.493401, 2.315025, 1, 0, 0.2588235, 1,
1.699027, 1.978742, 1.744948, 1, 0, 0.2509804, 1,
1.714453, -1.424565, 0.8456005, 1, 0, 0.2470588, 1,
1.731442, 0.3577826, 2.487843, 1, 0, 0.2392157, 1,
1.740096, -0.2979697, 2.065336, 1, 0, 0.2352941, 1,
1.758668, 0.6060989, 0.2201726, 1, 0, 0.227451, 1,
1.772086, 1.035183, 0.6623014, 1, 0, 0.2235294, 1,
1.817675, 1.055726, 0.02861486, 1, 0, 0.2156863, 1,
1.826202, 1.206447, 2.248713, 1, 0, 0.2117647, 1,
1.837084, -1.413449, 1.318318, 1, 0, 0.2039216, 1,
1.844256, 0.4955722, 0.8190973, 1, 0, 0.1960784, 1,
1.844849, -1.066257, 1.070419, 1, 0, 0.1921569, 1,
1.881099, -0.5281118, 0.7003817, 1, 0, 0.1843137, 1,
1.927204, -1.01344, 2.171519, 1, 0, 0.1803922, 1,
1.945083, -0.9463209, 0.851588, 1, 0, 0.172549, 1,
1.948409, 0.4501457, 0.7805972, 1, 0, 0.1686275, 1,
1.957548, 1.636979, 2.45144, 1, 0, 0.1607843, 1,
1.98338, 1.051127, 1.60187, 1, 0, 0.1568628, 1,
1.986215, -0.4591195, 2.350411, 1, 0, 0.1490196, 1,
2.002307, -0.8260502, 1.42003, 1, 0, 0.145098, 1,
2.020226, 0.8994839, 1.205148, 1, 0, 0.1372549, 1,
2.052224, -0.4559805, 1.387808, 1, 0, 0.1333333, 1,
2.075772, -0.1562507, 2.986733, 1, 0, 0.1254902, 1,
2.075826, 1.012202, 1.817543, 1, 0, 0.1215686, 1,
2.080953, 1.033087, 2.838705, 1, 0, 0.1137255, 1,
2.091726, -0.5347524, 0.6225756, 1, 0, 0.1098039, 1,
2.102267, -0.686341, 3.377331, 1, 0, 0.1019608, 1,
2.152727, -0.612391, 2.465447, 1, 0, 0.09411765, 1,
2.175644, -0.02604123, 0.007322203, 1, 0, 0.09019608, 1,
2.198222, -1.36048, 2.108319, 1, 0, 0.08235294, 1,
2.201249, -0.5374874, 2.355015, 1, 0, 0.07843138, 1,
2.275527, -1.244058, 1.895371, 1, 0, 0.07058824, 1,
2.298632, -0.2950324, 3.150968, 1, 0, 0.06666667, 1,
2.349741, 1.07432, -0.4920413, 1, 0, 0.05882353, 1,
2.386591, 0.5075788, 1.904393, 1, 0, 0.05490196, 1,
2.409759, -0.4690255, 1.690381, 1, 0, 0.04705882, 1,
2.487698, 0.4870684, 1.839873, 1, 0, 0.04313726, 1,
2.48843, -0.1392404, 2.074809, 1, 0, 0.03529412, 1,
2.535721, -1.718257, 2.845518, 1, 0, 0.03137255, 1,
2.623062, 0.3376373, 1.658559, 1, 0, 0.02352941, 1,
2.649148, -0.1114432, 1.648376, 1, 0, 0.01960784, 1,
2.671989, -0.2240596, 1.102161, 1, 0, 0.01176471, 1,
3.556808, 0.1068267, 1.660506, 1, 0, 0.007843138, 1
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
-0.03991044, -5.384733, -6.565355, 0, -0.5, 0.5, 0.5,
-0.03991044, -5.384733, -6.565355, 1, -0.5, 0.5, 0.5,
-0.03991044, -5.384733, -6.565355, 1, 1.5, 0.5, 0.5,
-0.03991044, -5.384733, -6.565355, 0, 1.5, 0.5, 0.5
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
-4.855916, -0.2203383, -6.565355, 0, -0.5, 0.5, 0.5,
-4.855916, -0.2203383, -6.565355, 1, -0.5, 0.5, 0.5,
-4.855916, -0.2203383, -6.565355, 1, 1.5, 0.5, 0.5,
-4.855916, -0.2203383, -6.565355, 0, 1.5, 0.5, 0.5
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
-4.855916, -5.384733, -0.0383749, 0, -0.5, 0.5, 0.5,
-4.855916, -5.384733, -0.0383749, 1, -0.5, 0.5, 0.5,
-4.855916, -5.384733, -0.0383749, 1, 1.5, 0.5, 0.5,
-4.855916, -5.384733, -0.0383749, 0, 1.5, 0.5, 0.5
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
-2, -4.192949, -5.059129,
2, -4.192949, -5.059129,
-2, -4.192949, -5.059129,
-2, -4.39158, -5.310166,
0, -4.192949, -5.059129,
0, -4.39158, -5.310166,
2, -4.192949, -5.059129,
2, -4.39158, -5.310166
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
"0",
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
-2, -4.788841, -5.812242, 0, -0.5, 0.5, 0.5,
-2, -4.788841, -5.812242, 1, -0.5, 0.5, 0.5,
-2, -4.788841, -5.812242, 1, 1.5, 0.5, 0.5,
-2, -4.788841, -5.812242, 0, 1.5, 0.5, 0.5,
0, -4.788841, -5.812242, 0, -0.5, 0.5, 0.5,
0, -4.788841, -5.812242, 1, -0.5, 0.5, 0.5,
0, -4.788841, -5.812242, 1, 1.5, 0.5, 0.5,
0, -4.788841, -5.812242, 0, 1.5, 0.5, 0.5,
2, -4.788841, -5.812242, 0, -0.5, 0.5, 0.5,
2, -4.788841, -5.812242, 1, -0.5, 0.5, 0.5,
2, -4.788841, -5.812242, 1, 1.5, 0.5, 0.5,
2, -4.788841, -5.812242, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.74453, -4, -5.059129,
-3.74453, 2, -5.059129,
-3.74453, -4, -5.059129,
-3.929761, -4, -5.310166,
-3.74453, -2, -5.059129,
-3.929761, -2, -5.310166,
-3.74453, 0, -5.059129,
-3.929761, 0, -5.310166,
-3.74453, 2, -5.059129,
-3.929761, 2, -5.310166
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
"-4",
"-2",
"0",
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
-4.300223, -4, -5.812242, 0, -0.5, 0.5, 0.5,
-4.300223, -4, -5.812242, 1, -0.5, 0.5, 0.5,
-4.300223, -4, -5.812242, 1, 1.5, 0.5, 0.5,
-4.300223, -4, -5.812242, 0, 1.5, 0.5, 0.5,
-4.300223, -2, -5.812242, 0, -0.5, 0.5, 0.5,
-4.300223, -2, -5.812242, 1, -0.5, 0.5, 0.5,
-4.300223, -2, -5.812242, 1, 1.5, 0.5, 0.5,
-4.300223, -2, -5.812242, 0, 1.5, 0.5, 0.5,
-4.300223, 0, -5.812242, 0, -0.5, 0.5, 0.5,
-4.300223, 0, -5.812242, 1, -0.5, 0.5, 0.5,
-4.300223, 0, -5.812242, 1, 1.5, 0.5, 0.5,
-4.300223, 0, -5.812242, 0, 1.5, 0.5, 0.5,
-4.300223, 2, -5.812242, 0, -0.5, 0.5, 0.5,
-4.300223, 2, -5.812242, 1, -0.5, 0.5, 0.5,
-4.300223, 2, -5.812242, 1, 1.5, 0.5, 0.5,
-4.300223, 2, -5.812242, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.74453, -4.192949, -4,
-3.74453, -4.192949, 4,
-3.74453, -4.192949, -4,
-3.929761, -4.39158, -4,
-3.74453, -4.192949, -2,
-3.929761, -4.39158, -2,
-3.74453, -4.192949, 0,
-3.929761, -4.39158, 0,
-3.74453, -4.192949, 2,
-3.929761, -4.39158, 2,
-3.74453, -4.192949, 4,
-3.929761, -4.39158, 4
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
-4.300223, -4.788841, -4, 0, -0.5, 0.5, 0.5,
-4.300223, -4.788841, -4, 1, -0.5, 0.5, 0.5,
-4.300223, -4.788841, -4, 1, 1.5, 0.5, 0.5,
-4.300223, -4.788841, -4, 0, 1.5, 0.5, 0.5,
-4.300223, -4.788841, -2, 0, -0.5, 0.5, 0.5,
-4.300223, -4.788841, -2, 1, -0.5, 0.5, 0.5,
-4.300223, -4.788841, -2, 1, 1.5, 0.5, 0.5,
-4.300223, -4.788841, -2, 0, 1.5, 0.5, 0.5,
-4.300223, -4.788841, 0, 0, -0.5, 0.5, 0.5,
-4.300223, -4.788841, 0, 1, -0.5, 0.5, 0.5,
-4.300223, -4.788841, 0, 1, 1.5, 0.5, 0.5,
-4.300223, -4.788841, 0, 0, 1.5, 0.5, 0.5,
-4.300223, -4.788841, 2, 0, -0.5, 0.5, 0.5,
-4.300223, -4.788841, 2, 1, -0.5, 0.5, 0.5,
-4.300223, -4.788841, 2, 1, 1.5, 0.5, 0.5,
-4.300223, -4.788841, 2, 0, 1.5, 0.5, 0.5,
-4.300223, -4.788841, 4, 0, -0.5, 0.5, 0.5,
-4.300223, -4.788841, 4, 1, -0.5, 0.5, 0.5,
-4.300223, -4.788841, 4, 1, 1.5, 0.5, 0.5,
-4.300223, -4.788841, 4, 0, 1.5, 0.5, 0.5
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
-3.74453, -4.192949, -5.059129,
-3.74453, 3.752273, -5.059129,
-3.74453, -4.192949, 4.982379,
-3.74453, 3.752273, 4.982379,
-3.74453, -4.192949, -5.059129,
-3.74453, -4.192949, 4.982379,
-3.74453, 3.752273, -5.059129,
-3.74453, 3.752273, 4.982379,
-3.74453, -4.192949, -5.059129,
3.664709, -4.192949, -5.059129,
-3.74453, -4.192949, 4.982379,
3.664709, -4.192949, 4.982379,
-3.74453, 3.752273, -5.059129,
3.664709, 3.752273, -5.059129,
-3.74453, 3.752273, 4.982379,
3.664709, 3.752273, 4.982379,
3.664709, -4.192949, -5.059129,
3.664709, 3.752273, -5.059129,
3.664709, -4.192949, 4.982379,
3.664709, 3.752273, 4.982379,
3.664709, -4.192949, -5.059129,
3.664709, -4.192949, 4.982379,
3.664709, 3.752273, -5.059129,
3.664709, 3.752273, 4.982379
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
var radius = 7.899579;
var distance = 35.14612;
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
mvMatrix.translate( 0.03991044, 0.2203383, 0.0383749 );
mvMatrix.scale( 1.152774, 1.075008, 0.8505874 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.14612);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
triazamate<-read.table("triazamate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triazamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'triazamate' not found
```

```r
y<-triazamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'triazamate' not found
```

```r
z<-triazamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'triazamate' not found
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
-3.636628, 1.308695, -1.395405, 0, 0, 1, 1, 1,
-2.919109, -0.01050821, -1.349864, 1, 0, 0, 1, 1,
-2.640205, -0.7843698, -1.366674, 1, 0, 0, 1, 1,
-2.621815, -1.155172, -1.624291, 1, 0, 0, 1, 1,
-2.515822, -0.5027909, -1.273315, 1, 0, 0, 1, 1,
-2.470144, -0.8967401, 0.8294743, 1, 0, 0, 1, 1,
-2.377545, 0.2196504, -2.544208, 0, 0, 0, 1, 1,
-2.375963, -0.4202775, -2.398388, 0, 0, 0, 1, 1,
-2.293219, 0.8169526, -0.2428477, 0, 0, 0, 1, 1,
-2.263238, -0.07774153, -1.112285, 0, 0, 0, 1, 1,
-2.244259, -0.4804669, -0.1256514, 0, 0, 0, 1, 1,
-2.243799, -1.413604, -2.574015, 0, 0, 0, 1, 1,
-2.207773, -0.8084127, -0.6559737, 0, 0, 0, 1, 1,
-2.070089, -0.310862, -2.885112, 1, 1, 1, 1, 1,
-1.995791, 0.9847201, -1.569957, 1, 1, 1, 1, 1,
-1.989286, -0.7147076, -1.907797, 1, 1, 1, 1, 1,
-1.970359, -1.317207, -2.821754, 1, 1, 1, 1, 1,
-1.958361, -0.3282278, -0.6460742, 1, 1, 1, 1, 1,
-1.917364, -0.4448316, -1.796051, 1, 1, 1, 1, 1,
-1.906316, 0.5195991, -1.050862, 1, 1, 1, 1, 1,
-1.902512, 0.3892062, -1.116727, 1, 1, 1, 1, 1,
-1.884437, -1.352432, -2.809616, 1, 1, 1, 1, 1,
-1.879982, 0.2070353, -3.806157, 1, 1, 1, 1, 1,
-1.875113, -1.518826, -2.155066, 1, 1, 1, 1, 1,
-1.870597, 0.01536278, -1.199804, 1, 1, 1, 1, 1,
-1.783421, -1.108676, -3.776445, 1, 1, 1, 1, 1,
-1.768638, 1.324904, -1.788516, 1, 1, 1, 1, 1,
-1.768052, 0.9265231, -1.249509, 1, 1, 1, 1, 1,
-1.760386, -0.5965497, -2.001611, 0, 0, 1, 1, 1,
-1.754874, 1.407155, -1.372416, 1, 0, 0, 1, 1,
-1.753785, -0.2959262, -2.159242, 1, 0, 0, 1, 1,
-1.745294, -0.6227037, -1.077016, 1, 0, 0, 1, 1,
-1.737032, -0.6349556, -2.187804, 1, 0, 0, 1, 1,
-1.73343, 0.8932401, 0.9084674, 1, 0, 0, 1, 1,
-1.727634, -0.5962043, -0.206982, 0, 0, 0, 1, 1,
-1.692382, -1.687286, -1.215565, 0, 0, 0, 1, 1,
-1.685066, 0.07529065, -3.270317, 0, 0, 0, 1, 1,
-1.679557, -0.3363875, -0.2159225, 0, 0, 0, 1, 1,
-1.674912, 0.2473156, -2.033746, 0, 0, 0, 1, 1,
-1.65711, 1.094239, -0.01158999, 0, 0, 0, 1, 1,
-1.654996, -0.3370588, -1.580461, 0, 0, 0, 1, 1,
-1.630023, 0.8420986, -1.075955, 1, 1, 1, 1, 1,
-1.613726, -0.4147094, -1.978127, 1, 1, 1, 1, 1,
-1.612542, 0.7337929, -1.386776, 1, 1, 1, 1, 1,
-1.61179, -0.2325278, -2.563245, 1, 1, 1, 1, 1,
-1.607291, 0.06733643, -2.50064, 1, 1, 1, 1, 1,
-1.604558, 0.2525539, -1.258346, 1, 1, 1, 1, 1,
-1.597791, -0.5286758, -1.233219, 1, 1, 1, 1, 1,
-1.588349, 1.418496, -0.07744734, 1, 1, 1, 1, 1,
-1.586293, -0.2418683, -3.063114, 1, 1, 1, 1, 1,
-1.579046, 0.02000938, -2.207394, 1, 1, 1, 1, 1,
-1.568501, -0.6461134, -2.427228, 1, 1, 1, 1, 1,
-1.564721, 0.8255625, 0.2439281, 1, 1, 1, 1, 1,
-1.558088, 0.7387955, -0.375703, 1, 1, 1, 1, 1,
-1.555882, -0.5741782, -0.7209647, 1, 1, 1, 1, 1,
-1.548361, -0.8502628, -3.080493, 1, 1, 1, 1, 1,
-1.547292, -0.8201779, -1.979092, 0, 0, 1, 1, 1,
-1.535711, 1.202173, -1.95977, 1, 0, 0, 1, 1,
-1.528915, -1.041072, -3.393245, 1, 0, 0, 1, 1,
-1.527221, -0.3598412, -2.870527, 1, 0, 0, 1, 1,
-1.521611, 0.2604809, -1.183491, 1, 0, 0, 1, 1,
-1.508855, -0.08917744, -1.947711, 1, 0, 0, 1, 1,
-1.492405, 0.8192984, -1.225304, 0, 0, 0, 1, 1,
-1.484394, -0.5756527, -2.77911, 0, 0, 0, 1, 1,
-1.457389, 1.610622, -0.5250009, 0, 0, 0, 1, 1,
-1.456432, -0.0638473, -1.307848, 0, 0, 0, 1, 1,
-1.450597, 0.1033813, -1.365172, 0, 0, 0, 1, 1,
-1.448168, -0.355824, -3.113868, 0, 0, 0, 1, 1,
-1.436405, 1.073164, -1.20616, 0, 0, 0, 1, 1,
-1.430449, 1.122459, -0.1736909, 1, 1, 1, 1, 1,
-1.423398, 1.205562, -2.248522, 1, 1, 1, 1, 1,
-1.421239, 1.083515, -1.033416, 1, 1, 1, 1, 1,
-1.414367, -0.7157587, -1.925284, 1, 1, 1, 1, 1,
-1.407416, 0.5653499, -2.920646, 1, 1, 1, 1, 1,
-1.39743, 0.2064092, -0.2998744, 1, 1, 1, 1, 1,
-1.396916, -1.296398, -3.030681, 1, 1, 1, 1, 1,
-1.392175, -0.3922537, -1.341004, 1, 1, 1, 1, 1,
-1.388243, -1.639073, -4.538229, 1, 1, 1, 1, 1,
-1.38813, 0.102057, -2.178581, 1, 1, 1, 1, 1,
-1.382716, -0.9276609, -1.055387, 1, 1, 1, 1, 1,
-1.367953, -0.8074707, -2.379526, 1, 1, 1, 1, 1,
-1.361592, -0.599811, 0.2148336, 1, 1, 1, 1, 1,
-1.353656, 0.2873807, -0.6422717, 1, 1, 1, 1, 1,
-1.344413, -0.808714, -2.312941, 1, 1, 1, 1, 1,
-1.339486, -1.969313, -1.438308, 0, 0, 1, 1, 1,
-1.339064, 0.7835622, -0.9389746, 1, 0, 0, 1, 1,
-1.334302, -0.3721944, -1.244593, 1, 0, 0, 1, 1,
-1.332666, 0.586729, -0.7822117, 1, 0, 0, 1, 1,
-1.330683, 1.008306, -0.6689882, 1, 0, 0, 1, 1,
-1.315981, -0.3646474, -1.744182, 1, 0, 0, 1, 1,
-1.314767, 0.3237407, -0.6248052, 0, 0, 0, 1, 1,
-1.314332, -0.7160197, -3.784216, 0, 0, 0, 1, 1,
-1.307343, 0.776242, -0.8492227, 0, 0, 0, 1, 1,
-1.304717, 1.886279, -0.02787192, 0, 0, 0, 1, 1,
-1.302617, -1.974684, -2.862271, 0, 0, 0, 1, 1,
-1.27823, -1.027995, -1.817701, 0, 0, 0, 1, 1,
-1.276819, -0.2191161, -2.294528, 0, 0, 0, 1, 1,
-1.274675, -1.438185, -3.651922, 1, 1, 1, 1, 1,
-1.271591, -0.0478997, -0.3724156, 1, 1, 1, 1, 1,
-1.269523, 0.1239581, -2.532914, 1, 1, 1, 1, 1,
-1.257677, -1.089432, -4.104012, 1, 1, 1, 1, 1,
-1.253211, -1.979952, -3.107171, 1, 1, 1, 1, 1,
-1.253008, 0.3115202, -1.013249, 1, 1, 1, 1, 1,
-1.233826, 0.06391054, -3.248138, 1, 1, 1, 1, 1,
-1.227988, 0.5616418, -0.9986427, 1, 1, 1, 1, 1,
-1.22666, -1.055436, -1.827521, 1, 1, 1, 1, 1,
-1.206885, 0.06948145, -1.310976, 1, 1, 1, 1, 1,
-1.203918, 1.02525, -1.199007, 1, 1, 1, 1, 1,
-1.201855, 0.1531347, -1.85341, 1, 1, 1, 1, 1,
-1.196084, 1.075686, -0.9717086, 1, 1, 1, 1, 1,
-1.195897, -0.5435651, -2.597231, 1, 1, 1, 1, 1,
-1.192733, -0.6287968, -3.141005, 1, 1, 1, 1, 1,
-1.19258, -0.1066964, -1.585676, 0, 0, 1, 1, 1,
-1.187182, -0.2699472, -2.52471, 1, 0, 0, 1, 1,
-1.182481, -1.11825, -1.697141, 1, 0, 0, 1, 1,
-1.17898, -0.1806472, -2.41601, 1, 0, 0, 1, 1,
-1.171418, -1.712658, -2.230356, 1, 0, 0, 1, 1,
-1.17109, 0.8198786, 0.2578655, 1, 0, 0, 1, 1,
-1.171054, -0.7944824, -0.8146142, 0, 0, 0, 1, 1,
-1.167354, 0.193928, -0.0746096, 0, 0, 0, 1, 1,
-1.166551, 0.0509222, -0.5578453, 0, 0, 0, 1, 1,
-1.144601, -0.4825317, -2.05245, 0, 0, 0, 1, 1,
-1.129803, -0.7862201, -1.044552, 0, 0, 0, 1, 1,
-1.12942, 0.6185409, -1.210397, 0, 0, 0, 1, 1,
-1.129101, 0.4064249, -0.8630579, 0, 0, 0, 1, 1,
-1.125392, 0.1809324, -2.51425, 1, 1, 1, 1, 1,
-1.12458, -0.3203002, -0.8225071, 1, 1, 1, 1, 1,
-1.11475, -0.4170045, -0.01682647, 1, 1, 1, 1, 1,
-1.114368, 0.8858113, -1.510355, 1, 1, 1, 1, 1,
-1.111591, 0.3075126, -0.4126291, 1, 1, 1, 1, 1,
-1.111072, -0.1738081, -1.288074, 1, 1, 1, 1, 1,
-1.108364, -1.210173, -1.252098, 1, 1, 1, 1, 1,
-1.107004, -0.3222197, -1.938335, 1, 1, 1, 1, 1,
-1.105128, 0.1606332, -1.813213, 1, 1, 1, 1, 1,
-1.096965, 1.016383, -0.5762337, 1, 1, 1, 1, 1,
-1.091196, -0.6121002, -2.689223, 1, 1, 1, 1, 1,
-1.091093, -0.4532572, 0.4652216, 1, 1, 1, 1, 1,
-1.091019, 0.8271811, -0.9322332, 1, 1, 1, 1, 1,
-1.085868, 0.4521078, -1.108517, 1, 1, 1, 1, 1,
-1.080093, 1.235622, -1.165596, 1, 1, 1, 1, 1,
-1.076971, 0.1085095, -1.77707, 0, 0, 1, 1, 1,
-1.073162, -0.006508603, -1.460672, 1, 0, 0, 1, 1,
-1.06923, -1.329294, -1.949652, 1, 0, 0, 1, 1,
-1.048591, -1.470971, -1.393803, 1, 0, 0, 1, 1,
-1.04652, -0.2501435, -1.683942, 1, 0, 0, 1, 1,
-1.043496, -1.297186, -2.984748, 1, 0, 0, 1, 1,
-1.043495, -0.5852087, -1.947505, 0, 0, 0, 1, 1,
-1.038148, 1.004663, -0.3854581, 0, 0, 0, 1, 1,
-1.033614, 0.7057296, -1.396374, 0, 0, 0, 1, 1,
-1.03272, 0.2698015, -1.720083, 0, 0, 0, 1, 1,
-1.03144, -1.199354, -3.914641, 0, 0, 0, 1, 1,
-1.030713, 1.023963, -0.8137236, 0, 0, 0, 1, 1,
-1.028708, 0.3194512, -1.671936, 0, 0, 0, 1, 1,
-1.027234, 1.521182, 0.6071418, 1, 1, 1, 1, 1,
-1.024505, -0.03777268, -0.8910007, 1, 1, 1, 1, 1,
-1.023478, 1.756196, -0.3804835, 1, 1, 1, 1, 1,
-1.020666, 0.5310737, -1.194624, 1, 1, 1, 1, 1,
-1.014857, 1.776502, 1.63374, 1, 1, 1, 1, 1,
-1.014763, 0.9230318, -1.648087, 1, 1, 1, 1, 1,
-1.005551, 0.3301095, 0.2006202, 1, 1, 1, 1, 1,
-1.000985, 0.6984723, -0.3669173, 1, 1, 1, 1, 1,
-0.9789119, 0.5760922, -0.1659729, 1, 1, 1, 1, 1,
-0.9786625, -0.2383364, -0.3509201, 1, 1, 1, 1, 1,
-0.9757553, -0.8376758, -1.798041, 1, 1, 1, 1, 1,
-0.967856, 0.1425126, -4.055057, 1, 1, 1, 1, 1,
-0.9592189, -0.27807, -1.833276, 1, 1, 1, 1, 1,
-0.9491875, -0.1074948, -2.272588, 1, 1, 1, 1, 1,
-0.9437431, 0.1484137, -1.598231, 1, 1, 1, 1, 1,
-0.9434893, -1.645966, -1.597572, 0, 0, 1, 1, 1,
-0.9425263, -0.5868045, -0.01772003, 1, 0, 0, 1, 1,
-0.942142, 0.5275462, 0.3387143, 1, 0, 0, 1, 1,
-0.9413785, 1.189989, 1.441451, 1, 0, 0, 1, 1,
-0.9380944, -0.2428365, -1.810516, 1, 0, 0, 1, 1,
-0.9361339, -1.682246, -3.711249, 1, 0, 0, 1, 1,
-0.9324468, 2.649544, 0.4736609, 0, 0, 0, 1, 1,
-0.9268703, -0.007178199, -1.338784, 0, 0, 0, 1, 1,
-0.9230118, -0.4438875, -2.783471, 0, 0, 0, 1, 1,
-0.9187534, 1.046633, 0.9027349, 0, 0, 0, 1, 1,
-0.9155, -0.2875572, -2.396111, 0, 0, 0, 1, 1,
-0.9130059, -0.4589415, -2.355655, 0, 0, 0, 1, 1,
-0.9051487, -0.9481643, -3.521257, 0, 0, 0, 1, 1,
-0.9018717, -1.37686, -4.041589, 1, 1, 1, 1, 1,
-0.9010746, -1.307427, -3.640379, 1, 1, 1, 1, 1,
-0.8988025, 1.457728, -0.5166823, 1, 1, 1, 1, 1,
-0.8985575, -0.2630972, -1.503032, 1, 1, 1, 1, 1,
-0.8951465, 2.357136, -2.076283, 1, 1, 1, 1, 1,
-0.8876466, 0.1453754, 0.5943872, 1, 1, 1, 1, 1,
-0.8842981, 0.6728251, -1.007793, 1, 1, 1, 1, 1,
-0.8840753, 0.4167485, -2.91779, 1, 1, 1, 1, 1,
-0.8777242, 0.03512462, -2.400903, 1, 1, 1, 1, 1,
-0.8763318, 0.6159773, -1.607173, 1, 1, 1, 1, 1,
-0.8758624, 0.2572274, -0.9956751, 1, 1, 1, 1, 1,
-0.8755883, 1.220807, -0.4559995, 1, 1, 1, 1, 1,
-0.873717, 2.215732, -0.6632456, 1, 1, 1, 1, 1,
-0.8701755, 0.649893, -0.7250843, 1, 1, 1, 1, 1,
-0.8572991, -0.127882, -0.8637494, 1, 1, 1, 1, 1,
-0.8569484, 0.1135228, -1.447431, 0, 0, 1, 1, 1,
-0.8520779, -0.3669177, -2.949935, 1, 0, 0, 1, 1,
-0.8508369, 0.15356, -1.319919, 1, 0, 0, 1, 1,
-0.8465459, 0.8625238, -1.082794, 1, 0, 0, 1, 1,
-0.8439645, 1.79959, -0.005471652, 1, 0, 0, 1, 1,
-0.8430278, -0.1030835, -1.74682, 1, 0, 0, 1, 1,
-0.8374517, -0.3592116, -2.70313, 0, 0, 0, 1, 1,
-0.8324217, 0.05963973, -0.1402854, 0, 0, 0, 1, 1,
-0.8320686, 0.2874086, -0.2776537, 0, 0, 0, 1, 1,
-0.8307148, 0.6921852, -0.213598, 0, 0, 0, 1, 1,
-0.824845, 0.481142, -0.8895701, 0, 0, 0, 1, 1,
-0.8236216, -0.2749894, -1.801948, 0, 0, 0, 1, 1,
-0.8234546, 1.798487, -0.3632092, 0, 0, 0, 1, 1,
-0.8197889, 0.1356217, -2.341015, 1, 1, 1, 1, 1,
-0.8133497, 1.017222, -1.639694, 1, 1, 1, 1, 1,
-0.8128991, 2.344793, 0.2134819, 1, 1, 1, 1, 1,
-0.8120334, 0.03135917, -0.3625799, 1, 1, 1, 1, 1,
-0.8113348, 0.1026434, -2.130295, 1, 1, 1, 1, 1,
-0.8111946, -0.1937123, -1.211589, 1, 1, 1, 1, 1,
-0.8080317, 0.5947183, -2.301546, 1, 1, 1, 1, 1,
-0.8068057, 0.9091994, -1.418424, 1, 1, 1, 1, 1,
-0.8053, 0.4574172, -1.77155, 1, 1, 1, 1, 1,
-0.8026181, 1.130322, -0.07443525, 1, 1, 1, 1, 1,
-0.7986948, 0.954561, -1.297981, 1, 1, 1, 1, 1,
-0.7954077, -1.048246, -2.361096, 1, 1, 1, 1, 1,
-0.7931134, -0.1169886, -1.609177, 1, 1, 1, 1, 1,
-0.79102, 0.5272714, -2.307239, 1, 1, 1, 1, 1,
-0.7896246, -0.6476957, -3.775707, 1, 1, 1, 1, 1,
-0.7849884, 1.82939, 0.2482924, 0, 0, 1, 1, 1,
-0.7780455, 0.3774186, -0.04270658, 1, 0, 0, 1, 1,
-0.7775528, -0.2852283, -2.529797, 1, 0, 0, 1, 1,
-0.7730278, 0.2231585, -0.5838634, 1, 0, 0, 1, 1,
-0.7699484, -0.1843276, -0.5951046, 1, 0, 0, 1, 1,
-0.7693052, -0.4944428, -1.784645, 1, 0, 0, 1, 1,
-0.7656156, -1.235759, -3.117321, 0, 0, 0, 1, 1,
-0.7651502, 1.468612, 0.1780749, 0, 0, 0, 1, 1,
-0.7644768, -0.648696, -1.472194, 0, 0, 0, 1, 1,
-0.7637756, 0.6856272, -0.7747259, 0, 0, 0, 1, 1,
-0.7573217, -1.258717, -2.031337, 0, 0, 0, 1, 1,
-0.7536829, 0.6858923, -1.375862, 0, 0, 0, 1, 1,
-0.7522218, 1.079461, -1.645232, 0, 0, 0, 1, 1,
-0.7466912, 1.666709, -0.6954607, 1, 1, 1, 1, 1,
-0.743926, -0.4812862, -2.205813, 1, 1, 1, 1, 1,
-0.7375315, -0.1006807, -1.863081, 1, 1, 1, 1, 1,
-0.7312993, 1.677692, 0.866758, 1, 1, 1, 1, 1,
-0.7298987, 0.05542299, -1.29516, 1, 1, 1, 1, 1,
-0.7296622, -0.1633611, -2.599463, 1, 1, 1, 1, 1,
-0.7291034, -0.5379404, -3.386111, 1, 1, 1, 1, 1,
-0.7274765, 0.1174512, -0.6867033, 1, 1, 1, 1, 1,
-0.721655, 0.2147877, -0.7386762, 1, 1, 1, 1, 1,
-0.7148877, -2.188038, -3.510036, 1, 1, 1, 1, 1,
-0.7132872, 2.039688, 0.2747141, 1, 1, 1, 1, 1,
-0.703937, -1.517545, -3.705636, 1, 1, 1, 1, 1,
-0.7037423, 1.938518, 0.1235757, 1, 1, 1, 1, 1,
-0.702183, -0.8420951, -2.612601, 1, 1, 1, 1, 1,
-0.7004156, -0.9416843, -2.784313, 1, 1, 1, 1, 1,
-0.6980671, -0.09571131, 0.1239318, 0, 0, 1, 1, 1,
-0.6957817, 0.07825223, -1.740187, 1, 0, 0, 1, 1,
-0.6954665, -0.4293662, -2.002013, 1, 0, 0, 1, 1,
-0.6923285, -0.4505772, -1.820522, 1, 0, 0, 1, 1,
-0.6921791, -0.2379305, -2.658504, 1, 0, 0, 1, 1,
-0.688008, -1.223019, -0.4587342, 1, 0, 0, 1, 1,
-0.6830897, -0.5494191, -1.717965, 0, 0, 0, 1, 1,
-0.68271, -1.161565, -3.348829, 0, 0, 0, 1, 1,
-0.6818087, -0.3163421, -0.6628314, 0, 0, 0, 1, 1,
-0.6810823, -0.842968, -2.4786, 0, 0, 0, 1, 1,
-0.6804076, -0.3095224, -3.574932, 0, 0, 0, 1, 1,
-0.6700639, 0.1008993, -2.082327, 0, 0, 0, 1, 1,
-0.6689779, 0.2308728, -0.3486824, 0, 0, 0, 1, 1,
-0.6666265, 0.3184166, -1.107121, 1, 1, 1, 1, 1,
-0.6646572, 1.583643, 0.1170664, 1, 1, 1, 1, 1,
-0.6633324, 0.8692642, 2.052665, 1, 1, 1, 1, 1,
-0.6590909, -2.839511, -2.799019, 1, 1, 1, 1, 1,
-0.6583626, -0.1700379, -2.327191, 1, 1, 1, 1, 1,
-0.6576713, -0.868809, -2.548468, 1, 1, 1, 1, 1,
-0.6573349, -1.876737, -0.9408782, 1, 1, 1, 1, 1,
-0.6518788, -0.7224718, -1.857177, 1, 1, 1, 1, 1,
-0.642598, 1.743943, 0.02906843, 1, 1, 1, 1, 1,
-0.6376181, -1.535669, -0.3639538, 1, 1, 1, 1, 1,
-0.6366414, 2.253307, 0.5682877, 1, 1, 1, 1, 1,
-0.6356795, 1.119676, -0.03057768, 1, 1, 1, 1, 1,
-0.6353478, 0.908262, -1.056664, 1, 1, 1, 1, 1,
-0.6335202, -0.3203668, -1.205403, 1, 1, 1, 1, 1,
-0.6330874, -0.4482337, -3.109767, 1, 1, 1, 1, 1,
-0.6309451, 1.345983, 1.231261, 0, 0, 1, 1, 1,
-0.628495, 0.7741017, 1.081848, 1, 0, 0, 1, 1,
-0.6228266, 0.2346954, -0.1725688, 1, 0, 0, 1, 1,
-0.6209157, -0.6016754, -4.268545, 1, 0, 0, 1, 1,
-0.6195391, 0.1508391, -2.328512, 1, 0, 0, 1, 1,
-0.618067, 0.7077226, -0.08509226, 1, 0, 0, 1, 1,
-0.6128529, 0.5175892, -0.6104726, 0, 0, 0, 1, 1,
-0.6127829, 0.6898159, 0.06153378, 0, 0, 0, 1, 1,
-0.6071709, -1.600552, -2.892686, 0, 0, 0, 1, 1,
-0.6067472, 0.4508879, -0.5620214, 0, 0, 0, 1, 1,
-0.6055626, 1.832777, -1.563466, 0, 0, 0, 1, 1,
-0.604596, 1.016674, 0.7737233, 0, 0, 0, 1, 1,
-0.603884, -0.2585164, -1.784895, 0, 0, 0, 1, 1,
-0.6014071, -2.242195, -3.177985, 1, 1, 1, 1, 1,
-0.5976701, 0.8261726, -1.634287, 1, 1, 1, 1, 1,
-0.5968426, 2.30998, -0.7672883, 1, 1, 1, 1, 1,
-0.5945817, 0.5079946, -0.5647107, 1, 1, 1, 1, 1,
-0.5847583, 1.192556, 1.257157, 1, 1, 1, 1, 1,
-0.5806963, -0.5160905, -2.71585, 1, 1, 1, 1, 1,
-0.5805469, -0.5194309, -2.90646, 1, 1, 1, 1, 1,
-0.5782688, 0.1257303, -2.274122, 1, 1, 1, 1, 1,
-0.5777892, -0.1749841, -2.077539, 1, 1, 1, 1, 1,
-0.5764996, 2.025777, -1.362272, 1, 1, 1, 1, 1,
-0.5764641, -0.9251708, -4.25858, 1, 1, 1, 1, 1,
-0.5747038, -0.09558495, -1.104424, 1, 1, 1, 1, 1,
-0.5707487, 1.138005, -1.594552, 1, 1, 1, 1, 1,
-0.5670848, -0.2550306, -1.683609, 1, 1, 1, 1, 1,
-0.5657541, -0.2262927, -1.072248, 1, 1, 1, 1, 1,
-0.5642025, -0.6852029, -2.977127, 0, 0, 1, 1, 1,
-0.559734, -0.3530818, -1.597021, 1, 0, 0, 1, 1,
-0.5538257, 0.1279254, -2.838825, 1, 0, 0, 1, 1,
-0.552855, 0.4835233, -2.716381, 1, 0, 0, 1, 1,
-0.5520814, -0.1344743, -0.4745946, 1, 0, 0, 1, 1,
-0.5483087, -1.356233, -3.548744, 1, 0, 0, 1, 1,
-0.5456951, -1.290859, -1.875026, 0, 0, 0, 1, 1,
-0.5455037, 0.002734448, -0.2405547, 0, 0, 0, 1, 1,
-0.5425858, -0.168701, -0.365414, 0, 0, 0, 1, 1,
-0.5421405, 1.236195, -1.586165, 0, 0, 0, 1, 1,
-0.541603, 0.7330008, -2.232295, 0, 0, 0, 1, 1,
-0.5378812, 0.1495133, -2.135384, 0, 0, 0, 1, 1,
-0.5373783, 1.466993, -0.9513022, 0, 0, 0, 1, 1,
-0.5356109, -1.140603, -2.80201, 1, 1, 1, 1, 1,
-0.5333532, -0.8265565, -0.2505454, 1, 1, 1, 1, 1,
-0.5314168, 0.2287655, -2.441264, 1, 1, 1, 1, 1,
-0.531372, -0.1916296, -0.1517798, 1, 1, 1, 1, 1,
-0.5312788, -0.7635446, -2.115827, 1, 1, 1, 1, 1,
-0.5284353, 0.4870666, -2.624792, 1, 1, 1, 1, 1,
-0.5249333, 0.9153866, -2.640637, 1, 1, 1, 1, 1,
-0.5245696, 0.1813766, -2.141571, 1, 1, 1, 1, 1,
-0.5230011, -1.262876, -1.860009, 1, 1, 1, 1, 1,
-0.5225034, -1.311279, -1.462536, 1, 1, 1, 1, 1,
-0.5190707, 0.03560213, -0.9006099, 1, 1, 1, 1, 1,
-0.5145066, -1.266937, -2.155191, 1, 1, 1, 1, 1,
-0.5132346, -1.179128, -1.119711, 1, 1, 1, 1, 1,
-0.5128933, 0.2114472, -1.687362, 1, 1, 1, 1, 1,
-0.5124241, 0.683737, -0.587592, 1, 1, 1, 1, 1,
-0.5089483, -0.245374, -0.4955692, 0, 0, 1, 1, 1,
-0.5088942, -0.2633289, -1.844948, 1, 0, 0, 1, 1,
-0.5052413, 0.6199113, 0.5119802, 1, 0, 0, 1, 1,
-0.5051095, -0.004542179, -1.312437, 1, 0, 0, 1, 1,
-0.5002835, -0.6347122, -4.912893, 1, 0, 0, 1, 1,
-0.4995642, 1.120268, -0.4802287, 1, 0, 0, 1, 1,
-0.4991533, -0.9400312, -1.267678, 0, 0, 0, 1, 1,
-0.4964082, 1.243654, -0.9210191, 0, 0, 0, 1, 1,
-0.4936856, -0.434223, -3.269172, 0, 0, 0, 1, 1,
-0.4889109, 1.735318, 0.739898, 0, 0, 0, 1, 1,
-0.4861018, 0.9610993, -1.463339, 0, 0, 0, 1, 1,
-0.4843796, -0.08792318, -0.8120933, 0, 0, 0, 1, 1,
-0.4826242, 0.1791245, -1.627681, 0, 0, 0, 1, 1,
-0.4815644, 0.06619263, -0.6148298, 1, 1, 1, 1, 1,
-0.4742627, 2.273915, 0.06324887, 1, 1, 1, 1, 1,
-0.4704931, -0.06867477, -0.8498219, 1, 1, 1, 1, 1,
-0.4639521, -0.1200673, -0.8744528, 1, 1, 1, 1, 1,
-0.4600607, -0.4037184, -1.56879, 1, 1, 1, 1, 1,
-0.4583455, 0.9225944, -0.2235212, 1, 1, 1, 1, 1,
-0.4582184, 1.186225, -0.1712012, 1, 1, 1, 1, 1,
-0.4581714, -0.7829226, -1.148422, 1, 1, 1, 1, 1,
-0.4496424, -1.49359, -3.472458, 1, 1, 1, 1, 1,
-0.4476649, -1.838729, -1.536814, 1, 1, 1, 1, 1,
-0.4471344, 1.025706, -1.865145, 1, 1, 1, 1, 1,
-0.4430285, 0.9019755, -1.113997, 1, 1, 1, 1, 1,
-0.4366621, -0.4988666, -2.645644, 1, 1, 1, 1, 1,
-0.4352555, -0.4094612, -1.711676, 1, 1, 1, 1, 1,
-0.4334101, 0.247381, -1.529166, 1, 1, 1, 1, 1,
-0.4313352, -1.466571, -1.5233, 0, 0, 1, 1, 1,
-0.4303632, 1.502027, -1.198272, 1, 0, 0, 1, 1,
-0.4264354, 0.8614033, -0.60116, 1, 0, 0, 1, 1,
-0.4254107, 0.8850517, -0.5791354, 1, 0, 0, 1, 1,
-0.4242401, -0.2936641, -2.884401, 1, 0, 0, 1, 1,
-0.4240026, 2.10857, 0.128097, 1, 0, 0, 1, 1,
-0.4178154, 0.005924849, -0.9527513, 0, 0, 0, 1, 1,
-0.4146354, -0.8843926, -1.665498, 0, 0, 0, 1, 1,
-0.412225, -0.4974711, -4.538306, 0, 0, 0, 1, 1,
-0.4066961, 0.4182514, 0.7983401, 0, 0, 0, 1, 1,
-0.4058844, -2.572242, -1.940684, 0, 0, 0, 1, 1,
-0.4049605, 3.013927, -0.6824774, 0, 0, 0, 1, 1,
-0.4010643, -0.0712368, -0.4776535, 0, 0, 0, 1, 1,
-0.4004518, 0.9129441, -0.985086, 1, 1, 1, 1, 1,
-0.3968332, -0.3326953, -3.264564, 1, 1, 1, 1, 1,
-0.3954163, -1.043116, -1.281177, 1, 1, 1, 1, 1,
-0.3868083, -1.465809, -1.118361, 1, 1, 1, 1, 1,
-0.373016, -2.409819, -1.613183, 1, 1, 1, 1, 1,
-0.3712686, 0.8110134, 0.1732762, 1, 1, 1, 1, 1,
-0.3659858, 1.110869, -0.2927053, 1, 1, 1, 1, 1,
-0.3643524, -0.02475632, -1.467586, 1, 1, 1, 1, 1,
-0.3624856, 0.05438038, 0.6216535, 1, 1, 1, 1, 1,
-0.3595362, 1.017406, 1.60114, 1, 1, 1, 1, 1,
-0.3495891, 0.1483423, -0.5793967, 1, 1, 1, 1, 1,
-0.343783, 0.461341, 0.4907214, 1, 1, 1, 1, 1,
-0.3376965, -1.617096, -1.843552, 1, 1, 1, 1, 1,
-0.3315588, 2.248741, -1.013982, 1, 1, 1, 1, 1,
-0.3219642, 0.8078996, 0.2619126, 1, 1, 1, 1, 1,
-0.3212779, -1.241961, -4.370739, 0, 0, 1, 1, 1,
-0.3182265, 0.09977936, -0.4213703, 1, 0, 0, 1, 1,
-0.3136564, 2.35554, -0.2859689, 1, 0, 0, 1, 1,
-0.3122333, -1.785746, -2.024629, 1, 0, 0, 1, 1,
-0.310517, -0.3652708, -2.042501, 1, 0, 0, 1, 1,
-0.3079196, -0.0997981, -2.816423, 1, 0, 0, 1, 1,
-0.3077491, -0.924377, -2.269072, 0, 0, 0, 1, 1,
-0.3017003, -0.647391, -2.985564, 0, 0, 0, 1, 1,
-0.2946082, -0.2456617, -2.537768, 0, 0, 0, 1, 1,
-0.2935409, 0.9655641, -0.8512186, 0, 0, 0, 1, 1,
-0.2933519, 0.2568423, -2.175378, 0, 0, 0, 1, 1,
-0.287995, -0.5344356, -4.311626, 0, 0, 0, 1, 1,
-0.2857884, -1.106614, -3.71531, 0, 0, 0, 1, 1,
-0.2793612, 0.6813098, -1.356688, 1, 1, 1, 1, 1,
-0.2767854, -1.283138, -4.77612, 1, 1, 1, 1, 1,
-0.2715678, -0.1133431, -0.2301274, 1, 1, 1, 1, 1,
-0.2652962, 0.2123163, -0.1445471, 1, 1, 1, 1, 1,
-0.265227, 1.323103, -0.9739541, 1, 1, 1, 1, 1,
-0.26449, 0.36788, 1.27714, 1, 1, 1, 1, 1,
-0.2612392, 1.421384, -0.302682, 1, 1, 1, 1, 1,
-0.2563016, 1.324834, -1.537675, 1, 1, 1, 1, 1,
-0.2557992, -0.934297, -4.185524, 1, 1, 1, 1, 1,
-0.2551631, -1.815014, -3.785282, 1, 1, 1, 1, 1,
-0.2549142, -0.37968, -1.214514, 1, 1, 1, 1, 1,
-0.2504954, -0.2881798, -2.158573, 1, 1, 1, 1, 1,
-0.2502453, 0.2295372, -0.5788214, 1, 1, 1, 1, 1,
-0.2396661, -2.438101, -3.228504, 1, 1, 1, 1, 1,
-0.23095, -0.7684963, -4.47799, 1, 1, 1, 1, 1,
-0.2303516, -0.9111722, -1.512844, 0, 0, 1, 1, 1,
-0.2189906, -1.275172, -4.555271, 1, 0, 0, 1, 1,
-0.2163427, 1.71399, 0.3084999, 1, 0, 0, 1, 1,
-0.2138791, 1.697341, -0.1308495, 1, 0, 0, 1, 1,
-0.2127186, -0.04623216, -1.356632, 1, 0, 0, 1, 1,
-0.2114608, 1.310448, 0.6165132, 1, 0, 0, 1, 1,
-0.2114602, -2.159953, -4.892806, 0, 0, 0, 1, 1,
-0.2099337, -0.5938191, -4.311703, 0, 0, 0, 1, 1,
-0.2096655, 0.6360469, -0.5749069, 0, 0, 0, 1, 1,
-0.2043915, -0.09089617, -1.36855, 0, 0, 0, 1, 1,
-0.2021349, -1.610062, -4.735578, 0, 0, 0, 1, 1,
-0.2017559, -0.3979234, -3.062809, 0, 0, 0, 1, 1,
-0.2016083, -0.800549, -1.685079, 0, 0, 0, 1, 1,
-0.1965519, 0.6182401, -0.1394938, 1, 1, 1, 1, 1,
-0.1890793, 1.271429, 0.487816, 1, 1, 1, 1, 1,
-0.1819062, -1.818783, -2.509697, 1, 1, 1, 1, 1,
-0.1788822, -1.899091, -3.477064, 1, 1, 1, 1, 1,
-0.1781052, -0.6854001, -2.671484, 1, 1, 1, 1, 1,
-0.1701729, -1.214223, -3.31927, 1, 1, 1, 1, 1,
-0.168624, -0.3233829, -2.709809, 1, 1, 1, 1, 1,
-0.1677437, 0.9811711, 0.8348904, 1, 1, 1, 1, 1,
-0.1664573, 0.332068, -2.107799, 1, 1, 1, 1, 1,
-0.1654482, 0.07284153, -2.178031, 1, 1, 1, 1, 1,
-0.1604191, -1.328524, -4.082415, 1, 1, 1, 1, 1,
-0.1598469, -0.679253, 0.4534478, 1, 1, 1, 1, 1,
-0.1592146, -0.861748, -2.878887, 1, 1, 1, 1, 1,
-0.1580641, -1.703812, -1.360192, 1, 1, 1, 1, 1,
-0.1560359, -1.031427, -3.826087, 1, 1, 1, 1, 1,
-0.1543762, 1.228571, 0.8611473, 0, 0, 1, 1, 1,
-0.1518239, -1.323678, -2.917316, 1, 0, 0, 1, 1,
-0.1475514, 0.9906801, 0.01975661, 1, 0, 0, 1, 1,
-0.1458588, -1.337537, -2.556146, 1, 0, 0, 1, 1,
-0.1413761, 0.9674508, -0.02254498, 1, 0, 0, 1, 1,
-0.1397822, -1.426481, -2.483893, 1, 0, 0, 1, 1,
-0.1364338, 0.5599474, -0.7996778, 0, 0, 0, 1, 1,
-0.1305514, 0.3477478, -0.1928157, 0, 0, 0, 1, 1,
-0.13, 1.154398, 0.4470421, 0, 0, 0, 1, 1,
-0.1292236, -0.4678011, -3.228801, 0, 0, 0, 1, 1,
-0.1291227, -0.8534757, -2.773761, 0, 0, 0, 1, 1,
-0.1245434, -0.308193, -3.864309, 0, 0, 0, 1, 1,
-0.1235339, -0.0044636, -4.784055, 0, 0, 0, 1, 1,
-0.1159631, -0.1646335, -2.435785, 1, 1, 1, 1, 1,
-0.1108373, 1.571012, -0.3318326, 1, 1, 1, 1, 1,
-0.1058268, -0.6045872, -3.540467, 1, 1, 1, 1, 1,
-0.1047028, 0.2294343, -0.03772454, 1, 1, 1, 1, 1,
-0.1011574, -0.1535913, -2.352032, 1, 1, 1, 1, 1,
-0.1003262, 1.911653, 0.3109611, 1, 1, 1, 1, 1,
-0.09986331, 0.009111424, -2.076287, 1, 1, 1, 1, 1,
-0.0968229, 0.8322121, -0.5929941, 1, 1, 1, 1, 1,
-0.09644512, 0.02697532, -2.646169, 1, 1, 1, 1, 1,
-0.09499977, -0.4922672, -4.416168, 1, 1, 1, 1, 1,
-0.08977627, 0.449496, -0.457951, 1, 1, 1, 1, 1,
-0.08523002, -0.6082551, -3.424145, 1, 1, 1, 1, 1,
-0.08437157, -0.3602578, -3.81482, 1, 1, 1, 1, 1,
-0.0828921, 0.6152588, 0.5101079, 1, 1, 1, 1, 1,
-0.07887655, 1.521057, 2.663571, 1, 1, 1, 1, 1,
-0.07670327, 1.434385, -0.0294421, 0, 0, 1, 1, 1,
-0.07311661, 1.742251, -1.714976, 1, 0, 0, 1, 1,
-0.06973623, -0.8496603, -1.934829, 1, 0, 0, 1, 1,
-0.06932535, -2.047451, -2.786581, 1, 0, 0, 1, 1,
-0.0692064, -0.912049, -1.744011, 1, 0, 0, 1, 1,
-0.06199519, 1.099208, -0.3708926, 1, 0, 0, 1, 1,
-0.06078601, 0.1679186, 0.5969872, 0, 0, 0, 1, 1,
-0.06050673, -1.2736, -3.542515, 0, 0, 0, 1, 1,
-0.05850609, 0.4692842, -1.373074, 0, 0, 0, 1, 1,
-0.05617536, 0.9508012, -0.4233748, 0, 0, 0, 1, 1,
-0.05580167, -1.173958, -1.931199, 0, 0, 0, 1, 1,
-0.05312376, 1.835114, 2.105368, 0, 0, 0, 1, 1,
-0.04975979, -1.410961, -3.565223, 0, 0, 0, 1, 1,
-0.04844377, -0.8368873, -1.736485, 1, 1, 1, 1, 1,
-0.0465028, -2.188643, -1.514544, 1, 1, 1, 1, 1,
-0.04475474, -1.094302, -1.726326, 1, 1, 1, 1, 1,
-0.04272186, 0.5105933, -0.1884565, 1, 1, 1, 1, 1,
-0.04177363, 0.7956082, 3.262444, 1, 1, 1, 1, 1,
-0.04107793, 1.432781, 0.6014861, 1, 1, 1, 1, 1,
-0.03824782, 1.333876, -0.2348751, 1, 1, 1, 1, 1,
-0.03761406, 0.2338145, -1.034775, 1, 1, 1, 1, 1,
-0.02325352, -0.1953578, -4.617718, 1, 1, 1, 1, 1,
-0.02013687, 1.609456, -1.119595, 1, 1, 1, 1, 1,
-0.0178083, 0.2055703, 0.3152891, 1, 1, 1, 1, 1,
-0.0174056, -0.8995568, -2.769173, 1, 1, 1, 1, 1,
-0.0163007, 0.6711755, -0.1027224, 1, 1, 1, 1, 1,
-0.01248963, 2.017253, -0.1221602, 1, 1, 1, 1, 1,
-0.01155334, -0.04861479, -3.628167, 1, 1, 1, 1, 1,
-0.01105283, -0.5869438, -1.948507, 0, 0, 1, 1, 1,
-0.009594842, -0.9661895, -4.070526, 1, 0, 0, 1, 1,
-0.003691493, 0.2586814, -0.8559161, 1, 0, 0, 1, 1,
-0.003257236, -0.02042059, -1.962201, 1, 0, 0, 1, 1,
0.0002593494, -0.5285344, 3.722286, 1, 0, 0, 1, 1,
0.0009227737, -0.8368775, 2.501896, 1, 0, 0, 1, 1,
0.002102161, -0.6492159, 3.737789, 0, 0, 0, 1, 1,
0.004352794, -0.221706, 3.129038, 0, 0, 0, 1, 1,
0.004373592, -0.8432398, 2.512919, 0, 0, 0, 1, 1,
0.004421439, 0.5883347, -1.36094, 0, 0, 0, 1, 1,
0.004686556, -0.9036458, 3.172345, 0, 0, 0, 1, 1,
0.00582245, -1.140897, 1.898916, 0, 0, 0, 1, 1,
0.006210482, 0.1426465, -0.8545334, 0, 0, 0, 1, 1,
0.01312893, -1.010245, 3.213262, 1, 1, 1, 1, 1,
0.01760402, -1.759553, 4.657908, 1, 1, 1, 1, 1,
0.0186533, -0.542787, 2.630763, 1, 1, 1, 1, 1,
0.01897784, -1.19418, 2.177706, 1, 1, 1, 1, 1,
0.01900158, -1.374957, 3.325893, 1, 1, 1, 1, 1,
0.01946943, 0.3438805, -0.4088618, 1, 1, 1, 1, 1,
0.01969122, -2.23933, 2.820082, 1, 1, 1, 1, 1,
0.02131496, 0.1114478, 1.517031, 1, 1, 1, 1, 1,
0.02685354, -1.310671, 3.55596, 1, 1, 1, 1, 1,
0.02693143, -0.688394, 2.815241, 1, 1, 1, 1, 1,
0.02745869, -0.1670699, 3.371066, 1, 1, 1, 1, 1,
0.0277945, 0.1942266, -1.387414, 1, 1, 1, 1, 1,
0.02789903, -0.9833445, 3.370216, 1, 1, 1, 1, 1,
0.02793484, 0.7715407, -1.072206, 1, 1, 1, 1, 1,
0.03097247, 1.316372, 1.260835, 1, 1, 1, 1, 1,
0.03258365, 0.2832874, -0.5157256, 0, 0, 1, 1, 1,
0.03377023, 0.5745385, -0.1271268, 1, 0, 0, 1, 1,
0.03734984, -0.4985273, 4.150322, 1, 0, 0, 1, 1,
0.03948227, -0.885736, 3.173389, 1, 0, 0, 1, 1,
0.03953783, 0.7539073, 0.9789949, 1, 0, 0, 1, 1,
0.03996523, 0.7723094, -0.5574749, 1, 0, 0, 1, 1,
0.04073716, 0.5106915, -0.5506341, 0, 0, 0, 1, 1,
0.04404805, 0.6333928, 0.4413235, 0, 0, 0, 1, 1,
0.04678677, 0.2579964, -0.3605737, 0, 0, 0, 1, 1,
0.04958735, 0.9078291, -0.3563408, 0, 0, 0, 1, 1,
0.05167656, -0.5974544, 3.949783, 0, 0, 0, 1, 1,
0.05334245, 0.5348386, -0.7298331, 0, 0, 0, 1, 1,
0.05623922, 2.68422, 0.0775551, 0, 0, 0, 1, 1,
0.06563956, 0.7616877, 1.344875, 1, 1, 1, 1, 1,
0.07257055, 2.348916, 0.764441, 1, 1, 1, 1, 1,
0.0743864, 0.4212974, -0.2402593, 1, 1, 1, 1, 1,
0.07713368, -0.5415967, 2.205986, 1, 1, 1, 1, 1,
0.07931809, 0.7562649, 1.080735, 1, 1, 1, 1, 1,
0.0802746, 0.1010164, 1.493671, 1, 1, 1, 1, 1,
0.08840752, 1.073535, -0.397363, 1, 1, 1, 1, 1,
0.08851848, 0.1666092, -0.5216009, 1, 1, 1, 1, 1,
0.08895231, -0.7620397, 1.933332, 1, 1, 1, 1, 1,
0.0931362, -1.357719, 2.565755, 1, 1, 1, 1, 1,
0.09385174, -0.08650325, 1.330195, 1, 1, 1, 1, 1,
0.09388653, -0.7354201, 3.670669, 1, 1, 1, 1, 1,
0.09985318, 0.3105477, 0.2075343, 1, 1, 1, 1, 1,
0.103413, 1.116013, -0.5526246, 1, 1, 1, 1, 1,
0.1071684, 0.07483678, 2.164708, 1, 1, 1, 1, 1,
0.1079195, -0.7399021, 3.855932, 0, 0, 1, 1, 1,
0.1089886, 0.4052689, -0.7082257, 1, 0, 0, 1, 1,
0.1105696, -0.8036964, 2.103691, 1, 0, 0, 1, 1,
0.1133465, 1.936225, -0.2790307, 1, 0, 0, 1, 1,
0.1136987, -0.1518405, 3.195699, 1, 0, 0, 1, 1,
0.1177884, 0.169171, 1.503032, 1, 0, 0, 1, 1,
0.1201546, 1.366196, 3.100152, 0, 0, 0, 1, 1,
0.1245735, -1.507243, 3.412533, 0, 0, 0, 1, 1,
0.1312395, -0.732451, 1.462654, 0, 0, 0, 1, 1,
0.1316755, -0.7512323, 3.984567, 0, 0, 0, 1, 1,
0.1321497, 0.1766158, 0.2540954, 0, 0, 0, 1, 1,
0.1356927, -0.5353832, 3.357264, 0, 0, 0, 1, 1,
0.1360287, 1.569951, 1.776243, 0, 0, 0, 1, 1,
0.1383973, -0.09738816, 2.365664, 1, 1, 1, 1, 1,
0.1403083, 0.8695871, 1.709203, 1, 1, 1, 1, 1,
0.1408345, -1.024048, 3.099775, 1, 1, 1, 1, 1,
0.1413794, 1.056225, 2.570676, 1, 1, 1, 1, 1,
0.1432611, 0.9034375, -0.408324, 1, 1, 1, 1, 1,
0.1442412, -1.334987, 2.054825, 1, 1, 1, 1, 1,
0.1500412, -0.4381848, 3.457619, 1, 1, 1, 1, 1,
0.1505521, -0.1668732, 2.325882, 1, 1, 1, 1, 1,
0.153249, 0.4723584, 1.498214, 1, 1, 1, 1, 1,
0.1571179, -1.158214, 3.6818, 1, 1, 1, 1, 1,
0.1604892, -0.9099787, 1.779487, 1, 1, 1, 1, 1,
0.1676936, -0.3634466, 3.169233, 1, 1, 1, 1, 1,
0.1719508, -0.191454, 3.62306, 1, 1, 1, 1, 1,
0.1726227, 0.4769538, -0.4389027, 1, 1, 1, 1, 1,
0.1778357, 0.8574913, 0.1367273, 1, 1, 1, 1, 1,
0.1816863, 0.6048312, 1.430325, 0, 0, 1, 1, 1,
0.1832973, 0.02995591, 2.99834, 1, 0, 0, 1, 1,
0.1846036, -1.095245, 2.262445, 1, 0, 0, 1, 1,
0.1862456, -0.7498294, 2.966723, 1, 0, 0, 1, 1,
0.1878769, -0.4230049, 2.856007, 1, 0, 0, 1, 1,
0.1886055, -0.295996, 1.429102, 1, 0, 0, 1, 1,
0.1913727, 0.1662009, -0.02967583, 0, 0, 0, 1, 1,
0.1925358, 0.7427029, 0.5511934, 0, 0, 0, 1, 1,
0.1958017, 0.4681137, 0.007774901, 0, 0, 0, 1, 1,
0.1965668, 1.872433, 0.7554837, 0, 0, 0, 1, 1,
0.1980624, 0.0009630753, 1.330324, 0, 0, 0, 1, 1,
0.1985129, -0.250885, 2.501812, 0, 0, 0, 1, 1,
0.2014691, 1.981229, 0.894433, 0, 0, 0, 1, 1,
0.2072184, -0.784417, 2.246791, 1, 1, 1, 1, 1,
0.2077044, -1.029575, 4.281167, 1, 1, 1, 1, 1,
0.210575, 0.2263058, 3.273537, 1, 1, 1, 1, 1,
0.2106138, 0.2362796, 1.099532, 1, 1, 1, 1, 1,
0.212135, -0.4271225, 2.966676, 1, 1, 1, 1, 1,
0.2123031, -0.6199712, 3.329124, 1, 1, 1, 1, 1,
0.2132818, -0.8759534, 3.280842, 1, 1, 1, 1, 1,
0.2135621, -0.9253514, 3.803144, 1, 1, 1, 1, 1,
0.2151715, 0.3632022, -0.8866737, 1, 1, 1, 1, 1,
0.2181307, 0.02776963, 0.811491, 1, 1, 1, 1, 1,
0.2185724, 0.3288269, 1.552866, 1, 1, 1, 1, 1,
0.2198389, 0.6109342, -1.1828, 1, 1, 1, 1, 1,
0.223515, -0.9990001, 4.572231, 1, 1, 1, 1, 1,
0.2268381, 0.7997275, 1.267702, 1, 1, 1, 1, 1,
0.2284589, 0.3661502, 0.6386867, 1, 1, 1, 1, 1,
0.2329483, 2.07131, -1.177007, 0, 0, 1, 1, 1,
0.2341372, 1.301457, -0.5440122, 1, 0, 0, 1, 1,
0.2347928, 0.3274528, -0.1568238, 1, 0, 0, 1, 1,
0.2351013, 1.553369, -0.6799477, 1, 0, 0, 1, 1,
0.2466244, -0.5081279, 1.303114, 1, 0, 0, 1, 1,
0.2530063, 0.8684412, -1.027583, 1, 0, 0, 1, 1,
0.2540897, -0.7711198, 3.039617, 0, 0, 0, 1, 1,
0.2543875, 1.976264, 0.6090813, 0, 0, 0, 1, 1,
0.2581328, -1.396935, 4.525569, 0, 0, 0, 1, 1,
0.2586181, 2.017292, 0.500825, 0, 0, 0, 1, 1,
0.2595034, -0.5532176, 2.862208, 0, 0, 0, 1, 1,
0.2616164, -1.62965, 0.7778766, 0, 0, 0, 1, 1,
0.2662547, -1.259102, 2.869136, 0, 0, 0, 1, 1,
0.2705853, 0.5532909, 0.05294225, 1, 1, 1, 1, 1,
0.2709869, 0.3417123, -1.150558, 1, 1, 1, 1, 1,
0.2713792, -0.247803, 2.325624, 1, 1, 1, 1, 1,
0.2779147, -0.09848478, 2.635991, 1, 1, 1, 1, 1,
0.2819158, 0.4360746, -1.244536, 1, 1, 1, 1, 1,
0.2824091, 0.2639467, -0.3756583, 1, 1, 1, 1, 1,
0.2829835, -1.541513, 3.912906, 1, 1, 1, 1, 1,
0.2857088, -1.74274, 1.848753, 1, 1, 1, 1, 1,
0.2861057, -1.137119, 4.512003, 1, 1, 1, 1, 1,
0.2863182, 0.9494108, -0.1117571, 1, 1, 1, 1, 1,
0.2864543, -0.8330244, 2.791519, 1, 1, 1, 1, 1,
0.2956035, -0.3935401, 4.836143, 1, 1, 1, 1, 1,
0.2992466, 1.489652, 0.1803271, 1, 1, 1, 1, 1,
0.3041051, -0.1435471, 1.445822, 1, 1, 1, 1, 1,
0.3047612, -0.184676, 2.083189, 1, 1, 1, 1, 1,
0.3136264, -1.970985, 4.421758, 0, 0, 1, 1, 1,
0.3164289, -0.6150917, 3.575613, 1, 0, 0, 1, 1,
0.3176552, -0.8044601, 1.563815, 1, 0, 0, 1, 1,
0.3193093, 1.220252, -0.5322299, 1, 0, 0, 1, 1,
0.3292306, 0.369525, 1.101046, 1, 0, 0, 1, 1,
0.3316393, 0.2678577, 1.694991, 1, 0, 0, 1, 1,
0.3321786, 0.2174675, 3.263699, 0, 0, 0, 1, 1,
0.3359332, -1.064768, 2.896174, 0, 0, 0, 1, 1,
0.3394154, 1.558249, -0.2730303, 0, 0, 0, 1, 1,
0.3488864, 0.6963103, 0.3108509, 0, 0, 0, 1, 1,
0.3497022, 1.725993, -0.2156127, 0, 0, 0, 1, 1,
0.3503369, -0.9606128, 4.232162, 0, 0, 0, 1, 1,
0.352402, -1.700264, 1.124933, 0, 0, 0, 1, 1,
0.3545428, -0.2089088, 1.518326, 1, 1, 1, 1, 1,
0.3586897, -0.2256109, 1.449775, 1, 1, 1, 1, 1,
0.3649195, 0.2617805, 0.5961924, 1, 1, 1, 1, 1,
0.3679184, -0.6682558, 3.523359, 1, 1, 1, 1, 1,
0.3741714, -1.965125, 3.541808, 1, 1, 1, 1, 1,
0.3764457, 0.9379337, -0.9417501, 1, 1, 1, 1, 1,
0.3831238, 0.3350485, -1.203826, 1, 1, 1, 1, 1,
0.3856647, -0.7340978, 3.245671, 1, 1, 1, 1, 1,
0.3876163, -0.2437792, 3.193078, 1, 1, 1, 1, 1,
0.3877398, 1.265867, -0.7050599, 1, 1, 1, 1, 1,
0.3928564, -0.1824272, 2.118488, 1, 1, 1, 1, 1,
0.3969346, 3.636566, -0.395219, 1, 1, 1, 1, 1,
0.3976928, -0.2823732, 3.118136, 1, 1, 1, 1, 1,
0.3987798, -0.04418418, 2.826585, 1, 1, 1, 1, 1,
0.3999164, 1.320993, -0.9691868, 1, 1, 1, 1, 1,
0.4009205, -0.2909306, 2.871833, 0, 0, 1, 1, 1,
0.4011462, 0.5552688, 1.683872, 1, 0, 0, 1, 1,
0.4062769, -0.3703961, 0.933006, 1, 0, 0, 1, 1,
0.4080079, -0.1220227, 1.810224, 1, 0, 0, 1, 1,
0.410704, -0.7378333, 3.937548, 1, 0, 0, 1, 1,
0.4137703, 1.295448, -1.959484, 1, 0, 0, 1, 1,
0.4156269, -0.3467732, 2.305777, 0, 0, 0, 1, 1,
0.4227682, 0.06532158, 0.5132124, 0, 0, 0, 1, 1,
0.4275792, 0.3364713, 3.959979, 0, 0, 0, 1, 1,
0.4320712, 0.9511445, -1.551655, 0, 0, 0, 1, 1,
0.4380765, 1.340275, -1.784982, 0, 0, 0, 1, 1,
0.4381999, -0.1145599, 2.099104, 0, 0, 0, 1, 1,
0.4399608, 0.4276184, -0.7205994, 0, 0, 0, 1, 1,
0.4415944, 2.9998, 0.5075839, 1, 1, 1, 1, 1,
0.4433203, -0.1362384, 1.896278, 1, 1, 1, 1, 1,
0.443437, -0.7897071, 2.887666, 1, 1, 1, 1, 1,
0.4454025, -0.6969166, 4.247488, 1, 1, 1, 1, 1,
0.4481703, 0.01600805, 1.530219, 1, 1, 1, 1, 1,
0.4493692, 0.641751, 0.3811657, 1, 1, 1, 1, 1,
0.4523895, -1.412628, 2.475974, 1, 1, 1, 1, 1,
0.4602639, 1.774144, 0.8631259, 1, 1, 1, 1, 1,
0.4609062, -0.1465976, 3.907619, 1, 1, 1, 1, 1,
0.4615228, 1.099487, -0.4403057, 1, 1, 1, 1, 1,
0.465459, 1.134684, -0.4923803, 1, 1, 1, 1, 1,
0.4672146, -1.178155, 2.298058, 1, 1, 1, 1, 1,
0.4690992, 0.880047, -0.6731463, 1, 1, 1, 1, 1,
0.4743159, 0.2371861, 0.7143579, 1, 1, 1, 1, 1,
0.483182, -0.426203, 2.019615, 1, 1, 1, 1, 1,
0.4835722, -0.002521157, 0.3643703, 0, 0, 1, 1, 1,
0.484302, 1.416338, 1.4956, 1, 0, 0, 1, 1,
0.4865106, 0.2356044, -0.3396323, 1, 0, 0, 1, 1,
0.4908658, 0.3141201, 1.553386, 1, 0, 0, 1, 1,
0.4970321, 1.228673, -0.9341871, 1, 0, 0, 1, 1,
0.4997512, -2.13936, 1.800637, 1, 0, 0, 1, 1,
0.5009077, 0.1185371, 1.23298, 0, 0, 0, 1, 1,
0.5011213, -0.9499624, 0.9354895, 0, 0, 0, 1, 1,
0.502726, -0.718826, 2.140302, 0, 0, 0, 1, 1,
0.5029387, 0.633732, 1.739613, 0, 0, 0, 1, 1,
0.5040066, 0.1072837, 0.5562772, 0, 0, 0, 1, 1,
0.5063186, 0.8737571, 1.905701, 0, 0, 0, 1, 1,
0.5073327, -0.2172658, 2.41321, 0, 0, 0, 1, 1,
0.5078717, -1.897384, 3.409574, 1, 1, 1, 1, 1,
0.5100378, 0.6212795, 1.647125, 1, 1, 1, 1, 1,
0.5149491, 0.9648671, 0.129406, 1, 1, 1, 1, 1,
0.5171279, 0.4182692, 1.514048, 1, 1, 1, 1, 1,
0.5194342, 0.4141591, 1.83603, 1, 1, 1, 1, 1,
0.5217744, -2.00725, 2.917333, 1, 1, 1, 1, 1,
0.5233448, 1.212632, -0.9163787, 1, 1, 1, 1, 1,
0.5247349, -1.576809, 1.776645, 1, 1, 1, 1, 1,
0.5256179, -0.9280778, 3.228948, 1, 1, 1, 1, 1,
0.5303735, 0.8225878, -0.9023509, 1, 1, 1, 1, 1,
0.5311697, -0.8035108, 3.522699, 1, 1, 1, 1, 1,
0.5331793, 0.2969252, 0.5179754, 1, 1, 1, 1, 1,
0.5374891, 0.4386891, 1.460733, 1, 1, 1, 1, 1,
0.5417842, -0.7641611, 2.716926, 1, 1, 1, 1, 1,
0.5419263, -1.025941, 0.6475253, 1, 1, 1, 1, 1,
0.5424372, 0.2934117, 1.506049, 0, 0, 1, 1, 1,
0.5487468, 1.395352, 0.8359033, 1, 0, 0, 1, 1,
0.5506837, -1.13899, 3.058531, 1, 0, 0, 1, 1,
0.5525658, 0.3561658, -0.2937266, 1, 0, 0, 1, 1,
0.5534506, 0.994563, -0.7283336, 1, 0, 0, 1, 1,
0.5638025, 0.138107, 0.814365, 1, 0, 0, 1, 1,
0.5647461, 1.158805, -1.474887, 0, 0, 0, 1, 1,
0.5649046, 0.6966332, -0.278567, 0, 0, 0, 1, 1,
0.5656011, -1.507607, 0.2743858, 0, 0, 0, 1, 1,
0.5676766, 1.099054, -0.8600689, 0, 0, 0, 1, 1,
0.5756791, -0.1445767, 1.495285, 0, 0, 0, 1, 1,
0.5811334, 1.788556, 0.2509722, 0, 0, 0, 1, 1,
0.582036, -1.127841, 3.015913, 0, 0, 0, 1, 1,
0.5945607, -1.425304, 3.115118, 1, 1, 1, 1, 1,
0.598601, -0.3814706, 3.089391, 1, 1, 1, 1, 1,
0.6060603, 0.4119663, 0.870775, 1, 1, 1, 1, 1,
0.6152099, 0.2042133, 0.5690708, 1, 1, 1, 1, 1,
0.6194328, 1.212542, 0.2702016, 1, 1, 1, 1, 1,
0.6263365, -1.105983, 3.626771, 1, 1, 1, 1, 1,
0.626355, 1.075557, -0.003636817, 1, 1, 1, 1, 1,
0.6289195, 0.8132623, 1.995966, 1, 1, 1, 1, 1,
0.6301302, 0.1891424, 1.409155, 1, 1, 1, 1, 1,
0.6317607, -1.277416, 3.657154, 1, 1, 1, 1, 1,
0.6375062, 0.1586861, 1.715728, 1, 1, 1, 1, 1,
0.6403788, -0.8915642, 3.053483, 1, 1, 1, 1, 1,
0.6419842, -1.018502, 2.602075, 1, 1, 1, 1, 1,
0.6436518, 2.000324, 1.090034, 1, 1, 1, 1, 1,
0.6510443, 0.1131535, 2.379636, 1, 1, 1, 1, 1,
0.655593, 0.6145052, 3.092812, 0, 0, 1, 1, 1,
0.6583495, 0.2441785, 3.211527, 1, 0, 0, 1, 1,
0.6617094, -1.350025, 1.60567, 1, 0, 0, 1, 1,
0.6663198, -0.8678056, 1.004642, 1, 0, 0, 1, 1,
0.6675633, 0.9752526, 2.163654, 1, 0, 0, 1, 1,
0.6688188, 0.04009595, 0.6407368, 1, 0, 0, 1, 1,
0.6716475, -1.966449, 4.446566, 0, 0, 0, 1, 1,
0.6782157, 0.5607589, 0.3860563, 0, 0, 0, 1, 1,
0.6786503, 0.9641801, -0.1602315, 0, 0, 0, 1, 1,
0.6843727, 1.17642, 1.132687, 0, 0, 0, 1, 1,
0.6948833, -0.5086523, 2.298444, 0, 0, 0, 1, 1,
0.695177, -4.077242, 4.062097, 0, 0, 0, 1, 1,
0.6962551, -1.41359, 3.399633, 0, 0, 0, 1, 1,
0.7000782, 0.5842324, -0.06820069, 1, 1, 1, 1, 1,
0.7099377, 0.7623296, 3.351504, 1, 1, 1, 1, 1,
0.711234, 0.9229446, -0.3494176, 1, 1, 1, 1, 1,
0.7131871, 0.964288, 0.399419, 1, 1, 1, 1, 1,
0.7239969, 2.393588, -0.1263417, 1, 1, 1, 1, 1,
0.7268353, 0.3428154, 1.487342, 1, 1, 1, 1, 1,
0.7403598, 1.090323, 1.309045, 1, 1, 1, 1, 1,
0.7459726, 0.7457982, -0.02298757, 1, 1, 1, 1, 1,
0.7519871, 1.39435, 2.125932, 1, 1, 1, 1, 1,
0.7563866, -0.436383, 1.933411, 1, 1, 1, 1, 1,
0.7635456, 0.3221448, 2.096382, 1, 1, 1, 1, 1,
0.7753945, 0.2676405, 1.393444, 1, 1, 1, 1, 1,
0.77835, -0.997446, 1.090343, 1, 1, 1, 1, 1,
0.7784845, 1.815311, 1.511185, 1, 1, 1, 1, 1,
0.7841256, -0.8591852, 2.784257, 1, 1, 1, 1, 1,
0.7883911, -0.8275717, 3.416034, 0, 0, 1, 1, 1,
0.7928016, 1.167496, 0.5601071, 1, 0, 0, 1, 1,
0.7929052, -0.4119061, 2.126439, 1, 0, 0, 1, 1,
0.7984141, 1.391878, 2.311241, 1, 0, 0, 1, 1,
0.7993923, 0.7475242, 1.904296, 1, 0, 0, 1, 1,
0.7994167, -1.217788, 2.859328, 1, 0, 0, 1, 1,
0.8018433, -0.1100416, 1.995892, 0, 0, 0, 1, 1,
0.8073791, -2.276434, 1.261664, 0, 0, 0, 1, 1,
0.812681, 0.4318119, 1.427723, 0, 0, 0, 1, 1,
0.8156333, 0.8118515, 1.633223, 0, 0, 0, 1, 1,
0.8163145, -0.7220879, 2.802485, 0, 0, 0, 1, 1,
0.8176034, 1.745056, 1.162898, 0, 0, 0, 1, 1,
0.8205433, -1.198304, 2.88603, 0, 0, 0, 1, 1,
0.8231599, -1.799478, 4.425383, 1, 1, 1, 1, 1,
0.8252844, -1.082672, 1.587784, 1, 1, 1, 1, 1,
0.8334136, -0.2208614, 2.7433, 1, 1, 1, 1, 1,
0.8354975, -0.7096056, 2.156137, 1, 1, 1, 1, 1,
0.8376015, -0.2597797, 2.468358, 1, 1, 1, 1, 1,
0.8376568, -0.113761, 1.574221, 1, 1, 1, 1, 1,
0.850179, 0.3292228, -0.2337091, 1, 1, 1, 1, 1,
0.8511198, 2.525654, 0.585438, 1, 1, 1, 1, 1,
0.8523583, -1.047375, 2.269854, 1, 1, 1, 1, 1,
0.853178, 1.009246, 1.402009, 1, 1, 1, 1, 1,
0.8595222, -1.307511, 1.107593, 1, 1, 1, 1, 1,
0.8605129, 0.9150226, -0.6196303, 1, 1, 1, 1, 1,
0.8611736, 1.378015, 1.158196, 1, 1, 1, 1, 1,
0.8664038, 0.3533089, -0.4120361, 1, 1, 1, 1, 1,
0.8699765, 0.05921466, 2.364084, 1, 1, 1, 1, 1,
0.8790891, 0.9515489, 2.292579, 0, 0, 1, 1, 1,
0.8808559, -0.006391033, 0.6986735, 1, 0, 0, 1, 1,
0.8895649, -0.6940989, 3.496258, 1, 0, 0, 1, 1,
0.8912055, 1.742748, 0.1017461, 1, 0, 0, 1, 1,
0.8953991, -0.7349329, 3.060134, 1, 0, 0, 1, 1,
0.8964285, -1.16027, 2.724474, 1, 0, 0, 1, 1,
0.8974587, -0.4192746, 2.068701, 0, 0, 0, 1, 1,
0.8980758, 0.2785945, 2.839528, 0, 0, 0, 1, 1,
0.9017632, 0.7954574, -0.3781034, 0, 0, 0, 1, 1,
0.9019611, 0.6637554, 1.537718, 0, 0, 0, 1, 1,
0.9030114, -1.810519, 1.567255, 0, 0, 0, 1, 1,
0.9095723, -2.024521, 2.729599, 0, 0, 0, 1, 1,
0.9115011, -0.3605775, 2.065425, 0, 0, 0, 1, 1,
0.913188, 0.5207123, 0.4295211, 1, 1, 1, 1, 1,
0.9140047, 1.534707, 1.015187, 1, 1, 1, 1, 1,
0.9157003, -0.3808018, 3.088112, 1, 1, 1, 1, 1,
0.9165093, 0.7806622, -1.123466, 1, 1, 1, 1, 1,
0.9217004, 0.2627487, -0.453414, 1, 1, 1, 1, 1,
0.9244601, 0.1806508, 0.3067387, 1, 1, 1, 1, 1,
0.9274963, 0.9932399, 0.2098341, 1, 1, 1, 1, 1,
0.9290698, 0.5566061, 1.565541, 1, 1, 1, 1, 1,
0.9297317, -0.7171896, 1.094978, 1, 1, 1, 1, 1,
0.9314099, 2.637503, 0.9486861, 1, 1, 1, 1, 1,
0.9327959, -0.2668755, 2.203238, 1, 1, 1, 1, 1,
0.9365014, 0.2495279, 1.263518, 1, 1, 1, 1, 1,
0.9394746, -0.5973253, 2.301001, 1, 1, 1, 1, 1,
0.9452149, -1.315464, 1.588173, 1, 1, 1, 1, 1,
0.9556414, -0.08780078, 1.697861, 1, 1, 1, 1, 1,
0.9640911, -1.41766, 3.497111, 0, 0, 1, 1, 1,
0.9661881, -1.030187, 3.729308, 1, 0, 0, 1, 1,
0.9723772, 0.384656, 0.5770606, 1, 0, 0, 1, 1,
0.9747498, 0.6429897, 0.5218264, 1, 0, 0, 1, 1,
0.9784386, 0.5986456, 1.329482, 1, 0, 0, 1, 1,
0.9862436, 0.02098329, 0.9998059, 1, 0, 0, 1, 1,
0.9884904, 0.05598775, 0.751926, 0, 0, 0, 1, 1,
0.9983808, 0.7311872, 0.6641386, 0, 0, 0, 1, 1,
1.005211, 1.17836, 0.1607531, 0, 0, 0, 1, 1,
1.008153, 1.762397, 3.555481, 0, 0, 0, 1, 1,
1.009526, -0.2301487, 3.655, 0, 0, 0, 1, 1,
1.014417, 0.24367, 0.5868417, 0, 0, 0, 1, 1,
1.017066, 1.253467, 0.5712367, 0, 0, 0, 1, 1,
1.020099, -1.020323, 0.2880578, 1, 1, 1, 1, 1,
1.026612, 0.2368912, 1.265674, 1, 1, 1, 1, 1,
1.034156, 0.5980309, -0.2030432, 1, 1, 1, 1, 1,
1.036315, -0.1637859, 2.908446, 1, 1, 1, 1, 1,
1.039032, 2.782327, 0.5620971, 1, 1, 1, 1, 1,
1.040867, -0.1671773, 2.669909, 1, 1, 1, 1, 1,
1.046739, 0.2870222, 0.6229514, 1, 1, 1, 1, 1,
1.052823, 0.1543099, 0.02025289, 1, 1, 1, 1, 1,
1.058905, 1.213305, 3.61749, 1, 1, 1, 1, 1,
1.067596, -0.1148697, 2.624106, 1, 1, 1, 1, 1,
1.07036, 0.5421279, 0.6382805, 1, 1, 1, 1, 1,
1.073689, 0.2630371, -0.242977, 1, 1, 1, 1, 1,
1.086115, 0.003190719, 2.044674, 1, 1, 1, 1, 1,
1.088999, 1.001317, -0.2743641, 1, 1, 1, 1, 1,
1.089528, -0.2749654, 0.9594483, 1, 1, 1, 1, 1,
1.089741, -0.3245512, 3.322787, 0, 0, 1, 1, 1,
1.09042, -1.105991, 0.8799593, 1, 0, 0, 1, 1,
1.096238, -0.1667103, 2.005927, 1, 0, 0, 1, 1,
1.099314, 0.764201, 0.2740386, 1, 0, 0, 1, 1,
1.105163, -0.07206436, 0.8170459, 1, 0, 0, 1, 1,
1.106324, 0.2586786, 0.2140715, 1, 0, 0, 1, 1,
1.106406, 0.7984142, -0.181008, 0, 0, 0, 1, 1,
1.109009, 0.182962, -0.4454453, 0, 0, 0, 1, 1,
1.110715, 0.2479138, 1.725833, 0, 0, 0, 1, 1,
1.117182, -1.177669, 2.189485, 0, 0, 0, 1, 1,
1.128231, 0.2922778, 1.280792, 0, 0, 0, 1, 1,
1.129616, 0.05047916, 1.752221, 0, 0, 0, 1, 1,
1.134803, -1.579942, 0.2546232, 0, 0, 0, 1, 1,
1.135304, -0.7255876, 2.165073, 1, 1, 1, 1, 1,
1.136127, 0.4328516, 1.37267, 1, 1, 1, 1, 1,
1.141587, 1.514526, 0.2558195, 1, 1, 1, 1, 1,
1.146453, 0.9734416, 0.2098499, 1, 1, 1, 1, 1,
1.147751, -0.05029838, 0.8167889, 1, 1, 1, 1, 1,
1.154877, 0.7099382, 0.9265569, 1, 1, 1, 1, 1,
1.16129, 0.1814453, 1.35549, 1, 1, 1, 1, 1,
1.164675, -0.2128235, 1.136922, 1, 1, 1, 1, 1,
1.16522, 0.2741078, 0.9551503, 1, 1, 1, 1, 1,
1.187931, 1.852728, 0.2041607, 1, 1, 1, 1, 1,
1.192258, -0.4626538, 4.293697, 1, 1, 1, 1, 1,
1.198596, -0.8946231, 1.054989, 1, 1, 1, 1, 1,
1.198971, -0.06417528, 3.215601, 1, 1, 1, 1, 1,
1.200205, -2.279438, 3.358176, 1, 1, 1, 1, 1,
1.201544, -0.9275654, 3.121658, 1, 1, 1, 1, 1,
1.224994, 0.8326566, 0.9481222, 0, 0, 1, 1, 1,
1.228577, 0.1665425, 1.865122, 1, 0, 0, 1, 1,
1.238647, -1.000026, 4.123005, 1, 0, 0, 1, 1,
1.24907, -1.474176, 1.48332, 1, 0, 0, 1, 1,
1.252361, -0.9113236, 2.825123, 1, 0, 0, 1, 1,
1.255208, -1.144135, 4.196448, 1, 0, 0, 1, 1,
1.257786, -0.5485644, 1.762376, 0, 0, 0, 1, 1,
1.26028, 0.3649817, -1.048104, 0, 0, 0, 1, 1,
1.266729, -0.2085714, -0.005893255, 0, 0, 0, 1, 1,
1.271322, -0.5106348, 1.359711, 0, 0, 0, 1, 1,
1.274742, 2.16291, 0.4735588, 0, 0, 0, 1, 1,
1.27912, -1.111026, 2.933596, 0, 0, 0, 1, 1,
1.282733, -1.52941, 3.142564, 0, 0, 0, 1, 1,
1.285001, 0.4456361, 1.932839, 1, 1, 1, 1, 1,
1.291454, 0.8710214, 1.625454, 1, 1, 1, 1, 1,
1.293617, 0.749943, 1.849504, 1, 1, 1, 1, 1,
1.297351, -0.05906244, 2.207809, 1, 1, 1, 1, 1,
1.306341, -0.3914607, 2.078023, 1, 1, 1, 1, 1,
1.307757, -0.4014962, 0.7054252, 1, 1, 1, 1, 1,
1.317546, -0.749969, 2.585299, 1, 1, 1, 1, 1,
1.317864, -0.172709, 2.568079, 1, 1, 1, 1, 1,
1.324435, 0.5868093, 0.6248208, 1, 1, 1, 1, 1,
1.324621, 0.04797887, 0.9109805, 1, 1, 1, 1, 1,
1.328368, 0.6607442, 1.77383, 1, 1, 1, 1, 1,
1.330771, 1.692109, 1.518008, 1, 1, 1, 1, 1,
1.347484, 0.8179033, 1.249452, 1, 1, 1, 1, 1,
1.347925, 0.9578328, 0.1656267, 1, 1, 1, 1, 1,
1.376048, -1.801123, 2.687657, 1, 1, 1, 1, 1,
1.382691, -0.8046452, 0.8290511, 0, 0, 1, 1, 1,
1.388195, 1.928232, 0.2466951, 1, 0, 0, 1, 1,
1.400172, 0.3210425, 1.867073, 1, 0, 0, 1, 1,
1.408203, 0.780376, 0.5083585, 1, 0, 0, 1, 1,
1.412204, 0.2836511, 0.815818, 1, 0, 0, 1, 1,
1.420422, 0.5282265, 2.188616, 1, 0, 0, 1, 1,
1.422858, 0.2890735, -0.3485604, 0, 0, 0, 1, 1,
1.42598, 1.637697, 1.165919, 0, 0, 0, 1, 1,
1.448936, 1.246068, -1.044173, 0, 0, 0, 1, 1,
1.449359, -0.3170026, 0.5716861, 0, 0, 0, 1, 1,
1.450861, -1.773377, 2.820963, 0, 0, 0, 1, 1,
1.453509, -0.8836206, 3.438815, 0, 0, 0, 1, 1,
1.467576, 0.4282617, 0.4015183, 0, 0, 0, 1, 1,
1.480468, 0.5373851, 2.469128, 1, 1, 1, 1, 1,
1.481357, 1.19529, -1.217794, 1, 1, 1, 1, 1,
1.484394, -0.699137, -0.1106118, 1, 1, 1, 1, 1,
1.49267, -0.9253294, 1.18825, 1, 1, 1, 1, 1,
1.499882, -1.752502, 2.246976, 1, 1, 1, 1, 1,
1.502232, 0.6738449, 0.2662516, 1, 1, 1, 1, 1,
1.537222, -0.6890594, 1.053251, 1, 1, 1, 1, 1,
1.540557, -1.104213, 3.028375, 1, 1, 1, 1, 1,
1.55062, 1.465284, 2.406293, 1, 1, 1, 1, 1,
1.554675, 0.6967731, 1.498044, 1, 1, 1, 1, 1,
1.591561, 1.164661, 2.463591, 1, 1, 1, 1, 1,
1.62115, -0.003559153, 0.7447933, 1, 1, 1, 1, 1,
1.635568, 1.032467, 0.6462764, 1, 1, 1, 1, 1,
1.635627, 0.1592712, 2.113422, 1, 1, 1, 1, 1,
1.635807, 0.2612015, 1.627666, 1, 1, 1, 1, 1,
1.636391, -0.007023794, 1.625207, 0, 0, 1, 1, 1,
1.648955, -0.6024723, 2.13254, 1, 0, 0, 1, 1,
1.65395, 0.9983095, 0.425714, 1, 0, 0, 1, 1,
1.656793, 0.2909374, 3.818497, 1, 0, 0, 1, 1,
1.675813, 1.20358, 1.281885, 1, 0, 0, 1, 1,
1.676589, 1.493401, 2.315025, 1, 0, 0, 1, 1,
1.699027, 1.978742, 1.744948, 0, 0, 0, 1, 1,
1.714453, -1.424565, 0.8456005, 0, 0, 0, 1, 1,
1.731442, 0.3577826, 2.487843, 0, 0, 0, 1, 1,
1.740096, -0.2979697, 2.065336, 0, 0, 0, 1, 1,
1.758668, 0.6060989, 0.2201726, 0, 0, 0, 1, 1,
1.772086, 1.035183, 0.6623014, 0, 0, 0, 1, 1,
1.817675, 1.055726, 0.02861486, 0, 0, 0, 1, 1,
1.826202, 1.206447, 2.248713, 1, 1, 1, 1, 1,
1.837084, -1.413449, 1.318318, 1, 1, 1, 1, 1,
1.844256, 0.4955722, 0.8190973, 1, 1, 1, 1, 1,
1.844849, -1.066257, 1.070419, 1, 1, 1, 1, 1,
1.881099, -0.5281118, 0.7003817, 1, 1, 1, 1, 1,
1.927204, -1.01344, 2.171519, 1, 1, 1, 1, 1,
1.945083, -0.9463209, 0.851588, 1, 1, 1, 1, 1,
1.948409, 0.4501457, 0.7805972, 1, 1, 1, 1, 1,
1.957548, 1.636979, 2.45144, 1, 1, 1, 1, 1,
1.98338, 1.051127, 1.60187, 1, 1, 1, 1, 1,
1.986215, -0.4591195, 2.350411, 1, 1, 1, 1, 1,
2.002307, -0.8260502, 1.42003, 1, 1, 1, 1, 1,
2.020226, 0.8994839, 1.205148, 1, 1, 1, 1, 1,
2.052224, -0.4559805, 1.387808, 1, 1, 1, 1, 1,
2.075772, -0.1562507, 2.986733, 1, 1, 1, 1, 1,
2.075826, 1.012202, 1.817543, 0, 0, 1, 1, 1,
2.080953, 1.033087, 2.838705, 1, 0, 0, 1, 1,
2.091726, -0.5347524, 0.6225756, 1, 0, 0, 1, 1,
2.102267, -0.686341, 3.377331, 1, 0, 0, 1, 1,
2.152727, -0.612391, 2.465447, 1, 0, 0, 1, 1,
2.175644, -0.02604123, 0.007322203, 1, 0, 0, 1, 1,
2.198222, -1.36048, 2.108319, 0, 0, 0, 1, 1,
2.201249, -0.5374874, 2.355015, 0, 0, 0, 1, 1,
2.275527, -1.244058, 1.895371, 0, 0, 0, 1, 1,
2.298632, -0.2950324, 3.150968, 0, 0, 0, 1, 1,
2.349741, 1.07432, -0.4920413, 0, 0, 0, 1, 1,
2.386591, 0.5075788, 1.904393, 0, 0, 0, 1, 1,
2.409759, -0.4690255, 1.690381, 0, 0, 0, 1, 1,
2.487698, 0.4870684, 1.839873, 1, 1, 1, 1, 1,
2.48843, -0.1392404, 2.074809, 1, 1, 1, 1, 1,
2.535721, -1.718257, 2.845518, 1, 1, 1, 1, 1,
2.623062, 0.3376373, 1.658559, 1, 1, 1, 1, 1,
2.649148, -0.1114432, 1.648376, 1, 1, 1, 1, 1,
2.671989, -0.2240596, 1.102161, 1, 1, 1, 1, 1,
3.556808, 0.1068267, 1.660506, 1, 1, 1, 1, 1
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
var radius = 9.791192;
var distance = 34.39115;
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
mvMatrix.translate( 0.03991032, 0.2203383, 0.0383749 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.39115);
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
