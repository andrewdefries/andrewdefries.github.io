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
-3.932518, 0.02481891, -1.464687, 1, 0, 0, 1,
-3.589128, 1.52651, -0.4445915, 1, 0.007843138, 0, 1,
-3.303378, -1.926458, -1.581708, 1, 0.01176471, 0, 1,
-3.245629, -0.3373206, -1.171017, 1, 0.01960784, 0, 1,
-3.018117, 0.1440513, -0.5770313, 1, 0.02352941, 0, 1,
-2.840284, 0.6299443, -2.38659, 1, 0.03137255, 0, 1,
-2.808115, -0.9979679, -2.988225, 1, 0.03529412, 0, 1,
-2.718552, 0.6229553, -1.215369, 1, 0.04313726, 0, 1,
-2.491976, 0.8100524, -1.332165, 1, 0.04705882, 0, 1,
-2.337201, 0.3882564, -1.145916, 1, 0.05490196, 0, 1,
-2.327449, 2.320903, -0.1090301, 1, 0.05882353, 0, 1,
-2.304909, 0.1865902, -1.364216, 1, 0.06666667, 0, 1,
-2.284994, 0.01075064, 0.1627384, 1, 0.07058824, 0, 1,
-2.244024, 1.62732, -1.659654, 1, 0.07843138, 0, 1,
-2.238486, 0.9904677, -1.675039, 1, 0.08235294, 0, 1,
-2.188977, -0.5860211, -0.993131, 1, 0.09019608, 0, 1,
-2.14982, 0.003055951, -2.290444, 1, 0.09411765, 0, 1,
-2.048366, -0.4539211, -2.877754, 1, 0.1019608, 0, 1,
-2.047145, 1.41767, 0.5579495, 1, 0.1098039, 0, 1,
-2.013086, 1.542576, -2.671194, 1, 0.1137255, 0, 1,
-2.013079, -0.2400388, -2.403238, 1, 0.1215686, 0, 1,
-1.971596, 0.9690749, 0.02939089, 1, 0.1254902, 0, 1,
-1.954603, 0.5879908, -0.9189778, 1, 0.1333333, 0, 1,
-1.95037, -0.7459741, -0.462917, 1, 0.1372549, 0, 1,
-1.945081, -1.009376, -1.912885, 1, 0.145098, 0, 1,
-1.945, 0.9719977, -2.321759, 1, 0.1490196, 0, 1,
-1.9294, -0.2808677, -3.354374, 1, 0.1568628, 0, 1,
-1.916214, -1.554307, -3.06059, 1, 0.1607843, 0, 1,
-1.906544, 2.070695, 0.9321079, 1, 0.1686275, 0, 1,
-1.900676, 1.775606, 0.7257228, 1, 0.172549, 0, 1,
-1.896222, 0.3435172, -0.2416213, 1, 0.1803922, 0, 1,
-1.895693, 0.4910391, -1.057023, 1, 0.1843137, 0, 1,
-1.859146, -1.019549, -2.282883, 1, 0.1921569, 0, 1,
-1.855561, -0.9741989, -1.107748, 1, 0.1960784, 0, 1,
-1.770991, 0.06831539, -2.139209, 1, 0.2039216, 0, 1,
-1.765766, 0.1958663, -1.595579, 1, 0.2117647, 0, 1,
-1.748698, -0.2286975, -2.60485, 1, 0.2156863, 0, 1,
-1.747765, -1.394741, -1.186201, 1, 0.2235294, 0, 1,
-1.738225, -0.3395054, -0.4142572, 1, 0.227451, 0, 1,
-1.723006, 0.5194371, 0.02334696, 1, 0.2352941, 0, 1,
-1.710089, -0.2153839, -1.933041, 1, 0.2392157, 0, 1,
-1.709108, 0.3764099, -1.776485, 1, 0.2470588, 0, 1,
-1.704902, -0.9877625, -1.309452, 1, 0.2509804, 0, 1,
-1.690333, 0.3306231, -3.105014, 1, 0.2588235, 0, 1,
-1.688327, -0.6709706, -1.165987, 1, 0.2627451, 0, 1,
-1.687719, -1.172088, -3.652829, 1, 0.2705882, 0, 1,
-1.674692, -0.02790291, -1.468994, 1, 0.2745098, 0, 1,
-1.648247, 0.4029268, 0.6673409, 1, 0.282353, 0, 1,
-1.643128, 0.4411602, -1.22216, 1, 0.2862745, 0, 1,
-1.641259, 1.414023, -0.455117, 1, 0.2941177, 0, 1,
-1.636627, 1.396385, 0.6575622, 1, 0.3019608, 0, 1,
-1.630026, 0.3517015, -2.223647, 1, 0.3058824, 0, 1,
-1.627772, -0.7825956, -3.467263, 1, 0.3137255, 0, 1,
-1.626455, 0.6249076, -1.109948, 1, 0.3176471, 0, 1,
-1.614481, 0.6444271, -0.6811326, 1, 0.3254902, 0, 1,
-1.613861, 1.457696, -0.1265956, 1, 0.3294118, 0, 1,
-1.606599, 1.062662, -2.130816, 1, 0.3372549, 0, 1,
-1.59322, -0.6144723, -2.816332, 1, 0.3411765, 0, 1,
-1.571453, -1.130352, -2.655591, 1, 0.3490196, 0, 1,
-1.562608, -1.238731, -4.130578, 1, 0.3529412, 0, 1,
-1.560921, -1.718136, -1.681155, 1, 0.3607843, 0, 1,
-1.558814, -0.04480128, -2.059548, 1, 0.3647059, 0, 1,
-1.557241, -1.182205, -0.4835801, 1, 0.372549, 0, 1,
-1.548308, 0.2796602, -1.074227, 1, 0.3764706, 0, 1,
-1.531638, -0.5627909, -1.289824, 1, 0.3843137, 0, 1,
-1.527345, 0.5368598, -1.971167, 1, 0.3882353, 0, 1,
-1.525185, -0.8670227, -2.513333, 1, 0.3960784, 0, 1,
-1.524864, -0.5670419, -0.9780139, 1, 0.4039216, 0, 1,
-1.52209, -1.43437, -3.563821, 1, 0.4078431, 0, 1,
-1.512567, -0.5277886, -2.3051, 1, 0.4156863, 0, 1,
-1.504157, 1.175008, -0.6851819, 1, 0.4196078, 0, 1,
-1.489877, 0.6221001, -1.544898, 1, 0.427451, 0, 1,
-1.463955, 0.07056006, -2.254451, 1, 0.4313726, 0, 1,
-1.46288, -0.3589008, -3.429737, 1, 0.4392157, 0, 1,
-1.450998, 0.5337779, -0.8982689, 1, 0.4431373, 0, 1,
-1.425461, -1.348229, -2.511297, 1, 0.4509804, 0, 1,
-1.423573, 0.4532666, -1.958131, 1, 0.454902, 0, 1,
-1.408051, 0.1565485, -1.435898, 1, 0.4627451, 0, 1,
-1.405899, 0.1491952, -2.250824, 1, 0.4666667, 0, 1,
-1.403033, 1.291754, -0.9490498, 1, 0.4745098, 0, 1,
-1.398549, -0.9041247, -1.800747, 1, 0.4784314, 0, 1,
-1.392027, 0.3692369, -1.101857, 1, 0.4862745, 0, 1,
-1.384729, 0.3666411, -1.091346, 1, 0.4901961, 0, 1,
-1.383167, 1.65483, 0.3238033, 1, 0.4980392, 0, 1,
-1.377671, 0.6394542, -0.8651311, 1, 0.5058824, 0, 1,
-1.375736, 0.5222986, -0.6785073, 1, 0.509804, 0, 1,
-1.374013, -0.8799799, -2.943986, 1, 0.5176471, 0, 1,
-1.364159, -1.364551, -2.833498, 1, 0.5215687, 0, 1,
-1.363067, 1.853984, -0.3991699, 1, 0.5294118, 0, 1,
-1.362678, -0.1032443, -1.754796, 1, 0.5333334, 0, 1,
-1.360663, -1.393201, -2.021386, 1, 0.5411765, 0, 1,
-1.358245, -0.4996648, -2.14476, 1, 0.5450981, 0, 1,
-1.354262, -0.02717815, -1.144891, 1, 0.5529412, 0, 1,
-1.354147, 0.6098837, -0.9335474, 1, 0.5568628, 0, 1,
-1.334855, -0.6901837, -2.37926, 1, 0.5647059, 0, 1,
-1.334571, -0.9730601, -1.610572, 1, 0.5686275, 0, 1,
-1.323679, -0.6472273, -1.900506, 1, 0.5764706, 0, 1,
-1.319688, 0.9203247, -1.109515, 1, 0.5803922, 0, 1,
-1.3196, -1.07483, -2.053032, 1, 0.5882353, 0, 1,
-1.318864, 0.2649207, -0.2782831, 1, 0.5921569, 0, 1,
-1.315347, -2.13434, -0.8852663, 1, 0.6, 0, 1,
-1.307592, 1.446789, -1.166266, 1, 0.6078432, 0, 1,
-1.306268, -0.1054673, -1.560411, 1, 0.6117647, 0, 1,
-1.295687, -1.336422, -2.099329, 1, 0.6196079, 0, 1,
-1.286767, -0.02993843, -2.64764, 1, 0.6235294, 0, 1,
-1.28496, -0.5163968, -1.328819, 1, 0.6313726, 0, 1,
-1.281625, 0.7796077, -1.312761, 1, 0.6352941, 0, 1,
-1.272205, -0.1465931, -1.751468, 1, 0.6431373, 0, 1,
-1.269025, 0.1752672, -2.391309, 1, 0.6470588, 0, 1,
-1.268178, 1.677225, -0.8835468, 1, 0.654902, 0, 1,
-1.264455, 0.4958315, -2.042397, 1, 0.6588235, 0, 1,
-1.259734, 0.7632473, -1.219649, 1, 0.6666667, 0, 1,
-1.258064, -0.4241463, -4.255701, 1, 0.6705883, 0, 1,
-1.256189, -1.038263, -4.326584, 1, 0.6784314, 0, 1,
-1.255233, -0.7150713, -1.625015, 1, 0.682353, 0, 1,
-1.247068, 0.2697656, -2.335257, 1, 0.6901961, 0, 1,
-1.246811, -0.9061882, -2.628816, 1, 0.6941177, 0, 1,
-1.244953, 0.2219641, -0.4329757, 1, 0.7019608, 0, 1,
-1.24393, 0.4973898, -0.2336184, 1, 0.7098039, 0, 1,
-1.237287, -1.151291, -0.483692, 1, 0.7137255, 0, 1,
-1.236902, 0.4407654, -1.044801, 1, 0.7215686, 0, 1,
-1.235777, -0.6993486, 1.244008, 1, 0.7254902, 0, 1,
-1.224307, 3.281684, -2.187643, 1, 0.7333333, 0, 1,
-1.214004, -0.04961927, -1.134655, 1, 0.7372549, 0, 1,
-1.21179, -0.8492748, -2.039564, 1, 0.7450981, 0, 1,
-1.193116, -0.6144034, -3.641008, 1, 0.7490196, 0, 1,
-1.180607, 0.4635993, -2.490936, 1, 0.7568628, 0, 1,
-1.180079, 0.6697007, -1.324312, 1, 0.7607843, 0, 1,
-1.176593, 0.6806808, -0.1872506, 1, 0.7686275, 0, 1,
-1.176405, 0.09318181, -0.1522584, 1, 0.772549, 0, 1,
-1.158987, -0.3414955, -2.727883, 1, 0.7803922, 0, 1,
-1.158516, 1.701094, -0.1210827, 1, 0.7843137, 0, 1,
-1.158027, 1.561502, -1.025945, 1, 0.7921569, 0, 1,
-1.153311, 0.9249966, -1.695285, 1, 0.7960784, 0, 1,
-1.151719, 0.08654291, -1.681939, 1, 0.8039216, 0, 1,
-1.14526, -0.0005138253, -3.004213, 1, 0.8117647, 0, 1,
-1.141143, 2.415712, -0.4839839, 1, 0.8156863, 0, 1,
-1.133655, -0.2407484, -0.998395, 1, 0.8235294, 0, 1,
-1.132994, 1.110412, -1.056612, 1, 0.827451, 0, 1,
-1.122274, -1.041378, -3.66485, 1, 0.8352941, 0, 1,
-1.121012, 1.058642, -1.968811, 1, 0.8392157, 0, 1,
-1.115595, -0.3388373, -2.679202, 1, 0.8470588, 0, 1,
-1.109339, -0.3225555, -3.227931, 1, 0.8509804, 0, 1,
-1.107017, -0.2856452, -2.010756, 1, 0.8588235, 0, 1,
-1.100466, -0.4648454, -1.260944, 1, 0.8627451, 0, 1,
-1.091506, -1.413965, -1.876136, 1, 0.8705882, 0, 1,
-1.08872, -0.5422752, -2.181645, 1, 0.8745098, 0, 1,
-1.084502, 0.4052249, -2.347623, 1, 0.8823529, 0, 1,
-1.081661, 0.02404339, -0.7468428, 1, 0.8862745, 0, 1,
-1.080196, 1.283917, 2.41995, 1, 0.8941177, 0, 1,
-1.077581, 0.3608616, -2.113255, 1, 0.8980392, 0, 1,
-1.066936, -0.4603349, -2.527581, 1, 0.9058824, 0, 1,
-1.06547, -1.118631, -2.094305, 1, 0.9137255, 0, 1,
-1.061208, 1.869801, 0.01949541, 1, 0.9176471, 0, 1,
-1.054946, 1.493679, -0.9489201, 1, 0.9254902, 0, 1,
-1.042077, 0.3511976, -1.433047, 1, 0.9294118, 0, 1,
-1.040973, -0.6234354, -0.2850645, 1, 0.9372549, 0, 1,
-1.037772, 2.019943, -0.3415649, 1, 0.9411765, 0, 1,
-1.037256, -0.982112, -0.6289546, 1, 0.9490196, 0, 1,
-1.033407, 0.9492181, -0.7193837, 1, 0.9529412, 0, 1,
-1.028156, -0.5067939, -1.989102, 1, 0.9607843, 0, 1,
-1.024136, 0.8370417, -2.414665, 1, 0.9647059, 0, 1,
-1.022747, -0.5886902, -1.726235, 1, 0.972549, 0, 1,
-1.01725, 0.06645553, -0.06564823, 1, 0.9764706, 0, 1,
-1.010839, -0.7450651, -3.740361, 1, 0.9843137, 0, 1,
-1.007249, -0.7499507, -1.940279, 1, 0.9882353, 0, 1,
-0.9904901, -0.4064146, -4.489206, 1, 0.9960784, 0, 1,
-0.9896472, 0.9936255, -0.8661616, 0.9960784, 1, 0, 1,
-0.9868993, -0.1250998, -0.8504808, 0.9921569, 1, 0, 1,
-0.9817329, 1.988629, 0.6330452, 0.9843137, 1, 0, 1,
-0.981586, -0.5347304, -0.5405245, 0.9803922, 1, 0, 1,
-0.9787441, -1.933862, -2.151644, 0.972549, 1, 0, 1,
-0.9708294, -1.446087, -3.390711, 0.9686275, 1, 0, 1,
-0.9693154, -0.7100582, -4.002412, 0.9607843, 1, 0, 1,
-0.9623873, 1.348806, -0.2018661, 0.9568627, 1, 0, 1,
-0.9595513, -0.4587557, -3.649473, 0.9490196, 1, 0, 1,
-0.9532768, -1.03102, -2.213998, 0.945098, 1, 0, 1,
-0.9404151, -0.3132194, -1.704383, 0.9372549, 1, 0, 1,
-0.936729, -0.8467771, -5.214116, 0.9333333, 1, 0, 1,
-0.9364787, -0.8738025, -2.278927, 0.9254902, 1, 0, 1,
-0.9354284, 1.316371, -0.5718123, 0.9215686, 1, 0, 1,
-0.934085, 0.3739186, -2.673651, 0.9137255, 1, 0, 1,
-0.9312159, -1.123433, -3.040963, 0.9098039, 1, 0, 1,
-0.9284443, -1.066248, -3.426004, 0.9019608, 1, 0, 1,
-0.9238113, 0.1743051, -1.316899, 0.8941177, 1, 0, 1,
-0.9226763, 0.3200321, -1.678703, 0.8901961, 1, 0, 1,
-0.9209994, -0.009249768, -1.334176, 0.8823529, 1, 0, 1,
-0.9209793, 1.717199, -0.3112409, 0.8784314, 1, 0, 1,
-0.9166878, 0.6101575, 0.06077561, 0.8705882, 1, 0, 1,
-0.91544, 0.7103852, 0.04171709, 0.8666667, 1, 0, 1,
-0.9136435, 0.1395101, -3.572194, 0.8588235, 1, 0, 1,
-0.9101944, -2.054474, -2.614281, 0.854902, 1, 0, 1,
-0.9079945, 1.373687, -1.704494, 0.8470588, 1, 0, 1,
-0.9070396, -1.405481, -2.82928, 0.8431373, 1, 0, 1,
-0.9067708, -0.7794543, -0.02983649, 0.8352941, 1, 0, 1,
-0.904871, 0.5650498, -1.987687, 0.8313726, 1, 0, 1,
-0.9002628, -0.8235758, -2.294029, 0.8235294, 1, 0, 1,
-0.8998511, -0.0390203, -0.4540098, 0.8196079, 1, 0, 1,
-0.8898506, 0.08144567, -1.508831, 0.8117647, 1, 0, 1,
-0.8874688, -1.515234, -4.963677, 0.8078431, 1, 0, 1,
-0.8852692, 0.193372, -1.544949, 0.8, 1, 0, 1,
-0.8814813, -0.826332, -2.291748, 0.7921569, 1, 0, 1,
-0.8710629, 1.238805, 0.3007028, 0.7882353, 1, 0, 1,
-0.8695583, -1.01251, -1.801651, 0.7803922, 1, 0, 1,
-0.8640642, 0.3333227, -2.03307, 0.7764706, 1, 0, 1,
-0.8609148, 1.155352, -0.5311905, 0.7686275, 1, 0, 1,
-0.8494724, -0.6862214, -0.8214005, 0.7647059, 1, 0, 1,
-0.8423058, -0.3467306, -2.53489, 0.7568628, 1, 0, 1,
-0.8390606, 1.529609, -1.33161, 0.7529412, 1, 0, 1,
-0.8332868, 1.67549, -1.651717, 0.7450981, 1, 0, 1,
-0.8324608, 0.2830948, -1.110316, 0.7411765, 1, 0, 1,
-0.8299516, 1.698519, -1.429993, 0.7333333, 1, 0, 1,
-0.8265829, 0.2297709, -0.3085841, 0.7294118, 1, 0, 1,
-0.8225764, 0.3427046, -2.571375, 0.7215686, 1, 0, 1,
-0.8171962, -0.01550724, -0.08552257, 0.7176471, 1, 0, 1,
-0.816192, 0.4324861, -0.9597822, 0.7098039, 1, 0, 1,
-0.813984, 0.43811, -1.681532, 0.7058824, 1, 0, 1,
-0.8105534, 0.3565946, -0.8906133, 0.6980392, 1, 0, 1,
-0.8085536, -1.390011, -4.128864, 0.6901961, 1, 0, 1,
-0.8058902, -0.8023974, -2.032618, 0.6862745, 1, 0, 1,
-0.8043042, -1.638435, -3.153847, 0.6784314, 1, 0, 1,
-0.8026174, -0.1484436, -2.408299, 0.6745098, 1, 0, 1,
-0.7978104, -0.1447295, -1.996403, 0.6666667, 1, 0, 1,
-0.7965455, 0.8524027, -1.749828, 0.6627451, 1, 0, 1,
-0.7935876, 0.6740128, -1.534347, 0.654902, 1, 0, 1,
-0.7904808, 1.421848, -2.133956, 0.6509804, 1, 0, 1,
-0.782509, 0.5667008, 0.4451041, 0.6431373, 1, 0, 1,
-0.7790822, 1.010947, -0.650517, 0.6392157, 1, 0, 1,
-0.7757552, -0.9558303, -4.18128, 0.6313726, 1, 0, 1,
-0.7752839, -0.4589433, 0.09049319, 0.627451, 1, 0, 1,
-0.7710435, 1.152313, -0.6858161, 0.6196079, 1, 0, 1,
-0.7708783, 0.4763265, -0.748201, 0.6156863, 1, 0, 1,
-0.7665263, -0.6393911, -3.448759, 0.6078432, 1, 0, 1,
-0.764052, 1.193202, 1.619108, 0.6039216, 1, 0, 1,
-0.7617288, 0.6328353, -1.345192, 0.5960785, 1, 0, 1,
-0.760592, -1.056147, -1.788794, 0.5882353, 1, 0, 1,
-0.7516005, -0.7559794, -3.303432, 0.5843138, 1, 0, 1,
-0.7490142, 0.5229777, -1.204158, 0.5764706, 1, 0, 1,
-0.7485976, 0.5318303, -2.253439, 0.572549, 1, 0, 1,
-0.7448117, -1.405196, -2.011806, 0.5647059, 1, 0, 1,
-0.7416986, -0.07225903, -1.106057, 0.5607843, 1, 0, 1,
-0.741518, 0.1146601, -0.9377143, 0.5529412, 1, 0, 1,
-0.7388101, -0.3102645, -0.8332227, 0.5490196, 1, 0, 1,
-0.7378811, 1.981123, -0.4777783, 0.5411765, 1, 0, 1,
-0.7369024, 0.3217294, -0.4711681, 0.5372549, 1, 0, 1,
-0.73687, 0.5552276, -0.02616915, 0.5294118, 1, 0, 1,
-0.7284592, -1.19524, -2.051568, 0.5254902, 1, 0, 1,
-0.7280236, -0.438679, -3.678349, 0.5176471, 1, 0, 1,
-0.7272289, 0.375118, -0.9920805, 0.5137255, 1, 0, 1,
-0.7172201, -1.356865, -2.696624, 0.5058824, 1, 0, 1,
-0.7120619, -0.6073976, -2.583064, 0.5019608, 1, 0, 1,
-0.710458, 1.568936, -0.2743039, 0.4941176, 1, 0, 1,
-0.7079799, 0.7180517, -2.725251, 0.4862745, 1, 0, 1,
-0.7029067, -0.8415037, -2.980717, 0.4823529, 1, 0, 1,
-0.7027957, 0.0162237, -0.9766558, 0.4745098, 1, 0, 1,
-0.6968802, -1.180948, -3.806534, 0.4705882, 1, 0, 1,
-0.6899185, -0.3374009, -2.165851, 0.4627451, 1, 0, 1,
-0.6877965, 0.9833059, 0.7162439, 0.4588235, 1, 0, 1,
-0.683037, 0.4985711, -0.7324565, 0.4509804, 1, 0, 1,
-0.6801489, 0.08133308, -2.492458, 0.4470588, 1, 0, 1,
-0.6784505, 0.6198878, -0.9482911, 0.4392157, 1, 0, 1,
-0.6778102, -1.446757, -2.485277, 0.4352941, 1, 0, 1,
-0.675851, 0.2894304, 0.7891592, 0.427451, 1, 0, 1,
-0.6711589, -0.5789647, -2.078332, 0.4235294, 1, 0, 1,
-0.6710069, -0.7599376, -1.778996, 0.4156863, 1, 0, 1,
-0.6702329, 0.2607888, -0.6519023, 0.4117647, 1, 0, 1,
-0.6690328, 1.20405, -1.871139, 0.4039216, 1, 0, 1,
-0.6688395, 0.002534789, -1.020945, 0.3960784, 1, 0, 1,
-0.6637654, 0.9272661, 1.5279, 0.3921569, 1, 0, 1,
-0.6626539, 0.1912282, -1.004422, 0.3843137, 1, 0, 1,
-0.6611847, -0.8783154, -1.451984, 0.3803922, 1, 0, 1,
-0.6592745, -0.03729074, -2.211977, 0.372549, 1, 0, 1,
-0.6580548, -1.972127, -2.428234, 0.3686275, 1, 0, 1,
-0.657267, -0.3394724, -0.7863147, 0.3607843, 1, 0, 1,
-0.6571791, 0.07683927, -2.330841, 0.3568628, 1, 0, 1,
-0.6567456, -0.2669405, -0.9871902, 0.3490196, 1, 0, 1,
-0.6566165, 0.6869727, -1.787849, 0.345098, 1, 0, 1,
-0.6539054, 0.7837647, -0.5768281, 0.3372549, 1, 0, 1,
-0.652773, -0.3682752, -2.044417, 0.3333333, 1, 0, 1,
-0.6474319, -1.624553, -1.565852, 0.3254902, 1, 0, 1,
-0.6381482, 0.3339779, 1.288605, 0.3215686, 1, 0, 1,
-0.637938, 1.011289, -1.030173, 0.3137255, 1, 0, 1,
-0.637238, -0.3866588, -2.020161, 0.3098039, 1, 0, 1,
-0.6327935, 0.4639527, -1.387388, 0.3019608, 1, 0, 1,
-0.6271018, -0.6895658, -3.564594, 0.2941177, 1, 0, 1,
-0.6268815, -0.8267588, -3.950482, 0.2901961, 1, 0, 1,
-0.6255937, 1.160959, -0.5283092, 0.282353, 1, 0, 1,
-0.6211238, 0.3408549, -0.3255962, 0.2784314, 1, 0, 1,
-0.6140741, 1.176, -1.53531, 0.2705882, 1, 0, 1,
-0.6139924, -0.3311957, -2.225891, 0.2666667, 1, 0, 1,
-0.6078069, 0.2845061, -1.553214, 0.2588235, 1, 0, 1,
-0.6074763, 1.436864, 0.02640864, 0.254902, 1, 0, 1,
-0.6036875, 0.08937179, -2.829141, 0.2470588, 1, 0, 1,
-0.5990046, 2.018114, 0.6101027, 0.2431373, 1, 0, 1,
-0.5988676, 0.76386, -1.836485, 0.2352941, 1, 0, 1,
-0.5981545, -0.5991237, -2.667188, 0.2313726, 1, 0, 1,
-0.5968496, -2.179946, -1.972253, 0.2235294, 1, 0, 1,
-0.5960084, -0.06291813, -3.518076, 0.2196078, 1, 0, 1,
-0.5958636, -0.1221384, -0.7330477, 0.2117647, 1, 0, 1,
-0.5931093, -0.9272725, -1.267741, 0.2078431, 1, 0, 1,
-0.5917574, 0.09718174, -1.524978, 0.2, 1, 0, 1,
-0.5902345, 0.6742791, -1.727519, 0.1921569, 1, 0, 1,
-0.5856892, -0.1996499, -1.96708, 0.1882353, 1, 0, 1,
-0.5846124, 0.7545224, -0.5809601, 0.1803922, 1, 0, 1,
-0.5769976, 0.5170553, -1.365791, 0.1764706, 1, 0, 1,
-0.5757613, 1.079077, 0.7199873, 0.1686275, 1, 0, 1,
-0.5749301, 1.186433, 0.5104775, 0.1647059, 1, 0, 1,
-0.5715572, -1.083888, -3.623185, 0.1568628, 1, 0, 1,
-0.571127, -1.774884, -3.138114, 0.1529412, 1, 0, 1,
-0.569293, 0.7275275, 0.9614785, 0.145098, 1, 0, 1,
-0.5610854, 0.7850149, 0.2002929, 0.1411765, 1, 0, 1,
-0.5595405, -0.9859604, -2.029498, 0.1333333, 1, 0, 1,
-0.5568815, 0.460117, 0.8303606, 0.1294118, 1, 0, 1,
-0.5543853, -0.2717022, -1.249419, 0.1215686, 1, 0, 1,
-0.5494545, -2.011855, -2.429689, 0.1176471, 1, 0, 1,
-0.5438206, -0.05788597, -2.07571, 0.1098039, 1, 0, 1,
-0.5431702, 1.959429, -2.068593, 0.1058824, 1, 0, 1,
-0.5366148, -1.502062, -2.870539, 0.09803922, 1, 0, 1,
-0.534626, -0.08994234, -1.662393, 0.09019608, 1, 0, 1,
-0.5336897, -0.7974387, -2.688351, 0.08627451, 1, 0, 1,
-0.5331082, 0.6012363, -0.08586211, 0.07843138, 1, 0, 1,
-0.5214708, -0.6682138, -0.1344564, 0.07450981, 1, 0, 1,
-0.5208278, 0.4426923, 1.346283, 0.06666667, 1, 0, 1,
-0.518271, 0.3516062, -0.1864826, 0.0627451, 1, 0, 1,
-0.5168541, -0.682658, -2.384723, 0.05490196, 1, 0, 1,
-0.5164174, 1.544877, -0.3737295, 0.05098039, 1, 0, 1,
-0.512872, -0.7920662, -2.209923, 0.04313726, 1, 0, 1,
-0.5104643, -0.5535441, -2.22631, 0.03921569, 1, 0, 1,
-0.5102019, -0.648629, -2.443333, 0.03137255, 1, 0, 1,
-0.5082653, -0.161824, 0.847609, 0.02745098, 1, 0, 1,
-0.5080743, -1.076844, -3.938188, 0.01960784, 1, 0, 1,
-0.5078681, 0.1122306, -1.36552, 0.01568628, 1, 0, 1,
-0.5038646, 0.6527692, 0.06077452, 0.007843138, 1, 0, 1,
-0.4988535, -0.2967786, -1.881025, 0.003921569, 1, 0, 1,
-0.4979486, 1.214647, -1.078992, 0, 1, 0.003921569, 1,
-0.4951056, 0.01527291, -2.596842, 0, 1, 0.01176471, 1,
-0.494274, 1.722633, 1.45205, 0, 1, 0.01568628, 1,
-0.4930342, -0.8147644, -4.073421, 0, 1, 0.02352941, 1,
-0.4872668, -0.9392667, -0.6755754, 0, 1, 0.02745098, 1,
-0.4869537, 1.10311, -1.061901, 0, 1, 0.03529412, 1,
-0.4855205, -1.344432, -2.288726, 0, 1, 0.03921569, 1,
-0.4816891, 0.4656174, -2.310675, 0, 1, 0.04705882, 1,
-0.4816859, -0.4498296, -2.265993, 0, 1, 0.05098039, 1,
-0.4809769, -0.8409813, -3.558329, 0, 1, 0.05882353, 1,
-0.4791473, -0.8522861, -2.694703, 0, 1, 0.0627451, 1,
-0.4699141, -0.4339593, -2.753955, 0, 1, 0.07058824, 1,
-0.467391, 0.6902665, -0.2689808, 0, 1, 0.07450981, 1,
-0.4644613, 1.557479, 0.3617413, 0, 1, 0.08235294, 1,
-0.4637156, 2.026594, 0.05078666, 0, 1, 0.08627451, 1,
-0.4633275, 0.5617617, -1.806803, 0, 1, 0.09411765, 1,
-0.4617915, 0.1708803, -1.762513, 0, 1, 0.1019608, 1,
-0.4611225, 2.85952, 0.7527771, 0, 1, 0.1058824, 1,
-0.4606566, -0.1078073, -1.212438, 0, 1, 0.1137255, 1,
-0.4600753, 2.092137, 0.02580419, 0, 1, 0.1176471, 1,
-0.4571289, -0.05030925, -2.663122, 0, 1, 0.1254902, 1,
-0.4558363, 0.5407499, -0.7076489, 0, 1, 0.1294118, 1,
-0.455129, 1.01782, -1.114757, 0, 1, 0.1372549, 1,
-0.4493208, 0.1236086, 0.8931015, 0, 1, 0.1411765, 1,
-0.4485983, -0.9563373, -1.774072, 0, 1, 0.1490196, 1,
-0.4462295, 1.653268, 1.680619, 0, 1, 0.1529412, 1,
-0.4380947, -1.994011, -3.165926, 0, 1, 0.1607843, 1,
-0.4337943, 0.4845617, 0.1101377, 0, 1, 0.1647059, 1,
-0.4325888, -0.7864559, -1.288923, 0, 1, 0.172549, 1,
-0.4321696, -0.8124443, -4.848478, 0, 1, 0.1764706, 1,
-0.4283126, 0.4620395, -1.536272, 0, 1, 0.1843137, 1,
-0.424295, -1.591944, -4.122288, 0, 1, 0.1882353, 1,
-0.4194121, 0.1956059, -0.9440856, 0, 1, 0.1960784, 1,
-0.4152614, -0.08978412, 0.364463, 0, 1, 0.2039216, 1,
-0.4081864, 0.2566286, 0.2793152, 0, 1, 0.2078431, 1,
-0.4076694, -0.6647049, -1.648389, 0, 1, 0.2156863, 1,
-0.406134, 1.114551, -0.6397288, 0, 1, 0.2196078, 1,
-0.4043964, 1.384036, 0.4067503, 0, 1, 0.227451, 1,
-0.4027406, -0.6770025, -1.743207, 0, 1, 0.2313726, 1,
-0.4010959, 0.7241304, -0.02092812, 0, 1, 0.2392157, 1,
-0.4001772, 0.211887, -2.508515, 0, 1, 0.2431373, 1,
-0.396625, 0.008051307, -2.204885, 0, 1, 0.2509804, 1,
-0.3937911, 0.3661363, -0.2871554, 0, 1, 0.254902, 1,
-0.393632, 2.365372, -0.6701645, 0, 1, 0.2627451, 1,
-0.3907333, 0.5874243, -1.250881, 0, 1, 0.2666667, 1,
-0.386358, -0.9345624, -1.833323, 0, 1, 0.2745098, 1,
-0.3862539, -1.453588, -3.253951, 0, 1, 0.2784314, 1,
-0.3812943, 0.8327329, -0.9713871, 0, 1, 0.2862745, 1,
-0.370813, 1.625012, 0.4579379, 0, 1, 0.2901961, 1,
-0.370669, 0.7814331, -0.1603429, 0, 1, 0.2980392, 1,
-0.3689915, -0.508989, -2.200958, 0, 1, 0.3058824, 1,
-0.3650003, 0.1154111, -1.581344, 0, 1, 0.3098039, 1,
-0.3642139, 0.1899835, -1.466248, 0, 1, 0.3176471, 1,
-0.3639935, -0.9908861, -2.974139, 0, 1, 0.3215686, 1,
-0.3575273, 0.2687752, -0.7730013, 0, 1, 0.3294118, 1,
-0.3569022, -1.564365, -3.55127, 0, 1, 0.3333333, 1,
-0.3531893, -0.4890333, -2.841312, 0, 1, 0.3411765, 1,
-0.348831, 1.759606, 0.329717, 0, 1, 0.345098, 1,
-0.3459745, 1.284685, 0.225067, 0, 1, 0.3529412, 1,
-0.3433472, 0.639761, -0.6610465, 0, 1, 0.3568628, 1,
-0.3383735, 0.2982669, 0.00668745, 0, 1, 0.3647059, 1,
-0.3337607, -0.6462425, -2.310536, 0, 1, 0.3686275, 1,
-0.3318191, 2.038139, -0.7583838, 0, 1, 0.3764706, 1,
-0.32952, 0.3130175, -0.1824913, 0, 1, 0.3803922, 1,
-0.3248129, -1.443863, -1.243609, 0, 1, 0.3882353, 1,
-0.3211644, 0.01899194, -1.967165, 0, 1, 0.3921569, 1,
-0.3204397, 0.2039377, -1.54143, 0, 1, 0.4, 1,
-0.317157, 0.07209656, -0.3974996, 0, 1, 0.4078431, 1,
-0.3134508, 0.7087061, -1.65268, 0, 1, 0.4117647, 1,
-0.3127632, -2.111559, -3.802009, 0, 1, 0.4196078, 1,
-0.3076272, -0.0001972122, -1.32442, 0, 1, 0.4235294, 1,
-0.3031034, 1.00238, 0.2947952, 0, 1, 0.4313726, 1,
-0.3021182, 2.050022, 0.6671498, 0, 1, 0.4352941, 1,
-0.2990068, -0.1587137, -1.851325, 0, 1, 0.4431373, 1,
-0.2989666, -0.4276651, -2.845599, 0, 1, 0.4470588, 1,
-0.2968524, 0.7830057, 1.426521, 0, 1, 0.454902, 1,
-0.2905306, -1.416156, -3.690696, 0, 1, 0.4588235, 1,
-0.2882288, 1.286963, 1.530331, 0, 1, 0.4666667, 1,
-0.2846358, -1.003325, -4.167539, 0, 1, 0.4705882, 1,
-0.2802683, -0.5447062, -3.777141, 0, 1, 0.4784314, 1,
-0.2713106, -0.1083255, -1.375313, 0, 1, 0.4823529, 1,
-0.2679034, -0.5386676, -3.697246, 0, 1, 0.4901961, 1,
-0.2651406, -0.4581252, -1.057652, 0, 1, 0.4941176, 1,
-0.2596409, 0.6458454, 0.1596812, 0, 1, 0.5019608, 1,
-0.2578168, 0.4155958, 0.1474492, 0, 1, 0.509804, 1,
-0.2571273, -0.4301693, -3.070588, 0, 1, 0.5137255, 1,
-0.2526165, -0.5022901, -2.710107, 0, 1, 0.5215687, 1,
-0.2522145, -0.3973803, -2.748135, 0, 1, 0.5254902, 1,
-0.2515591, -0.2467279, -2.028765, 0, 1, 0.5333334, 1,
-0.2502874, 0.2182692, -0.9918008, 0, 1, 0.5372549, 1,
-0.2479189, 1.261592, -2.678428, 0, 1, 0.5450981, 1,
-0.2372336, 0.1682751, -1.971833, 0, 1, 0.5490196, 1,
-0.2331747, -0.8718852, -1.66344, 0, 1, 0.5568628, 1,
-0.231526, 0.6145885, 1.054941, 0, 1, 0.5607843, 1,
-0.2309237, 0.5150169, 1.42227, 0, 1, 0.5686275, 1,
-0.2274921, -0.7940163, -4.147222, 0, 1, 0.572549, 1,
-0.225338, -0.6383247, -1.730992, 0, 1, 0.5803922, 1,
-0.2247278, -0.02597111, -1.373837, 0, 1, 0.5843138, 1,
-0.221795, -1.626042, -1.432022, 0, 1, 0.5921569, 1,
-0.2197715, 0.9210111, -0.3378901, 0, 1, 0.5960785, 1,
-0.2181848, 0.9158348, 0.3727932, 0, 1, 0.6039216, 1,
-0.2178394, -0.7058793, -2.759385, 0, 1, 0.6117647, 1,
-0.2169778, -0.1394793, -3.353702, 0, 1, 0.6156863, 1,
-0.2125949, -1.884798, -2.473023, 0, 1, 0.6235294, 1,
-0.2052965, -0.09931112, -2.217558, 0, 1, 0.627451, 1,
-0.2006352, 1.516096, 0.9478354, 0, 1, 0.6352941, 1,
-0.1978366, 0.4760303, -0.797144, 0, 1, 0.6392157, 1,
-0.1965109, 0.9621561, -1.700536, 0, 1, 0.6470588, 1,
-0.1960274, 1.14986, -1.143068, 0, 1, 0.6509804, 1,
-0.1948716, 0.7438209, -1.920627, 0, 1, 0.6588235, 1,
-0.1915075, 0.6597164, -1.563429, 0, 1, 0.6627451, 1,
-0.1891732, -0.8404617, -3.514149, 0, 1, 0.6705883, 1,
-0.1891138, 0.8620595, 0.7794878, 0, 1, 0.6745098, 1,
-0.1877332, 0.1390475, -1.104154, 0, 1, 0.682353, 1,
-0.186979, 0.9775795, -0.009368518, 0, 1, 0.6862745, 1,
-0.1812939, -1.61103, -2.74354, 0, 1, 0.6941177, 1,
-0.1795707, 0.9814178, -0.6359378, 0, 1, 0.7019608, 1,
-0.1791843, -0.05180674, -4.193119, 0, 1, 0.7058824, 1,
-0.1791215, 0.6734372, -0.2639445, 0, 1, 0.7137255, 1,
-0.1756046, -0.1257623, -2.103932, 0, 1, 0.7176471, 1,
-0.1744401, 0.8949774, 1.516556, 0, 1, 0.7254902, 1,
-0.1732972, -0.3283353, -3.313104, 0, 1, 0.7294118, 1,
-0.1680153, -0.5512259, -3.58225, 0, 1, 0.7372549, 1,
-0.1676415, 0.6698741, -2.188808, 0, 1, 0.7411765, 1,
-0.1670042, -0.2171697, -4.411854, 0, 1, 0.7490196, 1,
-0.1668174, 0.345647, 0.8158385, 0, 1, 0.7529412, 1,
-0.1646354, -0.6102538, -2.880673, 0, 1, 0.7607843, 1,
-0.1640557, -0.02004355, -1.578965, 0, 1, 0.7647059, 1,
-0.1639003, -0.8463144, -3.476064, 0, 1, 0.772549, 1,
-0.162775, 1.422752, 1.475012, 0, 1, 0.7764706, 1,
-0.157556, 0.7935306, 1.117917, 0, 1, 0.7843137, 1,
-0.1477199, -0.8703215, -4.235898, 0, 1, 0.7882353, 1,
-0.1471481, -1.601276, -4.165607, 0, 1, 0.7960784, 1,
-0.1443645, 1.348467, -2.450801, 0, 1, 0.8039216, 1,
-0.1434822, 0.6850259, -0.4346439, 0, 1, 0.8078431, 1,
-0.133767, 0.5406289, -0.2962033, 0, 1, 0.8156863, 1,
-0.1323587, -0.9225993, -2.576658, 0, 1, 0.8196079, 1,
-0.1297401, -0.6966408, -2.361779, 0, 1, 0.827451, 1,
-0.1255404, -0.08611458, -3.456123, 0, 1, 0.8313726, 1,
-0.1228327, -0.609217, -1.671179, 0, 1, 0.8392157, 1,
-0.1193279, -1.692013, -3.071924, 0, 1, 0.8431373, 1,
-0.1132519, -1.340664, -4.536393, 0, 1, 0.8509804, 1,
-0.1128337, -1.81166, -2.168453, 0, 1, 0.854902, 1,
-0.1122033, 0.2562381, -0.0354766, 0, 1, 0.8627451, 1,
-0.1115884, 1.886315, -2.406437, 0, 1, 0.8666667, 1,
-0.1041249, 1.181839, 1.907959, 0, 1, 0.8745098, 1,
-0.103277, 0.915462, 0.1919327, 0, 1, 0.8784314, 1,
-0.1006283, -0.05302586, -0.5111837, 0, 1, 0.8862745, 1,
-0.09778356, -1.429404, -2.286862, 0, 1, 0.8901961, 1,
-0.09767722, 1.190225, -1.650255, 0, 1, 0.8980392, 1,
-0.09302436, -0.6668547, -3.304625, 0, 1, 0.9058824, 1,
-0.09214352, -0.4028954, -4.242016, 0, 1, 0.9098039, 1,
-0.08886401, 0.9639638, -0.2527925, 0, 1, 0.9176471, 1,
-0.08716799, 0.307589, -1.991978, 0, 1, 0.9215686, 1,
-0.08330435, 0.3944887, 0.4430788, 0, 1, 0.9294118, 1,
-0.08126175, 1.620847, 0.06905265, 0, 1, 0.9333333, 1,
-0.07811649, -1.137868, -3.852378, 0, 1, 0.9411765, 1,
-0.07777895, -0.1054805, -1.763153, 0, 1, 0.945098, 1,
-0.0761423, -0.5710143, -3.853123, 0, 1, 0.9529412, 1,
-0.07604086, -0.1437963, -4.221286, 0, 1, 0.9568627, 1,
-0.0757077, 0.7373204, 1.12104, 0, 1, 0.9647059, 1,
-0.07527231, -0.3980236, -3.124422, 0, 1, 0.9686275, 1,
-0.07245019, -0.5383822, -3.893553, 0, 1, 0.9764706, 1,
-0.06280631, 1.504678, -0.05939824, 0, 1, 0.9803922, 1,
-0.05680624, 0.9536545, -0.0601669, 0, 1, 0.9882353, 1,
-0.05073288, -0.7883754, -2.019117, 0, 1, 0.9921569, 1,
-0.04497238, -0.4856195, -2.219585, 0, 1, 1, 1,
-0.03960234, 0.1371432, 0.9412266, 0, 0.9921569, 1, 1,
-0.0347293, -0.5305789, -3.264437, 0, 0.9882353, 1, 1,
-0.0336925, -2.038968, -3.488146, 0, 0.9803922, 1, 1,
-0.02764358, 0.2070094, -1.136597, 0, 0.9764706, 1, 1,
-0.026093, 1.166001, -0.0675891, 0, 0.9686275, 1, 1,
-0.01823422, -0.08859879, -3.063265, 0, 0.9647059, 1, 1,
-0.01477306, -0.6309117, -2.806468, 0, 0.9568627, 1, 1,
-0.005798273, 0.3816366, -2.981992, 0, 0.9529412, 1, 1,
-0.002126996, -0.1586552, -4.084998, 0, 0.945098, 1, 1,
0.001773488, -0.2232858, 2.156597, 0, 0.9411765, 1, 1,
0.002944803, 0.19884, 0.2032765, 0, 0.9333333, 1, 1,
0.003279934, 1.672922, -1.2578, 0, 0.9294118, 1, 1,
0.007748488, -1.112208, 3.028694, 0, 0.9215686, 1, 1,
0.01227181, -1.099041, 1.967892, 0, 0.9176471, 1, 1,
0.01491515, -0.5779311, 2.497695, 0, 0.9098039, 1, 1,
0.01800465, 1.937383, 1.217485, 0, 0.9058824, 1, 1,
0.01981927, -1.195798, 4.024392, 0, 0.8980392, 1, 1,
0.02068901, 0.4340404, 1.49198, 0, 0.8901961, 1, 1,
0.0259578, -1.103284, 3.494658, 0, 0.8862745, 1, 1,
0.0284563, -0.8142008, 2.953611, 0, 0.8784314, 1, 1,
0.02903201, 0.03767499, -0.7776589, 0, 0.8745098, 1, 1,
0.0298009, 0.5320143, -0.9571219, 0, 0.8666667, 1, 1,
0.03144364, 0.4252467, -0.8195289, 0, 0.8627451, 1, 1,
0.03462529, 1.442405, -0.5280415, 0, 0.854902, 1, 1,
0.03700807, -1.227625, 3.310999, 0, 0.8509804, 1, 1,
0.04101504, 2.344947, 0.719903, 0, 0.8431373, 1, 1,
0.04603112, 2.205778, -1.172889, 0, 0.8392157, 1, 1,
0.04656124, 1.061413, 0.1884188, 0, 0.8313726, 1, 1,
0.05169496, -0.8228609, 4.369252, 0, 0.827451, 1, 1,
0.05802104, 0.4233634, 0.2540276, 0, 0.8196079, 1, 1,
0.06238929, -0.6123813, 4.260047, 0, 0.8156863, 1, 1,
0.06333209, -1.99919, 2.590665, 0, 0.8078431, 1, 1,
0.06482019, 0.7985195, 0.8410769, 0, 0.8039216, 1, 1,
0.06631313, 1.422042, 0.5677508, 0, 0.7960784, 1, 1,
0.07685183, 1.350316, 1.870197, 0, 0.7882353, 1, 1,
0.08426085, 3.033296, -0.3432115, 0, 0.7843137, 1, 1,
0.08804329, 0.4820824, 1.248801, 0, 0.7764706, 1, 1,
0.09249011, -1.32494, 2.449678, 0, 0.772549, 1, 1,
0.09438101, -2.86978, 3.618493, 0, 0.7647059, 1, 1,
0.09528162, 0.3495673, 0.1431777, 0, 0.7607843, 1, 1,
0.09624022, -0.587455, 3.550284, 0, 0.7529412, 1, 1,
0.1048249, -1.157981, 4.210193, 0, 0.7490196, 1, 1,
0.1051586, 0.7234874, -0.9627898, 0, 0.7411765, 1, 1,
0.1055046, -1.059771, 2.823396, 0, 0.7372549, 1, 1,
0.1062502, 0.3486613, 1.154681, 0, 0.7294118, 1, 1,
0.1149194, 0.5515417, -0.4219523, 0, 0.7254902, 1, 1,
0.1185132, 0.1902284, 2.305582, 0, 0.7176471, 1, 1,
0.1196833, 0.5227228, -0.2222163, 0, 0.7137255, 1, 1,
0.1198733, -0.1579182, 3.037361, 0, 0.7058824, 1, 1,
0.1215867, -0.8848676, 2.667863, 0, 0.6980392, 1, 1,
0.1222463, 0.845548, 0.04461225, 0, 0.6941177, 1, 1,
0.1241276, -0.4711135, 3.38957, 0, 0.6862745, 1, 1,
0.1268996, -0.5306893, 3.420457, 0, 0.682353, 1, 1,
0.1286081, 0.1138872, 1.770056, 0, 0.6745098, 1, 1,
0.1312087, -0.2093101, 3.553895, 0, 0.6705883, 1, 1,
0.1314466, 0.2603531, -0.4060401, 0, 0.6627451, 1, 1,
0.1358836, -0.9703713, -0.4508849, 0, 0.6588235, 1, 1,
0.1454064, 1.410994, 1.474648, 0, 0.6509804, 1, 1,
0.145922, 0.5062496, -0.1354883, 0, 0.6470588, 1, 1,
0.147678, 0.0164401, 2.163184, 0, 0.6392157, 1, 1,
0.1507155, -0.5852216, 2.585993, 0, 0.6352941, 1, 1,
0.1515874, -0.2326363, 3.066157, 0, 0.627451, 1, 1,
0.1553968, 0.4750683, -1.230084, 0, 0.6235294, 1, 1,
0.1585696, -0.2023845, 2.325845, 0, 0.6156863, 1, 1,
0.1591451, 0.09078007, 0.563686, 0, 0.6117647, 1, 1,
0.1627709, 0.1482448, 1.696426, 0, 0.6039216, 1, 1,
0.1671716, -0.7355161, 2.254207, 0, 0.5960785, 1, 1,
0.1678726, -0.7885229, 3.083838, 0, 0.5921569, 1, 1,
0.1682473, 0.36766, 0.1809847, 0, 0.5843138, 1, 1,
0.1688157, -1.629356, 0.3739419, 0, 0.5803922, 1, 1,
0.1695816, -0.5493484, 1.924156, 0, 0.572549, 1, 1,
0.170405, 0.104319, 2.205755, 0, 0.5686275, 1, 1,
0.1711149, 0.1231506, 0.871195, 0, 0.5607843, 1, 1,
0.1746965, 0.3862579, 0.7151045, 0, 0.5568628, 1, 1,
0.1752609, 0.174384, -0.07660731, 0, 0.5490196, 1, 1,
0.1762625, -0.6493902, 2.524425, 0, 0.5450981, 1, 1,
0.1764075, -2.460057, 3.362099, 0, 0.5372549, 1, 1,
0.1776543, 1.440865, -0.1614617, 0, 0.5333334, 1, 1,
0.1787094, 0.2875194, 0.5027479, 0, 0.5254902, 1, 1,
0.1789901, -1.623698, 2.628478, 0, 0.5215687, 1, 1,
0.1791651, 0.5646201, 1.003552, 0, 0.5137255, 1, 1,
0.1859228, -0.1820024, 2.37453, 0, 0.509804, 1, 1,
0.1883071, 1.201426, 0.4181592, 0, 0.5019608, 1, 1,
0.1939492, 0.2503666, 1.014245, 0, 0.4941176, 1, 1,
0.1969694, -0.4944982, 1.380028, 0, 0.4901961, 1, 1,
0.1970354, 0.1493627, -0.4576015, 0, 0.4823529, 1, 1,
0.2015684, -0.9786434, 2.943388, 0, 0.4784314, 1, 1,
0.203214, 0.1823507, 0.8383505, 0, 0.4705882, 1, 1,
0.2034028, -0.2306531, 2.727884, 0, 0.4666667, 1, 1,
0.2034144, -1.838253, 2.245071, 0, 0.4588235, 1, 1,
0.2041814, -1.294908, 2.729913, 0, 0.454902, 1, 1,
0.2180906, 0.3665628, 1.835604, 0, 0.4470588, 1, 1,
0.2214099, -0.5612179, 2.631926, 0, 0.4431373, 1, 1,
0.2216914, -1.148463, 1.355542, 0, 0.4352941, 1, 1,
0.2296478, -0.8646034, 4.499032, 0, 0.4313726, 1, 1,
0.2300321, 0.4655811, -0.3521774, 0, 0.4235294, 1, 1,
0.2308011, 0.1531352, 0.9805288, 0, 0.4196078, 1, 1,
0.23202, 0.1575453, -0.4993467, 0, 0.4117647, 1, 1,
0.2322476, 0.7708976, 1.020444, 0, 0.4078431, 1, 1,
0.2461515, 0.1124152, 3.618822, 0, 0.4, 1, 1,
0.2481228, -0.9452621, 2.957942, 0, 0.3921569, 1, 1,
0.2515914, -0.73616, 2.450443, 0, 0.3882353, 1, 1,
0.2524183, 1.160662, -1.71446, 0, 0.3803922, 1, 1,
0.2579831, -2.020204, 2.644173, 0, 0.3764706, 1, 1,
0.2580097, -0.3225386, 2.499853, 0, 0.3686275, 1, 1,
0.2593683, 1.572264, -0.9319004, 0, 0.3647059, 1, 1,
0.2636141, -0.5531273, 2.673666, 0, 0.3568628, 1, 1,
0.2639832, -0.6285256, 3.948509, 0, 0.3529412, 1, 1,
0.2703685, 1.137332, -0.234688, 0, 0.345098, 1, 1,
0.2714726, -0.7595414, 2.221998, 0, 0.3411765, 1, 1,
0.2722169, 0.4152241, 2.962103, 0, 0.3333333, 1, 1,
0.2746986, 0.7369185, 2.287136, 0, 0.3294118, 1, 1,
0.2760646, -0.393499, 0.6731582, 0, 0.3215686, 1, 1,
0.2796757, 0.9079188, -1.057902, 0, 0.3176471, 1, 1,
0.2803324, 0.4213669, 0.5929223, 0, 0.3098039, 1, 1,
0.2848446, 0.1100368, 2.087468, 0, 0.3058824, 1, 1,
0.2848973, -0.315337, 2.886204, 0, 0.2980392, 1, 1,
0.2921734, -0.08417305, 2.827185, 0, 0.2901961, 1, 1,
0.2927427, 1.151658, -0.3608208, 0, 0.2862745, 1, 1,
0.2964936, 1.576832, 1.433892, 0, 0.2784314, 1, 1,
0.2973818, -0.4998342, 3.344449, 0, 0.2745098, 1, 1,
0.2992207, 0.4441045, -0.06219695, 0, 0.2666667, 1, 1,
0.2996691, -1.305602, 1.729622, 0, 0.2627451, 1, 1,
0.3017725, -0.2041583, 2.177896, 0, 0.254902, 1, 1,
0.3042023, 0.5723972, -0.8822879, 0, 0.2509804, 1, 1,
0.3055431, -0.6417652, 4.090274, 0, 0.2431373, 1, 1,
0.311756, 1.281225, -0.5682119, 0, 0.2392157, 1, 1,
0.3145404, -0.1443295, 0.7802475, 0, 0.2313726, 1, 1,
0.3147953, -0.2742897, 2.630415, 0, 0.227451, 1, 1,
0.3172926, -0.3407679, 2.314235, 0, 0.2196078, 1, 1,
0.3190805, 1.246369, 0.3709593, 0, 0.2156863, 1, 1,
0.3205414, -0.8903353, 1.681804, 0, 0.2078431, 1, 1,
0.3210769, -0.6105137, -0.02314725, 0, 0.2039216, 1, 1,
0.3211384, 0.01260897, 1.763911, 0, 0.1960784, 1, 1,
0.324842, -1.862504, 4.9455, 0, 0.1882353, 1, 1,
0.3262933, 0.3676959, 0.7446147, 0, 0.1843137, 1, 1,
0.328079, 0.1321613, 2.924114, 0, 0.1764706, 1, 1,
0.3300399, -0.4010759, 2.592988, 0, 0.172549, 1, 1,
0.3316798, -0.4038946, 2.889551, 0, 0.1647059, 1, 1,
0.3365767, 0.5373892, 1.256997, 0, 0.1607843, 1, 1,
0.3387863, 0.6194173, 0.7644311, 0, 0.1529412, 1, 1,
0.3414819, 0.9060642, 1.839948, 0, 0.1490196, 1, 1,
0.3418588, -0.2500167, 2.594924, 0, 0.1411765, 1, 1,
0.3437364, -0.5230603, 5.134251, 0, 0.1372549, 1, 1,
0.3457895, -0.145682, 1.040009, 0, 0.1294118, 1, 1,
0.3506753, 0.1894969, 2.550261, 0, 0.1254902, 1, 1,
0.3512063, 1.466045, 0.811627, 0, 0.1176471, 1, 1,
0.3529634, -0.244423, 3.23289, 0, 0.1137255, 1, 1,
0.3536903, 0.7614436, 0.3616999, 0, 0.1058824, 1, 1,
0.3580652, 1.561656, 0.05364792, 0, 0.09803922, 1, 1,
0.359206, -0.4870186, 1.31242, 0, 0.09411765, 1, 1,
0.3594446, -1.566847, 2.465266, 0, 0.08627451, 1, 1,
0.3601814, -1.139284, 3.715513, 0, 0.08235294, 1, 1,
0.3642251, -1.362414, 2.60893, 0, 0.07450981, 1, 1,
0.3642525, 0.6333345, -0.2054916, 0, 0.07058824, 1, 1,
0.3664746, 1.342447, -0.2618076, 0, 0.0627451, 1, 1,
0.3690263, -0.7302731, 2.856989, 0, 0.05882353, 1, 1,
0.3702603, -0.13097, 4.831122, 0, 0.05098039, 1, 1,
0.3774363, 0.7293345, 0.568915, 0, 0.04705882, 1, 1,
0.378038, -1.254219, 2.367065, 0, 0.03921569, 1, 1,
0.3786944, 0.8188096, 0.529337, 0, 0.03529412, 1, 1,
0.3790872, -0.4308057, 3.109664, 0, 0.02745098, 1, 1,
0.3804089, 2.221881, 1.003515, 0, 0.02352941, 1, 1,
0.3831642, -0.1076698, 2.18446, 0, 0.01568628, 1, 1,
0.3910057, 0.17525, 1.382139, 0, 0.01176471, 1, 1,
0.3910455, -0.4220446, 2.051762, 0, 0.003921569, 1, 1,
0.3928232, -2.152174, 1.968524, 0.003921569, 0, 1, 1,
0.3929047, -0.7272858, 3.306625, 0.007843138, 0, 1, 1,
0.3942791, 1.063308, 1.210002, 0.01568628, 0, 1, 1,
0.3948949, -2.131212, 3.299328, 0.01960784, 0, 1, 1,
0.3989702, -0.7267602, 3.230868, 0.02745098, 0, 1, 1,
0.4005628, -0.3689956, 1.96279, 0.03137255, 0, 1, 1,
0.4051876, -0.6514693, 0.968918, 0.03921569, 0, 1, 1,
0.413942, 1.438071, 0.6996096, 0.04313726, 0, 1, 1,
0.417629, 0.3738517, 0.8610399, 0.05098039, 0, 1, 1,
0.4272735, 0.6194122, 0.9372591, 0.05490196, 0, 1, 1,
0.428195, 1.002471, -0.1189047, 0.0627451, 0, 1, 1,
0.4285705, -0.5235225, 2.39335, 0.06666667, 0, 1, 1,
0.4306821, -0.1954986, 3.47857, 0.07450981, 0, 1, 1,
0.4343009, -0.4861957, 3.29725, 0.07843138, 0, 1, 1,
0.4343589, 1.496604, 0.3256251, 0.08627451, 0, 1, 1,
0.442174, 0.1478269, 1.755221, 0.09019608, 0, 1, 1,
0.4466156, 1.474421, 0.3402121, 0.09803922, 0, 1, 1,
0.4478596, -0.2055095, 1.492457, 0.1058824, 0, 1, 1,
0.4508826, -0.3642389, 0.4364564, 0.1098039, 0, 1, 1,
0.4514647, -0.7308254, 3.941548, 0.1176471, 0, 1, 1,
0.4518723, -0.05210775, 1.071329, 0.1215686, 0, 1, 1,
0.4537402, 1.089353, -0.4460461, 0.1294118, 0, 1, 1,
0.4631937, 1.676712, 0.6047537, 0.1333333, 0, 1, 1,
0.4634852, 0.9314582, 0.1401779, 0.1411765, 0, 1, 1,
0.4746136, 0.3647552, 1.743122, 0.145098, 0, 1, 1,
0.475726, -0.3240015, 1.425892, 0.1529412, 0, 1, 1,
0.4764591, -0.08373937, 1.949011, 0.1568628, 0, 1, 1,
0.4800515, 0.2545699, 0.7599244, 0.1647059, 0, 1, 1,
0.4862193, 0.125774, 2.423464, 0.1686275, 0, 1, 1,
0.4879287, -0.8437304, 3.424295, 0.1764706, 0, 1, 1,
0.4879371, -1.056215, 2.133474, 0.1803922, 0, 1, 1,
0.4917103, 0.06779917, 3.317123, 0.1882353, 0, 1, 1,
0.4917171, -0.09411095, 2.91962, 0.1921569, 0, 1, 1,
0.4962456, -0.8612687, 2.311783, 0.2, 0, 1, 1,
0.496877, 0.5166106, 1.1503, 0.2078431, 0, 1, 1,
0.4978368, -0.1404768, 3.019041, 0.2117647, 0, 1, 1,
0.4980365, 2.830093, 0.3506755, 0.2196078, 0, 1, 1,
0.4990489, 0.03601743, 1.517226, 0.2235294, 0, 1, 1,
0.503568, 0.5335602, 2.240115, 0.2313726, 0, 1, 1,
0.5037764, -1.342818, 1.954571, 0.2352941, 0, 1, 1,
0.5071357, -1.141448, 3.301824, 0.2431373, 0, 1, 1,
0.515822, 0.5869492, 0.2196244, 0.2470588, 0, 1, 1,
0.5232978, -1.107747, 3.308514, 0.254902, 0, 1, 1,
0.524668, 0.4489062, 0.8939099, 0.2588235, 0, 1, 1,
0.5292475, -0.3934478, 2.081545, 0.2666667, 0, 1, 1,
0.5340582, -0.6077237, 1.854061, 0.2705882, 0, 1, 1,
0.5388041, 0.6238168, -0.5808994, 0.2784314, 0, 1, 1,
0.5425242, -2.144317, 2.724896, 0.282353, 0, 1, 1,
0.5426579, 0.5502413, -0.8046144, 0.2901961, 0, 1, 1,
0.5487567, 0.006065593, 0.5136444, 0.2941177, 0, 1, 1,
0.549628, -1.809368, 3.322925, 0.3019608, 0, 1, 1,
0.5566204, -0.9922556, 3.531006, 0.3098039, 0, 1, 1,
0.5596709, 0.9225332, 1.763205, 0.3137255, 0, 1, 1,
0.5598711, -0.7484194, 3.244699, 0.3215686, 0, 1, 1,
0.5626366, -0.9032373, 2.045405, 0.3254902, 0, 1, 1,
0.5650849, -0.03019377, 1.126521, 0.3333333, 0, 1, 1,
0.5693731, 2.026861, -1.293379, 0.3372549, 0, 1, 1,
0.5700608, 0.7150815, 1.401492, 0.345098, 0, 1, 1,
0.5794647, 1.078784, 0.1752894, 0.3490196, 0, 1, 1,
0.5799714, 0.7034451, 2.085235, 0.3568628, 0, 1, 1,
0.580013, -1.208958, 2.507248, 0.3607843, 0, 1, 1,
0.5809489, 0.07378277, 0.8058222, 0.3686275, 0, 1, 1,
0.5852647, 1.141737, 0.4696254, 0.372549, 0, 1, 1,
0.5864865, -0.5808066, 2.276672, 0.3803922, 0, 1, 1,
0.5910723, -1.72617, 2.568236, 0.3843137, 0, 1, 1,
0.5943798, -3.06057, 2.525518, 0.3921569, 0, 1, 1,
0.5955466, -0.6637114, 3.135957, 0.3960784, 0, 1, 1,
0.605928, -0.1646798, 2.01651, 0.4039216, 0, 1, 1,
0.6065502, -0.5291988, 2.202904, 0.4117647, 0, 1, 1,
0.6077276, 0.8158259, 3.188747, 0.4156863, 0, 1, 1,
0.6112852, 0.5267869, 1.57309, 0.4235294, 0, 1, 1,
0.6138306, -0.3907331, 3.565627, 0.427451, 0, 1, 1,
0.6139039, 2.257575, 1.205006, 0.4352941, 0, 1, 1,
0.622052, 0.1174488, 1.281067, 0.4392157, 0, 1, 1,
0.6220948, -2.324006, 3.880453, 0.4470588, 0, 1, 1,
0.6225224, 0.1665313, 1.33855, 0.4509804, 0, 1, 1,
0.6239222, -1.410331, 2.169244, 0.4588235, 0, 1, 1,
0.629064, -0.1531019, 1.302137, 0.4627451, 0, 1, 1,
0.6371781, -1.595422, 1.982499, 0.4705882, 0, 1, 1,
0.6440267, -1.294898, 1.984723, 0.4745098, 0, 1, 1,
0.6496106, 0.8496162, -0.2253326, 0.4823529, 0, 1, 1,
0.6537843, 0.7691012, 2.045371, 0.4862745, 0, 1, 1,
0.6551597, 0.9108411, -0.6723379, 0.4941176, 0, 1, 1,
0.6632538, -0.5799981, 1.487176, 0.5019608, 0, 1, 1,
0.665738, 0.2702971, 2.717787, 0.5058824, 0, 1, 1,
0.666449, -1.021774, 3.074954, 0.5137255, 0, 1, 1,
0.6665314, 0.2747388, 1.624187, 0.5176471, 0, 1, 1,
0.6767316, -1.30845, 3.58467, 0.5254902, 0, 1, 1,
0.6785752, 2.078412, 0.6093936, 0.5294118, 0, 1, 1,
0.6821958, 0.5014836, -1.953849, 0.5372549, 0, 1, 1,
0.684773, 2.295134, 0.3308522, 0.5411765, 0, 1, 1,
0.6864158, 0.3245023, 0.8517709, 0.5490196, 0, 1, 1,
0.6864499, 0.7245621, 2.10904, 0.5529412, 0, 1, 1,
0.6866115, -1.671406, 2.915765, 0.5607843, 0, 1, 1,
0.6873865, -0.2389321, 1.383432, 0.5647059, 0, 1, 1,
0.6875411, 1.978768, 0.0165077, 0.572549, 0, 1, 1,
0.6883009, 0.325286, 2.362102, 0.5764706, 0, 1, 1,
0.6899835, -0.2228506, 0.8348523, 0.5843138, 0, 1, 1,
0.6901121, 0.06801955, 1.977803, 0.5882353, 0, 1, 1,
0.6910291, -0.05823587, 0.508105, 0.5960785, 0, 1, 1,
0.6948532, 0.02884299, 1.03692, 0.6039216, 0, 1, 1,
0.6956424, 0.1998287, -0.0008618767, 0.6078432, 0, 1, 1,
0.6956484, 1.928014, 0.6605856, 0.6156863, 0, 1, 1,
0.6996816, -1.037057, 0.515322, 0.6196079, 0, 1, 1,
0.7211347, 1.667666, 1.359614, 0.627451, 0, 1, 1,
0.7227759, 0.005595558, 1.814012, 0.6313726, 0, 1, 1,
0.7240916, -1.525229, 2.428978, 0.6392157, 0, 1, 1,
0.7246931, 0.762392, 0.1859545, 0.6431373, 0, 1, 1,
0.7356519, 0.048435, 1.016187, 0.6509804, 0, 1, 1,
0.7361553, -0.3442757, 1.713887, 0.654902, 0, 1, 1,
0.7431182, -0.1646509, 0.5037683, 0.6627451, 0, 1, 1,
0.7437317, 0.5773385, 0.02186576, 0.6666667, 0, 1, 1,
0.7437947, 1.084354, 1.787362, 0.6745098, 0, 1, 1,
0.7476783, 0.09576854, 1.752189, 0.6784314, 0, 1, 1,
0.7479573, 1.591173, 1.762226, 0.6862745, 0, 1, 1,
0.7501464, -0.6533443, 1.541737, 0.6901961, 0, 1, 1,
0.7529165, 0.9348863, 0.693735, 0.6980392, 0, 1, 1,
0.7564585, -0.9665602, 3.246604, 0.7058824, 0, 1, 1,
0.7601056, -1.053396, 3.234411, 0.7098039, 0, 1, 1,
0.7619213, 0.3297651, 0.9938438, 0.7176471, 0, 1, 1,
0.7645899, 0.4633409, 1.419699, 0.7215686, 0, 1, 1,
0.7700883, 0.8267708, 2.556768, 0.7294118, 0, 1, 1,
0.7727115, -0.3130212, 1.485703, 0.7333333, 0, 1, 1,
0.7773148, 0.975345, 0.7982394, 0.7411765, 0, 1, 1,
0.7793432, -1.87034, 2.525967, 0.7450981, 0, 1, 1,
0.7812712, -0.384015, 2.433641, 0.7529412, 0, 1, 1,
0.7834144, -0.3987779, 3.223939, 0.7568628, 0, 1, 1,
0.7855762, 0.01421823, 1.507197, 0.7647059, 0, 1, 1,
0.7961925, 0.7914125, -0.6746345, 0.7686275, 0, 1, 1,
0.8074437, 2.053144, 0.1098598, 0.7764706, 0, 1, 1,
0.8110027, -0.4174336, 1.151133, 0.7803922, 0, 1, 1,
0.8116801, 0.3184511, 0.6142575, 0.7882353, 0, 1, 1,
0.8141148, -1.20241, 2.939517, 0.7921569, 0, 1, 1,
0.8156557, 0.7013046, 1.463626, 0.8, 0, 1, 1,
0.8224527, 0.08199487, 2.624285, 0.8078431, 0, 1, 1,
0.8233035, -0.8910883, 1.789809, 0.8117647, 0, 1, 1,
0.8241794, 0.5011133, 1.608642, 0.8196079, 0, 1, 1,
0.8277941, -1.595592, 3.233192, 0.8235294, 0, 1, 1,
0.8285685, 0.1893586, 2.36922, 0.8313726, 0, 1, 1,
0.8305387, 0.06809828, 2.999525, 0.8352941, 0, 1, 1,
0.831344, -0.8948342, 3.733527, 0.8431373, 0, 1, 1,
0.8316632, 1.026171, 1.39812, 0.8470588, 0, 1, 1,
0.8333992, -0.6434354, 2.91328, 0.854902, 0, 1, 1,
0.8335468, -0.8988196, 3.088223, 0.8588235, 0, 1, 1,
0.8356541, -1.707025, 2.033924, 0.8666667, 0, 1, 1,
0.8370686, -0.3564731, 2.195385, 0.8705882, 0, 1, 1,
0.8378632, 1.535778, 0.2317636, 0.8784314, 0, 1, 1,
0.8452713, -1.081271, 3.462759, 0.8823529, 0, 1, 1,
0.8456619, -0.001871479, 1.063293, 0.8901961, 0, 1, 1,
0.8523244, 1.425631, 0.3200285, 0.8941177, 0, 1, 1,
0.8529822, 1.256361, -1.035958, 0.9019608, 0, 1, 1,
0.8707034, 0.4074364, 0.7300175, 0.9098039, 0, 1, 1,
0.8714024, -0.5453888, 1.261623, 0.9137255, 0, 1, 1,
0.8771826, 0.05756268, 0.02570491, 0.9215686, 0, 1, 1,
0.8800152, -0.3161586, 1.820696, 0.9254902, 0, 1, 1,
0.881176, -0.3097287, 2.651959, 0.9333333, 0, 1, 1,
0.8819689, 0.6142449, 1.568518, 0.9372549, 0, 1, 1,
0.8852816, 0.7938668, 1.088611, 0.945098, 0, 1, 1,
0.8852896, -0.2947392, 1.022721, 0.9490196, 0, 1, 1,
0.8933907, -0.2571234, 2.776435, 0.9568627, 0, 1, 1,
0.8936195, 0.656717, 1.430425, 0.9607843, 0, 1, 1,
0.8951571, 1.684619, -0.4993548, 0.9686275, 0, 1, 1,
0.8960828, 2.256774, 1.615476, 0.972549, 0, 1, 1,
0.9016953, 0.7182389, 2.765332, 0.9803922, 0, 1, 1,
0.9048674, 0.6581072, 1.377586, 0.9843137, 0, 1, 1,
0.9052644, -0.0006985826, 1.532517, 0.9921569, 0, 1, 1,
0.9163615, -0.4664614, 3.774305, 0.9960784, 0, 1, 1,
0.9191822, -0.1872052, 1.630732, 1, 0, 0.9960784, 1,
0.9208029, -0.2761669, 1.077471, 1, 0, 0.9882353, 1,
0.9228638, 0.9686345, 0.537769, 1, 0, 0.9843137, 1,
0.9260407, 0.7519529, -0.1219521, 1, 0, 0.9764706, 1,
0.935418, 1.279992, 0.1193077, 1, 0, 0.972549, 1,
0.9369441, -0.5295905, 2.415496, 1, 0, 0.9647059, 1,
0.9397233, -0.1477928, 2.112266, 1, 0, 0.9607843, 1,
0.946345, 0.4791246, 0.9358612, 1, 0, 0.9529412, 1,
0.9479852, -0.3066324, 0.3163942, 1, 0, 0.9490196, 1,
0.9525756, -0.07244635, -0.02633864, 1, 0, 0.9411765, 1,
0.958447, -0.9091983, 4.071799, 1, 0, 0.9372549, 1,
0.960339, 0.7596176, 1.336569, 1, 0, 0.9294118, 1,
0.961817, 0.5545555, 0.04429433, 1, 0, 0.9254902, 1,
0.9735544, -0.2003866, 1.33085, 1, 0, 0.9176471, 1,
0.9755296, -0.5032741, 1.146892, 1, 0, 0.9137255, 1,
0.9848064, 0.8614376, 0.2382201, 1, 0, 0.9058824, 1,
0.9920452, 1.032887, -0.1455116, 1, 0, 0.9019608, 1,
0.9975879, -1.177555, 1.953167, 1, 0, 0.8941177, 1,
1.003945, 0.9469764, 0.9579215, 1, 0, 0.8862745, 1,
1.00443, 0.9113014, -0.2586947, 1, 0, 0.8823529, 1,
1.005305, 1.814929, 1.866443, 1, 0, 0.8745098, 1,
1.012146, -0.4112792, 2.233013, 1, 0, 0.8705882, 1,
1.012272, -0.1505009, 2.648927, 1, 0, 0.8627451, 1,
1.016572, -0.4619336, 0.4622107, 1, 0, 0.8588235, 1,
1.017843, -0.2579504, 1.744392, 1, 0, 0.8509804, 1,
1.019648, -0.5307362, 3.610937, 1, 0, 0.8470588, 1,
1.025537, 1.325415, 1.442774, 1, 0, 0.8392157, 1,
1.031459, 0.1816448, 1.501867, 1, 0, 0.8352941, 1,
1.03678, 0.08972887, 2.157631, 1, 0, 0.827451, 1,
1.04139, -0.2822528, 1.907136, 1, 0, 0.8235294, 1,
1.051329, -0.420357, 1.85979, 1, 0, 0.8156863, 1,
1.051345, 0.6673026, 2.989217, 1, 0, 0.8117647, 1,
1.05508, 0.2185778, 1.447868, 1, 0, 0.8039216, 1,
1.060303, 2.079298, 1.195361, 1, 0, 0.7960784, 1,
1.064005, 1.438417, 1.519133, 1, 0, 0.7921569, 1,
1.076003, 0.1127068, 0.7293185, 1, 0, 0.7843137, 1,
1.077096, 0.1881428, 0.2981309, 1, 0, 0.7803922, 1,
1.078801, 2.848864, 1.199049, 1, 0, 0.772549, 1,
1.08327, 1.083762, 1.198804, 1, 0, 0.7686275, 1,
1.09205, -0.5062202, 2.909267, 1, 0, 0.7607843, 1,
1.094478, 1.003362, 1.072283, 1, 0, 0.7568628, 1,
1.098051, -1.03831, 2.141556, 1, 0, 0.7490196, 1,
1.103816, 0.8776411, -0.6090059, 1, 0, 0.7450981, 1,
1.11076, 1.641214, 1.480072, 1, 0, 0.7372549, 1,
1.111251, 0.5639408, 0.995193, 1, 0, 0.7333333, 1,
1.11587, -0.5508609, 2.520915, 1, 0, 0.7254902, 1,
1.11703, 1.272446, 1.526238, 1, 0, 0.7215686, 1,
1.121624, -0.825529, 1.973727, 1, 0, 0.7137255, 1,
1.128303, -0.4222258, 1.537092, 1, 0, 0.7098039, 1,
1.135328, 0.5724168, 0.4302789, 1, 0, 0.7019608, 1,
1.151472, 0.4614224, -0.9069149, 1, 0, 0.6941177, 1,
1.156243, -0.144826, 1.633591, 1, 0, 0.6901961, 1,
1.158272, 1.197034, 0.2702124, 1, 0, 0.682353, 1,
1.160165, 0.7983974, 1.33319, 1, 0, 0.6784314, 1,
1.167735, -1.599586, 3.229576, 1, 0, 0.6705883, 1,
1.171957, 0.01280586, 1.495511, 1, 0, 0.6666667, 1,
1.180367, 0.9333336, 1.070901, 1, 0, 0.6588235, 1,
1.185538, -0.255766, 3.655474, 1, 0, 0.654902, 1,
1.186144, 0.3566356, 1.738196, 1, 0, 0.6470588, 1,
1.202409, 0.7049096, 1.808939, 1, 0, 0.6431373, 1,
1.206668, 0.9654646, -0.4813061, 1, 0, 0.6352941, 1,
1.211282, -0.9652305, 0.9038268, 1, 0, 0.6313726, 1,
1.211667, 0.7307456, 0.2393509, 1, 0, 0.6235294, 1,
1.212821, -0.5744228, 1.199033, 1, 0, 0.6196079, 1,
1.214816, -0.2279004, 0.1007857, 1, 0, 0.6117647, 1,
1.219625, 0.4171756, 1.465808, 1, 0, 0.6078432, 1,
1.231195, 0.9901277, 0.8416963, 1, 0, 0.6, 1,
1.249412, -0.8165704, 1.624462, 1, 0, 0.5921569, 1,
1.249653, -1.54355, 0.4998005, 1, 0, 0.5882353, 1,
1.250808, -0.6589042, 2.492841, 1, 0, 0.5803922, 1,
1.258249, 0.2201655, 0.6358017, 1, 0, 0.5764706, 1,
1.262135, 0.2986707, 1.471492, 1, 0, 0.5686275, 1,
1.275185, -0.4567986, 2.406079, 1, 0, 0.5647059, 1,
1.280311, -1.61535, 2.562828, 1, 0, 0.5568628, 1,
1.283135, -1.624133, 1.51826, 1, 0, 0.5529412, 1,
1.28369, -0.6765511, 3.395808, 1, 0, 0.5450981, 1,
1.291572, 0.6697158, 1.865412, 1, 0, 0.5411765, 1,
1.294079, 0.7246277, 2.11059, 1, 0, 0.5333334, 1,
1.294778, -0.6950359, 1.787218, 1, 0, 0.5294118, 1,
1.295458, 0.1929097, 1.013217, 1, 0, 0.5215687, 1,
1.299013, -0.1896744, 0.7718948, 1, 0, 0.5176471, 1,
1.307124, 2.723315, 0.7691877, 1, 0, 0.509804, 1,
1.325691, 0.5416339, 0.8597295, 1, 0, 0.5058824, 1,
1.330022, -0.6177028, 2.157511, 1, 0, 0.4980392, 1,
1.332468, -1.111833, 1.776896, 1, 0, 0.4901961, 1,
1.334612, -0.0385298, 0.6234376, 1, 0, 0.4862745, 1,
1.34042, -0.02627424, -0.03554662, 1, 0, 0.4784314, 1,
1.344944, 1.614292, 0.1645613, 1, 0, 0.4745098, 1,
1.346737, 0.4734299, 0.5927109, 1, 0, 0.4666667, 1,
1.35355, 0.5547791, 0.8779413, 1, 0, 0.4627451, 1,
1.367942, 1.676038, 0.5553951, 1, 0, 0.454902, 1,
1.372107, 1.755825, -1.146109, 1, 0, 0.4509804, 1,
1.374975, -0.02704719, 1.529483, 1, 0, 0.4431373, 1,
1.379004, -0.1680358, 1.707768, 1, 0, 0.4392157, 1,
1.382234, 0.2252166, 1.141354, 1, 0, 0.4313726, 1,
1.389978, 0.656132, 0.5541328, 1, 0, 0.427451, 1,
1.400461, -2.643139, 2.640207, 1, 0, 0.4196078, 1,
1.406814, -1.58557, 2.940687, 1, 0, 0.4156863, 1,
1.408848, 0.440766, 0.8372511, 1, 0, 0.4078431, 1,
1.41311, -0.5999671, 1.042247, 1, 0, 0.4039216, 1,
1.43821, 0.2481799, 1.485936, 1, 0, 0.3960784, 1,
1.507324, -0.1262653, 1.538719, 1, 0, 0.3882353, 1,
1.5136, -0.5234776, 1.743414, 1, 0, 0.3843137, 1,
1.515353, -0.9682692, 1.3425, 1, 0, 0.3764706, 1,
1.51886, 0.2423213, 1.579104, 1, 0, 0.372549, 1,
1.530575, 0.8556257, 2.395475, 1, 0, 0.3647059, 1,
1.532969, -0.9890209, 1.893529, 1, 0, 0.3607843, 1,
1.544976, -0.7994162, 3.268674, 1, 0, 0.3529412, 1,
1.568385, -0.2265003, 2.152163, 1, 0, 0.3490196, 1,
1.575772, 0.2671211, 0.35158, 1, 0, 0.3411765, 1,
1.577431, -0.3404349, 4.185516, 1, 0, 0.3372549, 1,
1.578723, -0.171688, 1.184022, 1, 0, 0.3294118, 1,
1.583592, -0.07413962, 1.104702, 1, 0, 0.3254902, 1,
1.586102, -1.019898, 3.941355, 1, 0, 0.3176471, 1,
1.612078, -1.142795, 1.224085, 1, 0, 0.3137255, 1,
1.613405, -0.8897048, 1.001182, 1, 0, 0.3058824, 1,
1.619896, -0.3403742, 2.280581, 1, 0, 0.2980392, 1,
1.627562, -0.5973973, 2.414463, 1, 0, 0.2941177, 1,
1.630161, 0.8377009, 1.112524, 1, 0, 0.2862745, 1,
1.633724, -0.1015701, 0.5740704, 1, 0, 0.282353, 1,
1.646906, 0.8656766, 1.674202, 1, 0, 0.2745098, 1,
1.64766, -1.389563, 2.709865, 1, 0, 0.2705882, 1,
1.66798, 0.7267016, 0.3414945, 1, 0, 0.2627451, 1,
1.678187, 1.469169, 1.504291, 1, 0, 0.2588235, 1,
1.679066, 0.03749288, 4.049615, 1, 0, 0.2509804, 1,
1.684919, 0.9834253, 0.9691837, 1, 0, 0.2470588, 1,
1.685649, 0.2204001, 0.9004858, 1, 0, 0.2392157, 1,
1.709602, 1.740561, 0.626952, 1, 0, 0.2352941, 1,
1.722728, 0.9946588, 2.017661, 1, 0, 0.227451, 1,
1.735188, -0.270658, 0.9472955, 1, 0, 0.2235294, 1,
1.735839, 0.09858753, 2.377276, 1, 0, 0.2156863, 1,
1.751287, -1.124435, 3.295807, 1, 0, 0.2117647, 1,
1.756922, -0.08683706, 1.0143, 1, 0, 0.2039216, 1,
1.758279, -0.2960028, 3.164113, 1, 0, 0.1960784, 1,
1.783163, -1.644832, 2.68799, 1, 0, 0.1921569, 1,
1.791981, -1.717915, 3.885712, 1, 0, 0.1843137, 1,
1.820199, 0.08222278, 2.336784, 1, 0, 0.1803922, 1,
1.833813, -0.8015189, 3.239922, 1, 0, 0.172549, 1,
1.859106, 0.8577799, 0.4986334, 1, 0, 0.1686275, 1,
1.877709, -0.4874735, 1.135953, 1, 0, 0.1607843, 1,
1.893731, -1.024994, 2.5168, 1, 0, 0.1568628, 1,
1.898778, -0.401178, 2.243422, 1, 0, 0.1490196, 1,
1.910115, -0.4100932, 1.324058, 1, 0, 0.145098, 1,
1.918176, -2.100415, 3.042392, 1, 0, 0.1372549, 1,
1.942696, -1.473105, 3.708921, 1, 0, 0.1333333, 1,
1.94911, -0.5649378, 1.359267, 1, 0, 0.1254902, 1,
1.956529, -0.9355018, 2.570166, 1, 0, 0.1215686, 1,
1.969007, 0.01861505, 2.769277, 1, 0, 0.1137255, 1,
2.003185, 0.742557, 3.682682, 1, 0, 0.1098039, 1,
2.102209, 0.7995052, 1.708888, 1, 0, 0.1019608, 1,
2.119642, 0.4145816, 0.05738242, 1, 0, 0.09411765, 1,
2.167424, 0.8583288, 2.775853, 1, 0, 0.09019608, 1,
2.192216, -0.4389141, -0.1444429, 1, 0, 0.08235294, 1,
2.212167, -0.5417168, 2.600798, 1, 0, 0.07843138, 1,
2.245218, 1.257921, 1.52721, 1, 0, 0.07058824, 1,
2.269116, 0.5303795, 1.829028, 1, 0, 0.06666667, 1,
2.27843, -1.899704, 0.8171347, 1, 0, 0.05882353, 1,
2.315616, 0.5387178, 1.905967, 1, 0, 0.05490196, 1,
2.359888, 1.203153, 1.438029, 1, 0, 0.04705882, 1,
2.45233, 1.357373, 1.721011, 1, 0, 0.04313726, 1,
2.572289, 0.4477057, 0.7616442, 1, 0, 0.03529412, 1,
2.872322, 1.221636, 1.76011, 1, 0, 0.03137255, 1,
2.89527, -1.326634, 2.198203, 1, 0, 0.02352941, 1,
2.977214, 2.526998, 3.087486, 1, 0, 0.01960784, 1,
3.089736, 0.5017526, 1.63617, 1, 0, 0.01176471, 1,
3.387292, -0.3948118, 1.56976, 1, 0, 0.007843138, 1
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
-0.272613, -4.135582, -6.968164, 0, -0.5, 0.5, 0.5,
-0.272613, -4.135582, -6.968164, 1, -0.5, 0.5, 0.5,
-0.272613, -4.135582, -6.968164, 1, 1.5, 0.5, 0.5,
-0.272613, -4.135582, -6.968164, 0, 1.5, 0.5, 0.5
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
-5.173226, 0.1105568, -6.968164, 0, -0.5, 0.5, 0.5,
-5.173226, 0.1105568, -6.968164, 1, -0.5, 0.5, 0.5,
-5.173226, 0.1105568, -6.968164, 1, 1.5, 0.5, 0.5,
-5.173226, 0.1105568, -6.968164, 0, 1.5, 0.5, 0.5
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
-5.173226, -4.135582, -0.03993225, 0, -0.5, 0.5, 0.5,
-5.173226, -4.135582, -0.03993225, 1, -0.5, 0.5, 0.5,
-5.173226, -4.135582, -0.03993225, 1, 1.5, 0.5, 0.5,
-5.173226, -4.135582, -0.03993225, 0, 1.5, 0.5, 0.5
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
-2, -3.155704, -5.369341,
2, -3.155704, -5.369341,
-2, -3.155704, -5.369341,
-2, -3.319017, -5.635811,
0, -3.155704, -5.369341,
0, -3.319017, -5.635811,
2, -3.155704, -5.369341,
2, -3.319017, -5.635811
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
-2, -3.645643, -6.168753, 0, -0.5, 0.5, 0.5,
-2, -3.645643, -6.168753, 1, -0.5, 0.5, 0.5,
-2, -3.645643, -6.168753, 1, 1.5, 0.5, 0.5,
-2, -3.645643, -6.168753, 0, 1.5, 0.5, 0.5,
0, -3.645643, -6.168753, 0, -0.5, 0.5, 0.5,
0, -3.645643, -6.168753, 1, -0.5, 0.5, 0.5,
0, -3.645643, -6.168753, 1, 1.5, 0.5, 0.5,
0, -3.645643, -6.168753, 0, 1.5, 0.5, 0.5,
2, -3.645643, -6.168753, 0, -0.5, 0.5, 0.5,
2, -3.645643, -6.168753, 1, -0.5, 0.5, 0.5,
2, -3.645643, -6.168753, 1, 1.5, 0.5, 0.5,
2, -3.645643, -6.168753, 0, 1.5, 0.5, 0.5
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
-4.042315, -3, -5.369341,
-4.042315, 3, -5.369341,
-4.042315, -3, -5.369341,
-4.230801, -3, -5.635811,
-4.042315, -2, -5.369341,
-4.230801, -2, -5.635811,
-4.042315, -1, -5.369341,
-4.230801, -1, -5.635811,
-4.042315, 0, -5.369341,
-4.230801, 0, -5.635811,
-4.042315, 1, -5.369341,
-4.230801, 1, -5.635811,
-4.042315, 2, -5.369341,
-4.230801, 2, -5.635811,
-4.042315, 3, -5.369341,
-4.230801, 3, -5.635811
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
-4.607771, -3, -6.168753, 0, -0.5, 0.5, 0.5,
-4.607771, -3, -6.168753, 1, -0.5, 0.5, 0.5,
-4.607771, -3, -6.168753, 1, 1.5, 0.5, 0.5,
-4.607771, -3, -6.168753, 0, 1.5, 0.5, 0.5,
-4.607771, -2, -6.168753, 0, -0.5, 0.5, 0.5,
-4.607771, -2, -6.168753, 1, -0.5, 0.5, 0.5,
-4.607771, -2, -6.168753, 1, 1.5, 0.5, 0.5,
-4.607771, -2, -6.168753, 0, 1.5, 0.5, 0.5,
-4.607771, -1, -6.168753, 0, -0.5, 0.5, 0.5,
-4.607771, -1, -6.168753, 1, -0.5, 0.5, 0.5,
-4.607771, -1, -6.168753, 1, 1.5, 0.5, 0.5,
-4.607771, -1, -6.168753, 0, 1.5, 0.5, 0.5,
-4.607771, 0, -6.168753, 0, -0.5, 0.5, 0.5,
-4.607771, 0, -6.168753, 1, -0.5, 0.5, 0.5,
-4.607771, 0, -6.168753, 1, 1.5, 0.5, 0.5,
-4.607771, 0, -6.168753, 0, 1.5, 0.5, 0.5,
-4.607771, 1, -6.168753, 0, -0.5, 0.5, 0.5,
-4.607771, 1, -6.168753, 1, -0.5, 0.5, 0.5,
-4.607771, 1, -6.168753, 1, 1.5, 0.5, 0.5,
-4.607771, 1, -6.168753, 0, 1.5, 0.5, 0.5,
-4.607771, 2, -6.168753, 0, -0.5, 0.5, 0.5,
-4.607771, 2, -6.168753, 1, -0.5, 0.5, 0.5,
-4.607771, 2, -6.168753, 1, 1.5, 0.5, 0.5,
-4.607771, 2, -6.168753, 0, 1.5, 0.5, 0.5,
-4.607771, 3, -6.168753, 0, -0.5, 0.5, 0.5,
-4.607771, 3, -6.168753, 1, -0.5, 0.5, 0.5,
-4.607771, 3, -6.168753, 1, 1.5, 0.5, 0.5,
-4.607771, 3, -6.168753, 0, 1.5, 0.5, 0.5
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
-4.042315, -3.155704, -4,
-4.042315, -3.155704, 4,
-4.042315, -3.155704, -4,
-4.230801, -3.319017, -4,
-4.042315, -3.155704, -2,
-4.230801, -3.319017, -2,
-4.042315, -3.155704, 0,
-4.230801, -3.319017, 0,
-4.042315, -3.155704, 2,
-4.230801, -3.319017, 2,
-4.042315, -3.155704, 4,
-4.230801, -3.319017, 4
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
-4.607771, -3.645643, -4, 0, -0.5, 0.5, 0.5,
-4.607771, -3.645643, -4, 1, -0.5, 0.5, 0.5,
-4.607771, -3.645643, -4, 1, 1.5, 0.5, 0.5,
-4.607771, -3.645643, -4, 0, 1.5, 0.5, 0.5,
-4.607771, -3.645643, -2, 0, -0.5, 0.5, 0.5,
-4.607771, -3.645643, -2, 1, -0.5, 0.5, 0.5,
-4.607771, -3.645643, -2, 1, 1.5, 0.5, 0.5,
-4.607771, -3.645643, -2, 0, 1.5, 0.5, 0.5,
-4.607771, -3.645643, 0, 0, -0.5, 0.5, 0.5,
-4.607771, -3.645643, 0, 1, -0.5, 0.5, 0.5,
-4.607771, -3.645643, 0, 1, 1.5, 0.5, 0.5,
-4.607771, -3.645643, 0, 0, 1.5, 0.5, 0.5,
-4.607771, -3.645643, 2, 0, -0.5, 0.5, 0.5,
-4.607771, -3.645643, 2, 1, -0.5, 0.5, 0.5,
-4.607771, -3.645643, 2, 1, 1.5, 0.5, 0.5,
-4.607771, -3.645643, 2, 0, 1.5, 0.5, 0.5,
-4.607771, -3.645643, 4, 0, -0.5, 0.5, 0.5,
-4.607771, -3.645643, 4, 1, -0.5, 0.5, 0.5,
-4.607771, -3.645643, 4, 1, 1.5, 0.5, 0.5,
-4.607771, -3.645643, 4, 0, 1.5, 0.5, 0.5
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
-4.042315, -3.155704, -5.369341,
-4.042315, 3.376818, -5.369341,
-4.042315, -3.155704, 5.289476,
-4.042315, 3.376818, 5.289476,
-4.042315, -3.155704, -5.369341,
-4.042315, -3.155704, 5.289476,
-4.042315, 3.376818, -5.369341,
-4.042315, 3.376818, 5.289476,
-4.042315, -3.155704, -5.369341,
3.49709, -3.155704, -5.369341,
-4.042315, -3.155704, 5.289476,
3.49709, -3.155704, 5.289476,
-4.042315, 3.376818, -5.369341,
3.49709, 3.376818, -5.369341,
-4.042315, 3.376818, 5.289476,
3.49709, 3.376818, 5.289476,
3.49709, -3.155704, -5.369341,
3.49709, 3.376818, -5.369341,
3.49709, -3.155704, 5.289476,
3.49709, 3.376818, 5.289476,
3.49709, -3.155704, -5.369341,
3.49709, -3.155704, 5.289476,
3.49709, 3.376818, -5.369341,
3.49709, 3.376818, 5.289476
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
var radius = 7.795511;
var distance = 34.68311;
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
mvMatrix.translate( 0.272613, -0.1105568, 0.03993225 );
mvMatrix.scale( 1.117947, 1.290261, 0.7907686 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.68311);
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
triflusulfuron-methy<-read.table("triflusulfuron-methy.xyz")
```

```
## Error in read.table("triflusulfuron-methy.xyz"): no lines available in input
```

```r
x<-triflusulfuron-methy$V2
```

```
## Error in eval(expr, envir, enclos): object 'triflusulfuron' not found
```

```r
y<-triflusulfuron-methy$V3
```

```
## Error in eval(expr, envir, enclos): object 'triflusulfuron' not found
```

```r
z<-triflusulfuron-methy$V4
```

```
## Error in eval(expr, envir, enclos): object 'triflusulfuron' not found
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
-3.932518, 0.02481891, -1.464687, 0, 0, 1, 1, 1,
-3.589128, 1.52651, -0.4445915, 1, 0, 0, 1, 1,
-3.303378, -1.926458, -1.581708, 1, 0, 0, 1, 1,
-3.245629, -0.3373206, -1.171017, 1, 0, 0, 1, 1,
-3.018117, 0.1440513, -0.5770313, 1, 0, 0, 1, 1,
-2.840284, 0.6299443, -2.38659, 1, 0, 0, 1, 1,
-2.808115, -0.9979679, -2.988225, 0, 0, 0, 1, 1,
-2.718552, 0.6229553, -1.215369, 0, 0, 0, 1, 1,
-2.491976, 0.8100524, -1.332165, 0, 0, 0, 1, 1,
-2.337201, 0.3882564, -1.145916, 0, 0, 0, 1, 1,
-2.327449, 2.320903, -0.1090301, 0, 0, 0, 1, 1,
-2.304909, 0.1865902, -1.364216, 0, 0, 0, 1, 1,
-2.284994, 0.01075064, 0.1627384, 0, 0, 0, 1, 1,
-2.244024, 1.62732, -1.659654, 1, 1, 1, 1, 1,
-2.238486, 0.9904677, -1.675039, 1, 1, 1, 1, 1,
-2.188977, -0.5860211, -0.993131, 1, 1, 1, 1, 1,
-2.14982, 0.003055951, -2.290444, 1, 1, 1, 1, 1,
-2.048366, -0.4539211, -2.877754, 1, 1, 1, 1, 1,
-2.047145, 1.41767, 0.5579495, 1, 1, 1, 1, 1,
-2.013086, 1.542576, -2.671194, 1, 1, 1, 1, 1,
-2.013079, -0.2400388, -2.403238, 1, 1, 1, 1, 1,
-1.971596, 0.9690749, 0.02939089, 1, 1, 1, 1, 1,
-1.954603, 0.5879908, -0.9189778, 1, 1, 1, 1, 1,
-1.95037, -0.7459741, -0.462917, 1, 1, 1, 1, 1,
-1.945081, -1.009376, -1.912885, 1, 1, 1, 1, 1,
-1.945, 0.9719977, -2.321759, 1, 1, 1, 1, 1,
-1.9294, -0.2808677, -3.354374, 1, 1, 1, 1, 1,
-1.916214, -1.554307, -3.06059, 1, 1, 1, 1, 1,
-1.906544, 2.070695, 0.9321079, 0, 0, 1, 1, 1,
-1.900676, 1.775606, 0.7257228, 1, 0, 0, 1, 1,
-1.896222, 0.3435172, -0.2416213, 1, 0, 0, 1, 1,
-1.895693, 0.4910391, -1.057023, 1, 0, 0, 1, 1,
-1.859146, -1.019549, -2.282883, 1, 0, 0, 1, 1,
-1.855561, -0.9741989, -1.107748, 1, 0, 0, 1, 1,
-1.770991, 0.06831539, -2.139209, 0, 0, 0, 1, 1,
-1.765766, 0.1958663, -1.595579, 0, 0, 0, 1, 1,
-1.748698, -0.2286975, -2.60485, 0, 0, 0, 1, 1,
-1.747765, -1.394741, -1.186201, 0, 0, 0, 1, 1,
-1.738225, -0.3395054, -0.4142572, 0, 0, 0, 1, 1,
-1.723006, 0.5194371, 0.02334696, 0, 0, 0, 1, 1,
-1.710089, -0.2153839, -1.933041, 0, 0, 0, 1, 1,
-1.709108, 0.3764099, -1.776485, 1, 1, 1, 1, 1,
-1.704902, -0.9877625, -1.309452, 1, 1, 1, 1, 1,
-1.690333, 0.3306231, -3.105014, 1, 1, 1, 1, 1,
-1.688327, -0.6709706, -1.165987, 1, 1, 1, 1, 1,
-1.687719, -1.172088, -3.652829, 1, 1, 1, 1, 1,
-1.674692, -0.02790291, -1.468994, 1, 1, 1, 1, 1,
-1.648247, 0.4029268, 0.6673409, 1, 1, 1, 1, 1,
-1.643128, 0.4411602, -1.22216, 1, 1, 1, 1, 1,
-1.641259, 1.414023, -0.455117, 1, 1, 1, 1, 1,
-1.636627, 1.396385, 0.6575622, 1, 1, 1, 1, 1,
-1.630026, 0.3517015, -2.223647, 1, 1, 1, 1, 1,
-1.627772, -0.7825956, -3.467263, 1, 1, 1, 1, 1,
-1.626455, 0.6249076, -1.109948, 1, 1, 1, 1, 1,
-1.614481, 0.6444271, -0.6811326, 1, 1, 1, 1, 1,
-1.613861, 1.457696, -0.1265956, 1, 1, 1, 1, 1,
-1.606599, 1.062662, -2.130816, 0, 0, 1, 1, 1,
-1.59322, -0.6144723, -2.816332, 1, 0, 0, 1, 1,
-1.571453, -1.130352, -2.655591, 1, 0, 0, 1, 1,
-1.562608, -1.238731, -4.130578, 1, 0, 0, 1, 1,
-1.560921, -1.718136, -1.681155, 1, 0, 0, 1, 1,
-1.558814, -0.04480128, -2.059548, 1, 0, 0, 1, 1,
-1.557241, -1.182205, -0.4835801, 0, 0, 0, 1, 1,
-1.548308, 0.2796602, -1.074227, 0, 0, 0, 1, 1,
-1.531638, -0.5627909, -1.289824, 0, 0, 0, 1, 1,
-1.527345, 0.5368598, -1.971167, 0, 0, 0, 1, 1,
-1.525185, -0.8670227, -2.513333, 0, 0, 0, 1, 1,
-1.524864, -0.5670419, -0.9780139, 0, 0, 0, 1, 1,
-1.52209, -1.43437, -3.563821, 0, 0, 0, 1, 1,
-1.512567, -0.5277886, -2.3051, 1, 1, 1, 1, 1,
-1.504157, 1.175008, -0.6851819, 1, 1, 1, 1, 1,
-1.489877, 0.6221001, -1.544898, 1, 1, 1, 1, 1,
-1.463955, 0.07056006, -2.254451, 1, 1, 1, 1, 1,
-1.46288, -0.3589008, -3.429737, 1, 1, 1, 1, 1,
-1.450998, 0.5337779, -0.8982689, 1, 1, 1, 1, 1,
-1.425461, -1.348229, -2.511297, 1, 1, 1, 1, 1,
-1.423573, 0.4532666, -1.958131, 1, 1, 1, 1, 1,
-1.408051, 0.1565485, -1.435898, 1, 1, 1, 1, 1,
-1.405899, 0.1491952, -2.250824, 1, 1, 1, 1, 1,
-1.403033, 1.291754, -0.9490498, 1, 1, 1, 1, 1,
-1.398549, -0.9041247, -1.800747, 1, 1, 1, 1, 1,
-1.392027, 0.3692369, -1.101857, 1, 1, 1, 1, 1,
-1.384729, 0.3666411, -1.091346, 1, 1, 1, 1, 1,
-1.383167, 1.65483, 0.3238033, 1, 1, 1, 1, 1,
-1.377671, 0.6394542, -0.8651311, 0, 0, 1, 1, 1,
-1.375736, 0.5222986, -0.6785073, 1, 0, 0, 1, 1,
-1.374013, -0.8799799, -2.943986, 1, 0, 0, 1, 1,
-1.364159, -1.364551, -2.833498, 1, 0, 0, 1, 1,
-1.363067, 1.853984, -0.3991699, 1, 0, 0, 1, 1,
-1.362678, -0.1032443, -1.754796, 1, 0, 0, 1, 1,
-1.360663, -1.393201, -2.021386, 0, 0, 0, 1, 1,
-1.358245, -0.4996648, -2.14476, 0, 0, 0, 1, 1,
-1.354262, -0.02717815, -1.144891, 0, 0, 0, 1, 1,
-1.354147, 0.6098837, -0.9335474, 0, 0, 0, 1, 1,
-1.334855, -0.6901837, -2.37926, 0, 0, 0, 1, 1,
-1.334571, -0.9730601, -1.610572, 0, 0, 0, 1, 1,
-1.323679, -0.6472273, -1.900506, 0, 0, 0, 1, 1,
-1.319688, 0.9203247, -1.109515, 1, 1, 1, 1, 1,
-1.3196, -1.07483, -2.053032, 1, 1, 1, 1, 1,
-1.318864, 0.2649207, -0.2782831, 1, 1, 1, 1, 1,
-1.315347, -2.13434, -0.8852663, 1, 1, 1, 1, 1,
-1.307592, 1.446789, -1.166266, 1, 1, 1, 1, 1,
-1.306268, -0.1054673, -1.560411, 1, 1, 1, 1, 1,
-1.295687, -1.336422, -2.099329, 1, 1, 1, 1, 1,
-1.286767, -0.02993843, -2.64764, 1, 1, 1, 1, 1,
-1.28496, -0.5163968, -1.328819, 1, 1, 1, 1, 1,
-1.281625, 0.7796077, -1.312761, 1, 1, 1, 1, 1,
-1.272205, -0.1465931, -1.751468, 1, 1, 1, 1, 1,
-1.269025, 0.1752672, -2.391309, 1, 1, 1, 1, 1,
-1.268178, 1.677225, -0.8835468, 1, 1, 1, 1, 1,
-1.264455, 0.4958315, -2.042397, 1, 1, 1, 1, 1,
-1.259734, 0.7632473, -1.219649, 1, 1, 1, 1, 1,
-1.258064, -0.4241463, -4.255701, 0, 0, 1, 1, 1,
-1.256189, -1.038263, -4.326584, 1, 0, 0, 1, 1,
-1.255233, -0.7150713, -1.625015, 1, 0, 0, 1, 1,
-1.247068, 0.2697656, -2.335257, 1, 0, 0, 1, 1,
-1.246811, -0.9061882, -2.628816, 1, 0, 0, 1, 1,
-1.244953, 0.2219641, -0.4329757, 1, 0, 0, 1, 1,
-1.24393, 0.4973898, -0.2336184, 0, 0, 0, 1, 1,
-1.237287, -1.151291, -0.483692, 0, 0, 0, 1, 1,
-1.236902, 0.4407654, -1.044801, 0, 0, 0, 1, 1,
-1.235777, -0.6993486, 1.244008, 0, 0, 0, 1, 1,
-1.224307, 3.281684, -2.187643, 0, 0, 0, 1, 1,
-1.214004, -0.04961927, -1.134655, 0, 0, 0, 1, 1,
-1.21179, -0.8492748, -2.039564, 0, 0, 0, 1, 1,
-1.193116, -0.6144034, -3.641008, 1, 1, 1, 1, 1,
-1.180607, 0.4635993, -2.490936, 1, 1, 1, 1, 1,
-1.180079, 0.6697007, -1.324312, 1, 1, 1, 1, 1,
-1.176593, 0.6806808, -0.1872506, 1, 1, 1, 1, 1,
-1.176405, 0.09318181, -0.1522584, 1, 1, 1, 1, 1,
-1.158987, -0.3414955, -2.727883, 1, 1, 1, 1, 1,
-1.158516, 1.701094, -0.1210827, 1, 1, 1, 1, 1,
-1.158027, 1.561502, -1.025945, 1, 1, 1, 1, 1,
-1.153311, 0.9249966, -1.695285, 1, 1, 1, 1, 1,
-1.151719, 0.08654291, -1.681939, 1, 1, 1, 1, 1,
-1.14526, -0.0005138253, -3.004213, 1, 1, 1, 1, 1,
-1.141143, 2.415712, -0.4839839, 1, 1, 1, 1, 1,
-1.133655, -0.2407484, -0.998395, 1, 1, 1, 1, 1,
-1.132994, 1.110412, -1.056612, 1, 1, 1, 1, 1,
-1.122274, -1.041378, -3.66485, 1, 1, 1, 1, 1,
-1.121012, 1.058642, -1.968811, 0, 0, 1, 1, 1,
-1.115595, -0.3388373, -2.679202, 1, 0, 0, 1, 1,
-1.109339, -0.3225555, -3.227931, 1, 0, 0, 1, 1,
-1.107017, -0.2856452, -2.010756, 1, 0, 0, 1, 1,
-1.100466, -0.4648454, -1.260944, 1, 0, 0, 1, 1,
-1.091506, -1.413965, -1.876136, 1, 0, 0, 1, 1,
-1.08872, -0.5422752, -2.181645, 0, 0, 0, 1, 1,
-1.084502, 0.4052249, -2.347623, 0, 0, 0, 1, 1,
-1.081661, 0.02404339, -0.7468428, 0, 0, 0, 1, 1,
-1.080196, 1.283917, 2.41995, 0, 0, 0, 1, 1,
-1.077581, 0.3608616, -2.113255, 0, 0, 0, 1, 1,
-1.066936, -0.4603349, -2.527581, 0, 0, 0, 1, 1,
-1.06547, -1.118631, -2.094305, 0, 0, 0, 1, 1,
-1.061208, 1.869801, 0.01949541, 1, 1, 1, 1, 1,
-1.054946, 1.493679, -0.9489201, 1, 1, 1, 1, 1,
-1.042077, 0.3511976, -1.433047, 1, 1, 1, 1, 1,
-1.040973, -0.6234354, -0.2850645, 1, 1, 1, 1, 1,
-1.037772, 2.019943, -0.3415649, 1, 1, 1, 1, 1,
-1.037256, -0.982112, -0.6289546, 1, 1, 1, 1, 1,
-1.033407, 0.9492181, -0.7193837, 1, 1, 1, 1, 1,
-1.028156, -0.5067939, -1.989102, 1, 1, 1, 1, 1,
-1.024136, 0.8370417, -2.414665, 1, 1, 1, 1, 1,
-1.022747, -0.5886902, -1.726235, 1, 1, 1, 1, 1,
-1.01725, 0.06645553, -0.06564823, 1, 1, 1, 1, 1,
-1.010839, -0.7450651, -3.740361, 1, 1, 1, 1, 1,
-1.007249, -0.7499507, -1.940279, 1, 1, 1, 1, 1,
-0.9904901, -0.4064146, -4.489206, 1, 1, 1, 1, 1,
-0.9896472, 0.9936255, -0.8661616, 1, 1, 1, 1, 1,
-0.9868993, -0.1250998, -0.8504808, 0, 0, 1, 1, 1,
-0.9817329, 1.988629, 0.6330452, 1, 0, 0, 1, 1,
-0.981586, -0.5347304, -0.5405245, 1, 0, 0, 1, 1,
-0.9787441, -1.933862, -2.151644, 1, 0, 0, 1, 1,
-0.9708294, -1.446087, -3.390711, 1, 0, 0, 1, 1,
-0.9693154, -0.7100582, -4.002412, 1, 0, 0, 1, 1,
-0.9623873, 1.348806, -0.2018661, 0, 0, 0, 1, 1,
-0.9595513, -0.4587557, -3.649473, 0, 0, 0, 1, 1,
-0.9532768, -1.03102, -2.213998, 0, 0, 0, 1, 1,
-0.9404151, -0.3132194, -1.704383, 0, 0, 0, 1, 1,
-0.936729, -0.8467771, -5.214116, 0, 0, 0, 1, 1,
-0.9364787, -0.8738025, -2.278927, 0, 0, 0, 1, 1,
-0.9354284, 1.316371, -0.5718123, 0, 0, 0, 1, 1,
-0.934085, 0.3739186, -2.673651, 1, 1, 1, 1, 1,
-0.9312159, -1.123433, -3.040963, 1, 1, 1, 1, 1,
-0.9284443, -1.066248, -3.426004, 1, 1, 1, 1, 1,
-0.9238113, 0.1743051, -1.316899, 1, 1, 1, 1, 1,
-0.9226763, 0.3200321, -1.678703, 1, 1, 1, 1, 1,
-0.9209994, -0.009249768, -1.334176, 1, 1, 1, 1, 1,
-0.9209793, 1.717199, -0.3112409, 1, 1, 1, 1, 1,
-0.9166878, 0.6101575, 0.06077561, 1, 1, 1, 1, 1,
-0.91544, 0.7103852, 0.04171709, 1, 1, 1, 1, 1,
-0.9136435, 0.1395101, -3.572194, 1, 1, 1, 1, 1,
-0.9101944, -2.054474, -2.614281, 1, 1, 1, 1, 1,
-0.9079945, 1.373687, -1.704494, 1, 1, 1, 1, 1,
-0.9070396, -1.405481, -2.82928, 1, 1, 1, 1, 1,
-0.9067708, -0.7794543, -0.02983649, 1, 1, 1, 1, 1,
-0.904871, 0.5650498, -1.987687, 1, 1, 1, 1, 1,
-0.9002628, -0.8235758, -2.294029, 0, 0, 1, 1, 1,
-0.8998511, -0.0390203, -0.4540098, 1, 0, 0, 1, 1,
-0.8898506, 0.08144567, -1.508831, 1, 0, 0, 1, 1,
-0.8874688, -1.515234, -4.963677, 1, 0, 0, 1, 1,
-0.8852692, 0.193372, -1.544949, 1, 0, 0, 1, 1,
-0.8814813, -0.826332, -2.291748, 1, 0, 0, 1, 1,
-0.8710629, 1.238805, 0.3007028, 0, 0, 0, 1, 1,
-0.8695583, -1.01251, -1.801651, 0, 0, 0, 1, 1,
-0.8640642, 0.3333227, -2.03307, 0, 0, 0, 1, 1,
-0.8609148, 1.155352, -0.5311905, 0, 0, 0, 1, 1,
-0.8494724, -0.6862214, -0.8214005, 0, 0, 0, 1, 1,
-0.8423058, -0.3467306, -2.53489, 0, 0, 0, 1, 1,
-0.8390606, 1.529609, -1.33161, 0, 0, 0, 1, 1,
-0.8332868, 1.67549, -1.651717, 1, 1, 1, 1, 1,
-0.8324608, 0.2830948, -1.110316, 1, 1, 1, 1, 1,
-0.8299516, 1.698519, -1.429993, 1, 1, 1, 1, 1,
-0.8265829, 0.2297709, -0.3085841, 1, 1, 1, 1, 1,
-0.8225764, 0.3427046, -2.571375, 1, 1, 1, 1, 1,
-0.8171962, -0.01550724, -0.08552257, 1, 1, 1, 1, 1,
-0.816192, 0.4324861, -0.9597822, 1, 1, 1, 1, 1,
-0.813984, 0.43811, -1.681532, 1, 1, 1, 1, 1,
-0.8105534, 0.3565946, -0.8906133, 1, 1, 1, 1, 1,
-0.8085536, -1.390011, -4.128864, 1, 1, 1, 1, 1,
-0.8058902, -0.8023974, -2.032618, 1, 1, 1, 1, 1,
-0.8043042, -1.638435, -3.153847, 1, 1, 1, 1, 1,
-0.8026174, -0.1484436, -2.408299, 1, 1, 1, 1, 1,
-0.7978104, -0.1447295, -1.996403, 1, 1, 1, 1, 1,
-0.7965455, 0.8524027, -1.749828, 1, 1, 1, 1, 1,
-0.7935876, 0.6740128, -1.534347, 0, 0, 1, 1, 1,
-0.7904808, 1.421848, -2.133956, 1, 0, 0, 1, 1,
-0.782509, 0.5667008, 0.4451041, 1, 0, 0, 1, 1,
-0.7790822, 1.010947, -0.650517, 1, 0, 0, 1, 1,
-0.7757552, -0.9558303, -4.18128, 1, 0, 0, 1, 1,
-0.7752839, -0.4589433, 0.09049319, 1, 0, 0, 1, 1,
-0.7710435, 1.152313, -0.6858161, 0, 0, 0, 1, 1,
-0.7708783, 0.4763265, -0.748201, 0, 0, 0, 1, 1,
-0.7665263, -0.6393911, -3.448759, 0, 0, 0, 1, 1,
-0.764052, 1.193202, 1.619108, 0, 0, 0, 1, 1,
-0.7617288, 0.6328353, -1.345192, 0, 0, 0, 1, 1,
-0.760592, -1.056147, -1.788794, 0, 0, 0, 1, 1,
-0.7516005, -0.7559794, -3.303432, 0, 0, 0, 1, 1,
-0.7490142, 0.5229777, -1.204158, 1, 1, 1, 1, 1,
-0.7485976, 0.5318303, -2.253439, 1, 1, 1, 1, 1,
-0.7448117, -1.405196, -2.011806, 1, 1, 1, 1, 1,
-0.7416986, -0.07225903, -1.106057, 1, 1, 1, 1, 1,
-0.741518, 0.1146601, -0.9377143, 1, 1, 1, 1, 1,
-0.7388101, -0.3102645, -0.8332227, 1, 1, 1, 1, 1,
-0.7378811, 1.981123, -0.4777783, 1, 1, 1, 1, 1,
-0.7369024, 0.3217294, -0.4711681, 1, 1, 1, 1, 1,
-0.73687, 0.5552276, -0.02616915, 1, 1, 1, 1, 1,
-0.7284592, -1.19524, -2.051568, 1, 1, 1, 1, 1,
-0.7280236, -0.438679, -3.678349, 1, 1, 1, 1, 1,
-0.7272289, 0.375118, -0.9920805, 1, 1, 1, 1, 1,
-0.7172201, -1.356865, -2.696624, 1, 1, 1, 1, 1,
-0.7120619, -0.6073976, -2.583064, 1, 1, 1, 1, 1,
-0.710458, 1.568936, -0.2743039, 1, 1, 1, 1, 1,
-0.7079799, 0.7180517, -2.725251, 0, 0, 1, 1, 1,
-0.7029067, -0.8415037, -2.980717, 1, 0, 0, 1, 1,
-0.7027957, 0.0162237, -0.9766558, 1, 0, 0, 1, 1,
-0.6968802, -1.180948, -3.806534, 1, 0, 0, 1, 1,
-0.6899185, -0.3374009, -2.165851, 1, 0, 0, 1, 1,
-0.6877965, 0.9833059, 0.7162439, 1, 0, 0, 1, 1,
-0.683037, 0.4985711, -0.7324565, 0, 0, 0, 1, 1,
-0.6801489, 0.08133308, -2.492458, 0, 0, 0, 1, 1,
-0.6784505, 0.6198878, -0.9482911, 0, 0, 0, 1, 1,
-0.6778102, -1.446757, -2.485277, 0, 0, 0, 1, 1,
-0.675851, 0.2894304, 0.7891592, 0, 0, 0, 1, 1,
-0.6711589, -0.5789647, -2.078332, 0, 0, 0, 1, 1,
-0.6710069, -0.7599376, -1.778996, 0, 0, 0, 1, 1,
-0.6702329, 0.2607888, -0.6519023, 1, 1, 1, 1, 1,
-0.6690328, 1.20405, -1.871139, 1, 1, 1, 1, 1,
-0.6688395, 0.002534789, -1.020945, 1, 1, 1, 1, 1,
-0.6637654, 0.9272661, 1.5279, 1, 1, 1, 1, 1,
-0.6626539, 0.1912282, -1.004422, 1, 1, 1, 1, 1,
-0.6611847, -0.8783154, -1.451984, 1, 1, 1, 1, 1,
-0.6592745, -0.03729074, -2.211977, 1, 1, 1, 1, 1,
-0.6580548, -1.972127, -2.428234, 1, 1, 1, 1, 1,
-0.657267, -0.3394724, -0.7863147, 1, 1, 1, 1, 1,
-0.6571791, 0.07683927, -2.330841, 1, 1, 1, 1, 1,
-0.6567456, -0.2669405, -0.9871902, 1, 1, 1, 1, 1,
-0.6566165, 0.6869727, -1.787849, 1, 1, 1, 1, 1,
-0.6539054, 0.7837647, -0.5768281, 1, 1, 1, 1, 1,
-0.652773, -0.3682752, -2.044417, 1, 1, 1, 1, 1,
-0.6474319, -1.624553, -1.565852, 1, 1, 1, 1, 1,
-0.6381482, 0.3339779, 1.288605, 0, 0, 1, 1, 1,
-0.637938, 1.011289, -1.030173, 1, 0, 0, 1, 1,
-0.637238, -0.3866588, -2.020161, 1, 0, 0, 1, 1,
-0.6327935, 0.4639527, -1.387388, 1, 0, 0, 1, 1,
-0.6271018, -0.6895658, -3.564594, 1, 0, 0, 1, 1,
-0.6268815, -0.8267588, -3.950482, 1, 0, 0, 1, 1,
-0.6255937, 1.160959, -0.5283092, 0, 0, 0, 1, 1,
-0.6211238, 0.3408549, -0.3255962, 0, 0, 0, 1, 1,
-0.6140741, 1.176, -1.53531, 0, 0, 0, 1, 1,
-0.6139924, -0.3311957, -2.225891, 0, 0, 0, 1, 1,
-0.6078069, 0.2845061, -1.553214, 0, 0, 0, 1, 1,
-0.6074763, 1.436864, 0.02640864, 0, 0, 0, 1, 1,
-0.6036875, 0.08937179, -2.829141, 0, 0, 0, 1, 1,
-0.5990046, 2.018114, 0.6101027, 1, 1, 1, 1, 1,
-0.5988676, 0.76386, -1.836485, 1, 1, 1, 1, 1,
-0.5981545, -0.5991237, -2.667188, 1, 1, 1, 1, 1,
-0.5968496, -2.179946, -1.972253, 1, 1, 1, 1, 1,
-0.5960084, -0.06291813, -3.518076, 1, 1, 1, 1, 1,
-0.5958636, -0.1221384, -0.7330477, 1, 1, 1, 1, 1,
-0.5931093, -0.9272725, -1.267741, 1, 1, 1, 1, 1,
-0.5917574, 0.09718174, -1.524978, 1, 1, 1, 1, 1,
-0.5902345, 0.6742791, -1.727519, 1, 1, 1, 1, 1,
-0.5856892, -0.1996499, -1.96708, 1, 1, 1, 1, 1,
-0.5846124, 0.7545224, -0.5809601, 1, 1, 1, 1, 1,
-0.5769976, 0.5170553, -1.365791, 1, 1, 1, 1, 1,
-0.5757613, 1.079077, 0.7199873, 1, 1, 1, 1, 1,
-0.5749301, 1.186433, 0.5104775, 1, 1, 1, 1, 1,
-0.5715572, -1.083888, -3.623185, 1, 1, 1, 1, 1,
-0.571127, -1.774884, -3.138114, 0, 0, 1, 1, 1,
-0.569293, 0.7275275, 0.9614785, 1, 0, 0, 1, 1,
-0.5610854, 0.7850149, 0.2002929, 1, 0, 0, 1, 1,
-0.5595405, -0.9859604, -2.029498, 1, 0, 0, 1, 1,
-0.5568815, 0.460117, 0.8303606, 1, 0, 0, 1, 1,
-0.5543853, -0.2717022, -1.249419, 1, 0, 0, 1, 1,
-0.5494545, -2.011855, -2.429689, 0, 0, 0, 1, 1,
-0.5438206, -0.05788597, -2.07571, 0, 0, 0, 1, 1,
-0.5431702, 1.959429, -2.068593, 0, 0, 0, 1, 1,
-0.5366148, -1.502062, -2.870539, 0, 0, 0, 1, 1,
-0.534626, -0.08994234, -1.662393, 0, 0, 0, 1, 1,
-0.5336897, -0.7974387, -2.688351, 0, 0, 0, 1, 1,
-0.5331082, 0.6012363, -0.08586211, 0, 0, 0, 1, 1,
-0.5214708, -0.6682138, -0.1344564, 1, 1, 1, 1, 1,
-0.5208278, 0.4426923, 1.346283, 1, 1, 1, 1, 1,
-0.518271, 0.3516062, -0.1864826, 1, 1, 1, 1, 1,
-0.5168541, -0.682658, -2.384723, 1, 1, 1, 1, 1,
-0.5164174, 1.544877, -0.3737295, 1, 1, 1, 1, 1,
-0.512872, -0.7920662, -2.209923, 1, 1, 1, 1, 1,
-0.5104643, -0.5535441, -2.22631, 1, 1, 1, 1, 1,
-0.5102019, -0.648629, -2.443333, 1, 1, 1, 1, 1,
-0.5082653, -0.161824, 0.847609, 1, 1, 1, 1, 1,
-0.5080743, -1.076844, -3.938188, 1, 1, 1, 1, 1,
-0.5078681, 0.1122306, -1.36552, 1, 1, 1, 1, 1,
-0.5038646, 0.6527692, 0.06077452, 1, 1, 1, 1, 1,
-0.4988535, -0.2967786, -1.881025, 1, 1, 1, 1, 1,
-0.4979486, 1.214647, -1.078992, 1, 1, 1, 1, 1,
-0.4951056, 0.01527291, -2.596842, 1, 1, 1, 1, 1,
-0.494274, 1.722633, 1.45205, 0, 0, 1, 1, 1,
-0.4930342, -0.8147644, -4.073421, 1, 0, 0, 1, 1,
-0.4872668, -0.9392667, -0.6755754, 1, 0, 0, 1, 1,
-0.4869537, 1.10311, -1.061901, 1, 0, 0, 1, 1,
-0.4855205, -1.344432, -2.288726, 1, 0, 0, 1, 1,
-0.4816891, 0.4656174, -2.310675, 1, 0, 0, 1, 1,
-0.4816859, -0.4498296, -2.265993, 0, 0, 0, 1, 1,
-0.4809769, -0.8409813, -3.558329, 0, 0, 0, 1, 1,
-0.4791473, -0.8522861, -2.694703, 0, 0, 0, 1, 1,
-0.4699141, -0.4339593, -2.753955, 0, 0, 0, 1, 1,
-0.467391, 0.6902665, -0.2689808, 0, 0, 0, 1, 1,
-0.4644613, 1.557479, 0.3617413, 0, 0, 0, 1, 1,
-0.4637156, 2.026594, 0.05078666, 0, 0, 0, 1, 1,
-0.4633275, 0.5617617, -1.806803, 1, 1, 1, 1, 1,
-0.4617915, 0.1708803, -1.762513, 1, 1, 1, 1, 1,
-0.4611225, 2.85952, 0.7527771, 1, 1, 1, 1, 1,
-0.4606566, -0.1078073, -1.212438, 1, 1, 1, 1, 1,
-0.4600753, 2.092137, 0.02580419, 1, 1, 1, 1, 1,
-0.4571289, -0.05030925, -2.663122, 1, 1, 1, 1, 1,
-0.4558363, 0.5407499, -0.7076489, 1, 1, 1, 1, 1,
-0.455129, 1.01782, -1.114757, 1, 1, 1, 1, 1,
-0.4493208, 0.1236086, 0.8931015, 1, 1, 1, 1, 1,
-0.4485983, -0.9563373, -1.774072, 1, 1, 1, 1, 1,
-0.4462295, 1.653268, 1.680619, 1, 1, 1, 1, 1,
-0.4380947, -1.994011, -3.165926, 1, 1, 1, 1, 1,
-0.4337943, 0.4845617, 0.1101377, 1, 1, 1, 1, 1,
-0.4325888, -0.7864559, -1.288923, 1, 1, 1, 1, 1,
-0.4321696, -0.8124443, -4.848478, 1, 1, 1, 1, 1,
-0.4283126, 0.4620395, -1.536272, 0, 0, 1, 1, 1,
-0.424295, -1.591944, -4.122288, 1, 0, 0, 1, 1,
-0.4194121, 0.1956059, -0.9440856, 1, 0, 0, 1, 1,
-0.4152614, -0.08978412, 0.364463, 1, 0, 0, 1, 1,
-0.4081864, 0.2566286, 0.2793152, 1, 0, 0, 1, 1,
-0.4076694, -0.6647049, -1.648389, 1, 0, 0, 1, 1,
-0.406134, 1.114551, -0.6397288, 0, 0, 0, 1, 1,
-0.4043964, 1.384036, 0.4067503, 0, 0, 0, 1, 1,
-0.4027406, -0.6770025, -1.743207, 0, 0, 0, 1, 1,
-0.4010959, 0.7241304, -0.02092812, 0, 0, 0, 1, 1,
-0.4001772, 0.211887, -2.508515, 0, 0, 0, 1, 1,
-0.396625, 0.008051307, -2.204885, 0, 0, 0, 1, 1,
-0.3937911, 0.3661363, -0.2871554, 0, 0, 0, 1, 1,
-0.393632, 2.365372, -0.6701645, 1, 1, 1, 1, 1,
-0.3907333, 0.5874243, -1.250881, 1, 1, 1, 1, 1,
-0.386358, -0.9345624, -1.833323, 1, 1, 1, 1, 1,
-0.3862539, -1.453588, -3.253951, 1, 1, 1, 1, 1,
-0.3812943, 0.8327329, -0.9713871, 1, 1, 1, 1, 1,
-0.370813, 1.625012, 0.4579379, 1, 1, 1, 1, 1,
-0.370669, 0.7814331, -0.1603429, 1, 1, 1, 1, 1,
-0.3689915, -0.508989, -2.200958, 1, 1, 1, 1, 1,
-0.3650003, 0.1154111, -1.581344, 1, 1, 1, 1, 1,
-0.3642139, 0.1899835, -1.466248, 1, 1, 1, 1, 1,
-0.3639935, -0.9908861, -2.974139, 1, 1, 1, 1, 1,
-0.3575273, 0.2687752, -0.7730013, 1, 1, 1, 1, 1,
-0.3569022, -1.564365, -3.55127, 1, 1, 1, 1, 1,
-0.3531893, -0.4890333, -2.841312, 1, 1, 1, 1, 1,
-0.348831, 1.759606, 0.329717, 1, 1, 1, 1, 1,
-0.3459745, 1.284685, 0.225067, 0, 0, 1, 1, 1,
-0.3433472, 0.639761, -0.6610465, 1, 0, 0, 1, 1,
-0.3383735, 0.2982669, 0.00668745, 1, 0, 0, 1, 1,
-0.3337607, -0.6462425, -2.310536, 1, 0, 0, 1, 1,
-0.3318191, 2.038139, -0.7583838, 1, 0, 0, 1, 1,
-0.32952, 0.3130175, -0.1824913, 1, 0, 0, 1, 1,
-0.3248129, -1.443863, -1.243609, 0, 0, 0, 1, 1,
-0.3211644, 0.01899194, -1.967165, 0, 0, 0, 1, 1,
-0.3204397, 0.2039377, -1.54143, 0, 0, 0, 1, 1,
-0.317157, 0.07209656, -0.3974996, 0, 0, 0, 1, 1,
-0.3134508, 0.7087061, -1.65268, 0, 0, 0, 1, 1,
-0.3127632, -2.111559, -3.802009, 0, 0, 0, 1, 1,
-0.3076272, -0.0001972122, -1.32442, 0, 0, 0, 1, 1,
-0.3031034, 1.00238, 0.2947952, 1, 1, 1, 1, 1,
-0.3021182, 2.050022, 0.6671498, 1, 1, 1, 1, 1,
-0.2990068, -0.1587137, -1.851325, 1, 1, 1, 1, 1,
-0.2989666, -0.4276651, -2.845599, 1, 1, 1, 1, 1,
-0.2968524, 0.7830057, 1.426521, 1, 1, 1, 1, 1,
-0.2905306, -1.416156, -3.690696, 1, 1, 1, 1, 1,
-0.2882288, 1.286963, 1.530331, 1, 1, 1, 1, 1,
-0.2846358, -1.003325, -4.167539, 1, 1, 1, 1, 1,
-0.2802683, -0.5447062, -3.777141, 1, 1, 1, 1, 1,
-0.2713106, -0.1083255, -1.375313, 1, 1, 1, 1, 1,
-0.2679034, -0.5386676, -3.697246, 1, 1, 1, 1, 1,
-0.2651406, -0.4581252, -1.057652, 1, 1, 1, 1, 1,
-0.2596409, 0.6458454, 0.1596812, 1, 1, 1, 1, 1,
-0.2578168, 0.4155958, 0.1474492, 1, 1, 1, 1, 1,
-0.2571273, -0.4301693, -3.070588, 1, 1, 1, 1, 1,
-0.2526165, -0.5022901, -2.710107, 0, 0, 1, 1, 1,
-0.2522145, -0.3973803, -2.748135, 1, 0, 0, 1, 1,
-0.2515591, -0.2467279, -2.028765, 1, 0, 0, 1, 1,
-0.2502874, 0.2182692, -0.9918008, 1, 0, 0, 1, 1,
-0.2479189, 1.261592, -2.678428, 1, 0, 0, 1, 1,
-0.2372336, 0.1682751, -1.971833, 1, 0, 0, 1, 1,
-0.2331747, -0.8718852, -1.66344, 0, 0, 0, 1, 1,
-0.231526, 0.6145885, 1.054941, 0, 0, 0, 1, 1,
-0.2309237, 0.5150169, 1.42227, 0, 0, 0, 1, 1,
-0.2274921, -0.7940163, -4.147222, 0, 0, 0, 1, 1,
-0.225338, -0.6383247, -1.730992, 0, 0, 0, 1, 1,
-0.2247278, -0.02597111, -1.373837, 0, 0, 0, 1, 1,
-0.221795, -1.626042, -1.432022, 0, 0, 0, 1, 1,
-0.2197715, 0.9210111, -0.3378901, 1, 1, 1, 1, 1,
-0.2181848, 0.9158348, 0.3727932, 1, 1, 1, 1, 1,
-0.2178394, -0.7058793, -2.759385, 1, 1, 1, 1, 1,
-0.2169778, -0.1394793, -3.353702, 1, 1, 1, 1, 1,
-0.2125949, -1.884798, -2.473023, 1, 1, 1, 1, 1,
-0.2052965, -0.09931112, -2.217558, 1, 1, 1, 1, 1,
-0.2006352, 1.516096, 0.9478354, 1, 1, 1, 1, 1,
-0.1978366, 0.4760303, -0.797144, 1, 1, 1, 1, 1,
-0.1965109, 0.9621561, -1.700536, 1, 1, 1, 1, 1,
-0.1960274, 1.14986, -1.143068, 1, 1, 1, 1, 1,
-0.1948716, 0.7438209, -1.920627, 1, 1, 1, 1, 1,
-0.1915075, 0.6597164, -1.563429, 1, 1, 1, 1, 1,
-0.1891732, -0.8404617, -3.514149, 1, 1, 1, 1, 1,
-0.1891138, 0.8620595, 0.7794878, 1, 1, 1, 1, 1,
-0.1877332, 0.1390475, -1.104154, 1, 1, 1, 1, 1,
-0.186979, 0.9775795, -0.009368518, 0, 0, 1, 1, 1,
-0.1812939, -1.61103, -2.74354, 1, 0, 0, 1, 1,
-0.1795707, 0.9814178, -0.6359378, 1, 0, 0, 1, 1,
-0.1791843, -0.05180674, -4.193119, 1, 0, 0, 1, 1,
-0.1791215, 0.6734372, -0.2639445, 1, 0, 0, 1, 1,
-0.1756046, -0.1257623, -2.103932, 1, 0, 0, 1, 1,
-0.1744401, 0.8949774, 1.516556, 0, 0, 0, 1, 1,
-0.1732972, -0.3283353, -3.313104, 0, 0, 0, 1, 1,
-0.1680153, -0.5512259, -3.58225, 0, 0, 0, 1, 1,
-0.1676415, 0.6698741, -2.188808, 0, 0, 0, 1, 1,
-0.1670042, -0.2171697, -4.411854, 0, 0, 0, 1, 1,
-0.1668174, 0.345647, 0.8158385, 0, 0, 0, 1, 1,
-0.1646354, -0.6102538, -2.880673, 0, 0, 0, 1, 1,
-0.1640557, -0.02004355, -1.578965, 1, 1, 1, 1, 1,
-0.1639003, -0.8463144, -3.476064, 1, 1, 1, 1, 1,
-0.162775, 1.422752, 1.475012, 1, 1, 1, 1, 1,
-0.157556, 0.7935306, 1.117917, 1, 1, 1, 1, 1,
-0.1477199, -0.8703215, -4.235898, 1, 1, 1, 1, 1,
-0.1471481, -1.601276, -4.165607, 1, 1, 1, 1, 1,
-0.1443645, 1.348467, -2.450801, 1, 1, 1, 1, 1,
-0.1434822, 0.6850259, -0.4346439, 1, 1, 1, 1, 1,
-0.133767, 0.5406289, -0.2962033, 1, 1, 1, 1, 1,
-0.1323587, -0.9225993, -2.576658, 1, 1, 1, 1, 1,
-0.1297401, -0.6966408, -2.361779, 1, 1, 1, 1, 1,
-0.1255404, -0.08611458, -3.456123, 1, 1, 1, 1, 1,
-0.1228327, -0.609217, -1.671179, 1, 1, 1, 1, 1,
-0.1193279, -1.692013, -3.071924, 1, 1, 1, 1, 1,
-0.1132519, -1.340664, -4.536393, 1, 1, 1, 1, 1,
-0.1128337, -1.81166, -2.168453, 0, 0, 1, 1, 1,
-0.1122033, 0.2562381, -0.0354766, 1, 0, 0, 1, 1,
-0.1115884, 1.886315, -2.406437, 1, 0, 0, 1, 1,
-0.1041249, 1.181839, 1.907959, 1, 0, 0, 1, 1,
-0.103277, 0.915462, 0.1919327, 1, 0, 0, 1, 1,
-0.1006283, -0.05302586, -0.5111837, 1, 0, 0, 1, 1,
-0.09778356, -1.429404, -2.286862, 0, 0, 0, 1, 1,
-0.09767722, 1.190225, -1.650255, 0, 0, 0, 1, 1,
-0.09302436, -0.6668547, -3.304625, 0, 0, 0, 1, 1,
-0.09214352, -0.4028954, -4.242016, 0, 0, 0, 1, 1,
-0.08886401, 0.9639638, -0.2527925, 0, 0, 0, 1, 1,
-0.08716799, 0.307589, -1.991978, 0, 0, 0, 1, 1,
-0.08330435, 0.3944887, 0.4430788, 0, 0, 0, 1, 1,
-0.08126175, 1.620847, 0.06905265, 1, 1, 1, 1, 1,
-0.07811649, -1.137868, -3.852378, 1, 1, 1, 1, 1,
-0.07777895, -0.1054805, -1.763153, 1, 1, 1, 1, 1,
-0.0761423, -0.5710143, -3.853123, 1, 1, 1, 1, 1,
-0.07604086, -0.1437963, -4.221286, 1, 1, 1, 1, 1,
-0.0757077, 0.7373204, 1.12104, 1, 1, 1, 1, 1,
-0.07527231, -0.3980236, -3.124422, 1, 1, 1, 1, 1,
-0.07245019, -0.5383822, -3.893553, 1, 1, 1, 1, 1,
-0.06280631, 1.504678, -0.05939824, 1, 1, 1, 1, 1,
-0.05680624, 0.9536545, -0.0601669, 1, 1, 1, 1, 1,
-0.05073288, -0.7883754, -2.019117, 1, 1, 1, 1, 1,
-0.04497238, -0.4856195, -2.219585, 1, 1, 1, 1, 1,
-0.03960234, 0.1371432, 0.9412266, 1, 1, 1, 1, 1,
-0.0347293, -0.5305789, -3.264437, 1, 1, 1, 1, 1,
-0.0336925, -2.038968, -3.488146, 1, 1, 1, 1, 1,
-0.02764358, 0.2070094, -1.136597, 0, 0, 1, 1, 1,
-0.026093, 1.166001, -0.0675891, 1, 0, 0, 1, 1,
-0.01823422, -0.08859879, -3.063265, 1, 0, 0, 1, 1,
-0.01477306, -0.6309117, -2.806468, 1, 0, 0, 1, 1,
-0.005798273, 0.3816366, -2.981992, 1, 0, 0, 1, 1,
-0.002126996, -0.1586552, -4.084998, 1, 0, 0, 1, 1,
0.001773488, -0.2232858, 2.156597, 0, 0, 0, 1, 1,
0.002944803, 0.19884, 0.2032765, 0, 0, 0, 1, 1,
0.003279934, 1.672922, -1.2578, 0, 0, 0, 1, 1,
0.007748488, -1.112208, 3.028694, 0, 0, 0, 1, 1,
0.01227181, -1.099041, 1.967892, 0, 0, 0, 1, 1,
0.01491515, -0.5779311, 2.497695, 0, 0, 0, 1, 1,
0.01800465, 1.937383, 1.217485, 0, 0, 0, 1, 1,
0.01981927, -1.195798, 4.024392, 1, 1, 1, 1, 1,
0.02068901, 0.4340404, 1.49198, 1, 1, 1, 1, 1,
0.0259578, -1.103284, 3.494658, 1, 1, 1, 1, 1,
0.0284563, -0.8142008, 2.953611, 1, 1, 1, 1, 1,
0.02903201, 0.03767499, -0.7776589, 1, 1, 1, 1, 1,
0.0298009, 0.5320143, -0.9571219, 1, 1, 1, 1, 1,
0.03144364, 0.4252467, -0.8195289, 1, 1, 1, 1, 1,
0.03462529, 1.442405, -0.5280415, 1, 1, 1, 1, 1,
0.03700807, -1.227625, 3.310999, 1, 1, 1, 1, 1,
0.04101504, 2.344947, 0.719903, 1, 1, 1, 1, 1,
0.04603112, 2.205778, -1.172889, 1, 1, 1, 1, 1,
0.04656124, 1.061413, 0.1884188, 1, 1, 1, 1, 1,
0.05169496, -0.8228609, 4.369252, 1, 1, 1, 1, 1,
0.05802104, 0.4233634, 0.2540276, 1, 1, 1, 1, 1,
0.06238929, -0.6123813, 4.260047, 1, 1, 1, 1, 1,
0.06333209, -1.99919, 2.590665, 0, 0, 1, 1, 1,
0.06482019, 0.7985195, 0.8410769, 1, 0, 0, 1, 1,
0.06631313, 1.422042, 0.5677508, 1, 0, 0, 1, 1,
0.07685183, 1.350316, 1.870197, 1, 0, 0, 1, 1,
0.08426085, 3.033296, -0.3432115, 1, 0, 0, 1, 1,
0.08804329, 0.4820824, 1.248801, 1, 0, 0, 1, 1,
0.09249011, -1.32494, 2.449678, 0, 0, 0, 1, 1,
0.09438101, -2.86978, 3.618493, 0, 0, 0, 1, 1,
0.09528162, 0.3495673, 0.1431777, 0, 0, 0, 1, 1,
0.09624022, -0.587455, 3.550284, 0, 0, 0, 1, 1,
0.1048249, -1.157981, 4.210193, 0, 0, 0, 1, 1,
0.1051586, 0.7234874, -0.9627898, 0, 0, 0, 1, 1,
0.1055046, -1.059771, 2.823396, 0, 0, 0, 1, 1,
0.1062502, 0.3486613, 1.154681, 1, 1, 1, 1, 1,
0.1149194, 0.5515417, -0.4219523, 1, 1, 1, 1, 1,
0.1185132, 0.1902284, 2.305582, 1, 1, 1, 1, 1,
0.1196833, 0.5227228, -0.2222163, 1, 1, 1, 1, 1,
0.1198733, -0.1579182, 3.037361, 1, 1, 1, 1, 1,
0.1215867, -0.8848676, 2.667863, 1, 1, 1, 1, 1,
0.1222463, 0.845548, 0.04461225, 1, 1, 1, 1, 1,
0.1241276, -0.4711135, 3.38957, 1, 1, 1, 1, 1,
0.1268996, -0.5306893, 3.420457, 1, 1, 1, 1, 1,
0.1286081, 0.1138872, 1.770056, 1, 1, 1, 1, 1,
0.1312087, -0.2093101, 3.553895, 1, 1, 1, 1, 1,
0.1314466, 0.2603531, -0.4060401, 1, 1, 1, 1, 1,
0.1358836, -0.9703713, -0.4508849, 1, 1, 1, 1, 1,
0.1454064, 1.410994, 1.474648, 1, 1, 1, 1, 1,
0.145922, 0.5062496, -0.1354883, 1, 1, 1, 1, 1,
0.147678, 0.0164401, 2.163184, 0, 0, 1, 1, 1,
0.1507155, -0.5852216, 2.585993, 1, 0, 0, 1, 1,
0.1515874, -0.2326363, 3.066157, 1, 0, 0, 1, 1,
0.1553968, 0.4750683, -1.230084, 1, 0, 0, 1, 1,
0.1585696, -0.2023845, 2.325845, 1, 0, 0, 1, 1,
0.1591451, 0.09078007, 0.563686, 1, 0, 0, 1, 1,
0.1627709, 0.1482448, 1.696426, 0, 0, 0, 1, 1,
0.1671716, -0.7355161, 2.254207, 0, 0, 0, 1, 1,
0.1678726, -0.7885229, 3.083838, 0, 0, 0, 1, 1,
0.1682473, 0.36766, 0.1809847, 0, 0, 0, 1, 1,
0.1688157, -1.629356, 0.3739419, 0, 0, 0, 1, 1,
0.1695816, -0.5493484, 1.924156, 0, 0, 0, 1, 1,
0.170405, 0.104319, 2.205755, 0, 0, 0, 1, 1,
0.1711149, 0.1231506, 0.871195, 1, 1, 1, 1, 1,
0.1746965, 0.3862579, 0.7151045, 1, 1, 1, 1, 1,
0.1752609, 0.174384, -0.07660731, 1, 1, 1, 1, 1,
0.1762625, -0.6493902, 2.524425, 1, 1, 1, 1, 1,
0.1764075, -2.460057, 3.362099, 1, 1, 1, 1, 1,
0.1776543, 1.440865, -0.1614617, 1, 1, 1, 1, 1,
0.1787094, 0.2875194, 0.5027479, 1, 1, 1, 1, 1,
0.1789901, -1.623698, 2.628478, 1, 1, 1, 1, 1,
0.1791651, 0.5646201, 1.003552, 1, 1, 1, 1, 1,
0.1859228, -0.1820024, 2.37453, 1, 1, 1, 1, 1,
0.1883071, 1.201426, 0.4181592, 1, 1, 1, 1, 1,
0.1939492, 0.2503666, 1.014245, 1, 1, 1, 1, 1,
0.1969694, -0.4944982, 1.380028, 1, 1, 1, 1, 1,
0.1970354, 0.1493627, -0.4576015, 1, 1, 1, 1, 1,
0.2015684, -0.9786434, 2.943388, 1, 1, 1, 1, 1,
0.203214, 0.1823507, 0.8383505, 0, 0, 1, 1, 1,
0.2034028, -0.2306531, 2.727884, 1, 0, 0, 1, 1,
0.2034144, -1.838253, 2.245071, 1, 0, 0, 1, 1,
0.2041814, -1.294908, 2.729913, 1, 0, 0, 1, 1,
0.2180906, 0.3665628, 1.835604, 1, 0, 0, 1, 1,
0.2214099, -0.5612179, 2.631926, 1, 0, 0, 1, 1,
0.2216914, -1.148463, 1.355542, 0, 0, 0, 1, 1,
0.2296478, -0.8646034, 4.499032, 0, 0, 0, 1, 1,
0.2300321, 0.4655811, -0.3521774, 0, 0, 0, 1, 1,
0.2308011, 0.1531352, 0.9805288, 0, 0, 0, 1, 1,
0.23202, 0.1575453, -0.4993467, 0, 0, 0, 1, 1,
0.2322476, 0.7708976, 1.020444, 0, 0, 0, 1, 1,
0.2461515, 0.1124152, 3.618822, 0, 0, 0, 1, 1,
0.2481228, -0.9452621, 2.957942, 1, 1, 1, 1, 1,
0.2515914, -0.73616, 2.450443, 1, 1, 1, 1, 1,
0.2524183, 1.160662, -1.71446, 1, 1, 1, 1, 1,
0.2579831, -2.020204, 2.644173, 1, 1, 1, 1, 1,
0.2580097, -0.3225386, 2.499853, 1, 1, 1, 1, 1,
0.2593683, 1.572264, -0.9319004, 1, 1, 1, 1, 1,
0.2636141, -0.5531273, 2.673666, 1, 1, 1, 1, 1,
0.2639832, -0.6285256, 3.948509, 1, 1, 1, 1, 1,
0.2703685, 1.137332, -0.234688, 1, 1, 1, 1, 1,
0.2714726, -0.7595414, 2.221998, 1, 1, 1, 1, 1,
0.2722169, 0.4152241, 2.962103, 1, 1, 1, 1, 1,
0.2746986, 0.7369185, 2.287136, 1, 1, 1, 1, 1,
0.2760646, -0.393499, 0.6731582, 1, 1, 1, 1, 1,
0.2796757, 0.9079188, -1.057902, 1, 1, 1, 1, 1,
0.2803324, 0.4213669, 0.5929223, 1, 1, 1, 1, 1,
0.2848446, 0.1100368, 2.087468, 0, 0, 1, 1, 1,
0.2848973, -0.315337, 2.886204, 1, 0, 0, 1, 1,
0.2921734, -0.08417305, 2.827185, 1, 0, 0, 1, 1,
0.2927427, 1.151658, -0.3608208, 1, 0, 0, 1, 1,
0.2964936, 1.576832, 1.433892, 1, 0, 0, 1, 1,
0.2973818, -0.4998342, 3.344449, 1, 0, 0, 1, 1,
0.2992207, 0.4441045, -0.06219695, 0, 0, 0, 1, 1,
0.2996691, -1.305602, 1.729622, 0, 0, 0, 1, 1,
0.3017725, -0.2041583, 2.177896, 0, 0, 0, 1, 1,
0.3042023, 0.5723972, -0.8822879, 0, 0, 0, 1, 1,
0.3055431, -0.6417652, 4.090274, 0, 0, 0, 1, 1,
0.311756, 1.281225, -0.5682119, 0, 0, 0, 1, 1,
0.3145404, -0.1443295, 0.7802475, 0, 0, 0, 1, 1,
0.3147953, -0.2742897, 2.630415, 1, 1, 1, 1, 1,
0.3172926, -0.3407679, 2.314235, 1, 1, 1, 1, 1,
0.3190805, 1.246369, 0.3709593, 1, 1, 1, 1, 1,
0.3205414, -0.8903353, 1.681804, 1, 1, 1, 1, 1,
0.3210769, -0.6105137, -0.02314725, 1, 1, 1, 1, 1,
0.3211384, 0.01260897, 1.763911, 1, 1, 1, 1, 1,
0.324842, -1.862504, 4.9455, 1, 1, 1, 1, 1,
0.3262933, 0.3676959, 0.7446147, 1, 1, 1, 1, 1,
0.328079, 0.1321613, 2.924114, 1, 1, 1, 1, 1,
0.3300399, -0.4010759, 2.592988, 1, 1, 1, 1, 1,
0.3316798, -0.4038946, 2.889551, 1, 1, 1, 1, 1,
0.3365767, 0.5373892, 1.256997, 1, 1, 1, 1, 1,
0.3387863, 0.6194173, 0.7644311, 1, 1, 1, 1, 1,
0.3414819, 0.9060642, 1.839948, 1, 1, 1, 1, 1,
0.3418588, -0.2500167, 2.594924, 1, 1, 1, 1, 1,
0.3437364, -0.5230603, 5.134251, 0, 0, 1, 1, 1,
0.3457895, -0.145682, 1.040009, 1, 0, 0, 1, 1,
0.3506753, 0.1894969, 2.550261, 1, 0, 0, 1, 1,
0.3512063, 1.466045, 0.811627, 1, 0, 0, 1, 1,
0.3529634, -0.244423, 3.23289, 1, 0, 0, 1, 1,
0.3536903, 0.7614436, 0.3616999, 1, 0, 0, 1, 1,
0.3580652, 1.561656, 0.05364792, 0, 0, 0, 1, 1,
0.359206, -0.4870186, 1.31242, 0, 0, 0, 1, 1,
0.3594446, -1.566847, 2.465266, 0, 0, 0, 1, 1,
0.3601814, -1.139284, 3.715513, 0, 0, 0, 1, 1,
0.3642251, -1.362414, 2.60893, 0, 0, 0, 1, 1,
0.3642525, 0.6333345, -0.2054916, 0, 0, 0, 1, 1,
0.3664746, 1.342447, -0.2618076, 0, 0, 0, 1, 1,
0.3690263, -0.7302731, 2.856989, 1, 1, 1, 1, 1,
0.3702603, -0.13097, 4.831122, 1, 1, 1, 1, 1,
0.3774363, 0.7293345, 0.568915, 1, 1, 1, 1, 1,
0.378038, -1.254219, 2.367065, 1, 1, 1, 1, 1,
0.3786944, 0.8188096, 0.529337, 1, 1, 1, 1, 1,
0.3790872, -0.4308057, 3.109664, 1, 1, 1, 1, 1,
0.3804089, 2.221881, 1.003515, 1, 1, 1, 1, 1,
0.3831642, -0.1076698, 2.18446, 1, 1, 1, 1, 1,
0.3910057, 0.17525, 1.382139, 1, 1, 1, 1, 1,
0.3910455, -0.4220446, 2.051762, 1, 1, 1, 1, 1,
0.3928232, -2.152174, 1.968524, 1, 1, 1, 1, 1,
0.3929047, -0.7272858, 3.306625, 1, 1, 1, 1, 1,
0.3942791, 1.063308, 1.210002, 1, 1, 1, 1, 1,
0.3948949, -2.131212, 3.299328, 1, 1, 1, 1, 1,
0.3989702, -0.7267602, 3.230868, 1, 1, 1, 1, 1,
0.4005628, -0.3689956, 1.96279, 0, 0, 1, 1, 1,
0.4051876, -0.6514693, 0.968918, 1, 0, 0, 1, 1,
0.413942, 1.438071, 0.6996096, 1, 0, 0, 1, 1,
0.417629, 0.3738517, 0.8610399, 1, 0, 0, 1, 1,
0.4272735, 0.6194122, 0.9372591, 1, 0, 0, 1, 1,
0.428195, 1.002471, -0.1189047, 1, 0, 0, 1, 1,
0.4285705, -0.5235225, 2.39335, 0, 0, 0, 1, 1,
0.4306821, -0.1954986, 3.47857, 0, 0, 0, 1, 1,
0.4343009, -0.4861957, 3.29725, 0, 0, 0, 1, 1,
0.4343589, 1.496604, 0.3256251, 0, 0, 0, 1, 1,
0.442174, 0.1478269, 1.755221, 0, 0, 0, 1, 1,
0.4466156, 1.474421, 0.3402121, 0, 0, 0, 1, 1,
0.4478596, -0.2055095, 1.492457, 0, 0, 0, 1, 1,
0.4508826, -0.3642389, 0.4364564, 1, 1, 1, 1, 1,
0.4514647, -0.7308254, 3.941548, 1, 1, 1, 1, 1,
0.4518723, -0.05210775, 1.071329, 1, 1, 1, 1, 1,
0.4537402, 1.089353, -0.4460461, 1, 1, 1, 1, 1,
0.4631937, 1.676712, 0.6047537, 1, 1, 1, 1, 1,
0.4634852, 0.9314582, 0.1401779, 1, 1, 1, 1, 1,
0.4746136, 0.3647552, 1.743122, 1, 1, 1, 1, 1,
0.475726, -0.3240015, 1.425892, 1, 1, 1, 1, 1,
0.4764591, -0.08373937, 1.949011, 1, 1, 1, 1, 1,
0.4800515, 0.2545699, 0.7599244, 1, 1, 1, 1, 1,
0.4862193, 0.125774, 2.423464, 1, 1, 1, 1, 1,
0.4879287, -0.8437304, 3.424295, 1, 1, 1, 1, 1,
0.4879371, -1.056215, 2.133474, 1, 1, 1, 1, 1,
0.4917103, 0.06779917, 3.317123, 1, 1, 1, 1, 1,
0.4917171, -0.09411095, 2.91962, 1, 1, 1, 1, 1,
0.4962456, -0.8612687, 2.311783, 0, 0, 1, 1, 1,
0.496877, 0.5166106, 1.1503, 1, 0, 0, 1, 1,
0.4978368, -0.1404768, 3.019041, 1, 0, 0, 1, 1,
0.4980365, 2.830093, 0.3506755, 1, 0, 0, 1, 1,
0.4990489, 0.03601743, 1.517226, 1, 0, 0, 1, 1,
0.503568, 0.5335602, 2.240115, 1, 0, 0, 1, 1,
0.5037764, -1.342818, 1.954571, 0, 0, 0, 1, 1,
0.5071357, -1.141448, 3.301824, 0, 0, 0, 1, 1,
0.515822, 0.5869492, 0.2196244, 0, 0, 0, 1, 1,
0.5232978, -1.107747, 3.308514, 0, 0, 0, 1, 1,
0.524668, 0.4489062, 0.8939099, 0, 0, 0, 1, 1,
0.5292475, -0.3934478, 2.081545, 0, 0, 0, 1, 1,
0.5340582, -0.6077237, 1.854061, 0, 0, 0, 1, 1,
0.5388041, 0.6238168, -0.5808994, 1, 1, 1, 1, 1,
0.5425242, -2.144317, 2.724896, 1, 1, 1, 1, 1,
0.5426579, 0.5502413, -0.8046144, 1, 1, 1, 1, 1,
0.5487567, 0.006065593, 0.5136444, 1, 1, 1, 1, 1,
0.549628, -1.809368, 3.322925, 1, 1, 1, 1, 1,
0.5566204, -0.9922556, 3.531006, 1, 1, 1, 1, 1,
0.5596709, 0.9225332, 1.763205, 1, 1, 1, 1, 1,
0.5598711, -0.7484194, 3.244699, 1, 1, 1, 1, 1,
0.5626366, -0.9032373, 2.045405, 1, 1, 1, 1, 1,
0.5650849, -0.03019377, 1.126521, 1, 1, 1, 1, 1,
0.5693731, 2.026861, -1.293379, 1, 1, 1, 1, 1,
0.5700608, 0.7150815, 1.401492, 1, 1, 1, 1, 1,
0.5794647, 1.078784, 0.1752894, 1, 1, 1, 1, 1,
0.5799714, 0.7034451, 2.085235, 1, 1, 1, 1, 1,
0.580013, -1.208958, 2.507248, 1, 1, 1, 1, 1,
0.5809489, 0.07378277, 0.8058222, 0, 0, 1, 1, 1,
0.5852647, 1.141737, 0.4696254, 1, 0, 0, 1, 1,
0.5864865, -0.5808066, 2.276672, 1, 0, 0, 1, 1,
0.5910723, -1.72617, 2.568236, 1, 0, 0, 1, 1,
0.5943798, -3.06057, 2.525518, 1, 0, 0, 1, 1,
0.5955466, -0.6637114, 3.135957, 1, 0, 0, 1, 1,
0.605928, -0.1646798, 2.01651, 0, 0, 0, 1, 1,
0.6065502, -0.5291988, 2.202904, 0, 0, 0, 1, 1,
0.6077276, 0.8158259, 3.188747, 0, 0, 0, 1, 1,
0.6112852, 0.5267869, 1.57309, 0, 0, 0, 1, 1,
0.6138306, -0.3907331, 3.565627, 0, 0, 0, 1, 1,
0.6139039, 2.257575, 1.205006, 0, 0, 0, 1, 1,
0.622052, 0.1174488, 1.281067, 0, 0, 0, 1, 1,
0.6220948, -2.324006, 3.880453, 1, 1, 1, 1, 1,
0.6225224, 0.1665313, 1.33855, 1, 1, 1, 1, 1,
0.6239222, -1.410331, 2.169244, 1, 1, 1, 1, 1,
0.629064, -0.1531019, 1.302137, 1, 1, 1, 1, 1,
0.6371781, -1.595422, 1.982499, 1, 1, 1, 1, 1,
0.6440267, -1.294898, 1.984723, 1, 1, 1, 1, 1,
0.6496106, 0.8496162, -0.2253326, 1, 1, 1, 1, 1,
0.6537843, 0.7691012, 2.045371, 1, 1, 1, 1, 1,
0.6551597, 0.9108411, -0.6723379, 1, 1, 1, 1, 1,
0.6632538, -0.5799981, 1.487176, 1, 1, 1, 1, 1,
0.665738, 0.2702971, 2.717787, 1, 1, 1, 1, 1,
0.666449, -1.021774, 3.074954, 1, 1, 1, 1, 1,
0.6665314, 0.2747388, 1.624187, 1, 1, 1, 1, 1,
0.6767316, -1.30845, 3.58467, 1, 1, 1, 1, 1,
0.6785752, 2.078412, 0.6093936, 1, 1, 1, 1, 1,
0.6821958, 0.5014836, -1.953849, 0, 0, 1, 1, 1,
0.684773, 2.295134, 0.3308522, 1, 0, 0, 1, 1,
0.6864158, 0.3245023, 0.8517709, 1, 0, 0, 1, 1,
0.6864499, 0.7245621, 2.10904, 1, 0, 0, 1, 1,
0.6866115, -1.671406, 2.915765, 1, 0, 0, 1, 1,
0.6873865, -0.2389321, 1.383432, 1, 0, 0, 1, 1,
0.6875411, 1.978768, 0.0165077, 0, 0, 0, 1, 1,
0.6883009, 0.325286, 2.362102, 0, 0, 0, 1, 1,
0.6899835, -0.2228506, 0.8348523, 0, 0, 0, 1, 1,
0.6901121, 0.06801955, 1.977803, 0, 0, 0, 1, 1,
0.6910291, -0.05823587, 0.508105, 0, 0, 0, 1, 1,
0.6948532, 0.02884299, 1.03692, 0, 0, 0, 1, 1,
0.6956424, 0.1998287, -0.0008618767, 0, 0, 0, 1, 1,
0.6956484, 1.928014, 0.6605856, 1, 1, 1, 1, 1,
0.6996816, -1.037057, 0.515322, 1, 1, 1, 1, 1,
0.7211347, 1.667666, 1.359614, 1, 1, 1, 1, 1,
0.7227759, 0.005595558, 1.814012, 1, 1, 1, 1, 1,
0.7240916, -1.525229, 2.428978, 1, 1, 1, 1, 1,
0.7246931, 0.762392, 0.1859545, 1, 1, 1, 1, 1,
0.7356519, 0.048435, 1.016187, 1, 1, 1, 1, 1,
0.7361553, -0.3442757, 1.713887, 1, 1, 1, 1, 1,
0.7431182, -0.1646509, 0.5037683, 1, 1, 1, 1, 1,
0.7437317, 0.5773385, 0.02186576, 1, 1, 1, 1, 1,
0.7437947, 1.084354, 1.787362, 1, 1, 1, 1, 1,
0.7476783, 0.09576854, 1.752189, 1, 1, 1, 1, 1,
0.7479573, 1.591173, 1.762226, 1, 1, 1, 1, 1,
0.7501464, -0.6533443, 1.541737, 1, 1, 1, 1, 1,
0.7529165, 0.9348863, 0.693735, 1, 1, 1, 1, 1,
0.7564585, -0.9665602, 3.246604, 0, 0, 1, 1, 1,
0.7601056, -1.053396, 3.234411, 1, 0, 0, 1, 1,
0.7619213, 0.3297651, 0.9938438, 1, 0, 0, 1, 1,
0.7645899, 0.4633409, 1.419699, 1, 0, 0, 1, 1,
0.7700883, 0.8267708, 2.556768, 1, 0, 0, 1, 1,
0.7727115, -0.3130212, 1.485703, 1, 0, 0, 1, 1,
0.7773148, 0.975345, 0.7982394, 0, 0, 0, 1, 1,
0.7793432, -1.87034, 2.525967, 0, 0, 0, 1, 1,
0.7812712, -0.384015, 2.433641, 0, 0, 0, 1, 1,
0.7834144, -0.3987779, 3.223939, 0, 0, 0, 1, 1,
0.7855762, 0.01421823, 1.507197, 0, 0, 0, 1, 1,
0.7961925, 0.7914125, -0.6746345, 0, 0, 0, 1, 1,
0.8074437, 2.053144, 0.1098598, 0, 0, 0, 1, 1,
0.8110027, -0.4174336, 1.151133, 1, 1, 1, 1, 1,
0.8116801, 0.3184511, 0.6142575, 1, 1, 1, 1, 1,
0.8141148, -1.20241, 2.939517, 1, 1, 1, 1, 1,
0.8156557, 0.7013046, 1.463626, 1, 1, 1, 1, 1,
0.8224527, 0.08199487, 2.624285, 1, 1, 1, 1, 1,
0.8233035, -0.8910883, 1.789809, 1, 1, 1, 1, 1,
0.8241794, 0.5011133, 1.608642, 1, 1, 1, 1, 1,
0.8277941, -1.595592, 3.233192, 1, 1, 1, 1, 1,
0.8285685, 0.1893586, 2.36922, 1, 1, 1, 1, 1,
0.8305387, 0.06809828, 2.999525, 1, 1, 1, 1, 1,
0.831344, -0.8948342, 3.733527, 1, 1, 1, 1, 1,
0.8316632, 1.026171, 1.39812, 1, 1, 1, 1, 1,
0.8333992, -0.6434354, 2.91328, 1, 1, 1, 1, 1,
0.8335468, -0.8988196, 3.088223, 1, 1, 1, 1, 1,
0.8356541, -1.707025, 2.033924, 1, 1, 1, 1, 1,
0.8370686, -0.3564731, 2.195385, 0, 0, 1, 1, 1,
0.8378632, 1.535778, 0.2317636, 1, 0, 0, 1, 1,
0.8452713, -1.081271, 3.462759, 1, 0, 0, 1, 1,
0.8456619, -0.001871479, 1.063293, 1, 0, 0, 1, 1,
0.8523244, 1.425631, 0.3200285, 1, 0, 0, 1, 1,
0.8529822, 1.256361, -1.035958, 1, 0, 0, 1, 1,
0.8707034, 0.4074364, 0.7300175, 0, 0, 0, 1, 1,
0.8714024, -0.5453888, 1.261623, 0, 0, 0, 1, 1,
0.8771826, 0.05756268, 0.02570491, 0, 0, 0, 1, 1,
0.8800152, -0.3161586, 1.820696, 0, 0, 0, 1, 1,
0.881176, -0.3097287, 2.651959, 0, 0, 0, 1, 1,
0.8819689, 0.6142449, 1.568518, 0, 0, 0, 1, 1,
0.8852816, 0.7938668, 1.088611, 0, 0, 0, 1, 1,
0.8852896, -0.2947392, 1.022721, 1, 1, 1, 1, 1,
0.8933907, -0.2571234, 2.776435, 1, 1, 1, 1, 1,
0.8936195, 0.656717, 1.430425, 1, 1, 1, 1, 1,
0.8951571, 1.684619, -0.4993548, 1, 1, 1, 1, 1,
0.8960828, 2.256774, 1.615476, 1, 1, 1, 1, 1,
0.9016953, 0.7182389, 2.765332, 1, 1, 1, 1, 1,
0.9048674, 0.6581072, 1.377586, 1, 1, 1, 1, 1,
0.9052644, -0.0006985826, 1.532517, 1, 1, 1, 1, 1,
0.9163615, -0.4664614, 3.774305, 1, 1, 1, 1, 1,
0.9191822, -0.1872052, 1.630732, 1, 1, 1, 1, 1,
0.9208029, -0.2761669, 1.077471, 1, 1, 1, 1, 1,
0.9228638, 0.9686345, 0.537769, 1, 1, 1, 1, 1,
0.9260407, 0.7519529, -0.1219521, 1, 1, 1, 1, 1,
0.935418, 1.279992, 0.1193077, 1, 1, 1, 1, 1,
0.9369441, -0.5295905, 2.415496, 1, 1, 1, 1, 1,
0.9397233, -0.1477928, 2.112266, 0, 0, 1, 1, 1,
0.946345, 0.4791246, 0.9358612, 1, 0, 0, 1, 1,
0.9479852, -0.3066324, 0.3163942, 1, 0, 0, 1, 1,
0.9525756, -0.07244635, -0.02633864, 1, 0, 0, 1, 1,
0.958447, -0.9091983, 4.071799, 1, 0, 0, 1, 1,
0.960339, 0.7596176, 1.336569, 1, 0, 0, 1, 1,
0.961817, 0.5545555, 0.04429433, 0, 0, 0, 1, 1,
0.9735544, -0.2003866, 1.33085, 0, 0, 0, 1, 1,
0.9755296, -0.5032741, 1.146892, 0, 0, 0, 1, 1,
0.9848064, 0.8614376, 0.2382201, 0, 0, 0, 1, 1,
0.9920452, 1.032887, -0.1455116, 0, 0, 0, 1, 1,
0.9975879, -1.177555, 1.953167, 0, 0, 0, 1, 1,
1.003945, 0.9469764, 0.9579215, 0, 0, 0, 1, 1,
1.00443, 0.9113014, -0.2586947, 1, 1, 1, 1, 1,
1.005305, 1.814929, 1.866443, 1, 1, 1, 1, 1,
1.012146, -0.4112792, 2.233013, 1, 1, 1, 1, 1,
1.012272, -0.1505009, 2.648927, 1, 1, 1, 1, 1,
1.016572, -0.4619336, 0.4622107, 1, 1, 1, 1, 1,
1.017843, -0.2579504, 1.744392, 1, 1, 1, 1, 1,
1.019648, -0.5307362, 3.610937, 1, 1, 1, 1, 1,
1.025537, 1.325415, 1.442774, 1, 1, 1, 1, 1,
1.031459, 0.1816448, 1.501867, 1, 1, 1, 1, 1,
1.03678, 0.08972887, 2.157631, 1, 1, 1, 1, 1,
1.04139, -0.2822528, 1.907136, 1, 1, 1, 1, 1,
1.051329, -0.420357, 1.85979, 1, 1, 1, 1, 1,
1.051345, 0.6673026, 2.989217, 1, 1, 1, 1, 1,
1.05508, 0.2185778, 1.447868, 1, 1, 1, 1, 1,
1.060303, 2.079298, 1.195361, 1, 1, 1, 1, 1,
1.064005, 1.438417, 1.519133, 0, 0, 1, 1, 1,
1.076003, 0.1127068, 0.7293185, 1, 0, 0, 1, 1,
1.077096, 0.1881428, 0.2981309, 1, 0, 0, 1, 1,
1.078801, 2.848864, 1.199049, 1, 0, 0, 1, 1,
1.08327, 1.083762, 1.198804, 1, 0, 0, 1, 1,
1.09205, -0.5062202, 2.909267, 1, 0, 0, 1, 1,
1.094478, 1.003362, 1.072283, 0, 0, 0, 1, 1,
1.098051, -1.03831, 2.141556, 0, 0, 0, 1, 1,
1.103816, 0.8776411, -0.6090059, 0, 0, 0, 1, 1,
1.11076, 1.641214, 1.480072, 0, 0, 0, 1, 1,
1.111251, 0.5639408, 0.995193, 0, 0, 0, 1, 1,
1.11587, -0.5508609, 2.520915, 0, 0, 0, 1, 1,
1.11703, 1.272446, 1.526238, 0, 0, 0, 1, 1,
1.121624, -0.825529, 1.973727, 1, 1, 1, 1, 1,
1.128303, -0.4222258, 1.537092, 1, 1, 1, 1, 1,
1.135328, 0.5724168, 0.4302789, 1, 1, 1, 1, 1,
1.151472, 0.4614224, -0.9069149, 1, 1, 1, 1, 1,
1.156243, -0.144826, 1.633591, 1, 1, 1, 1, 1,
1.158272, 1.197034, 0.2702124, 1, 1, 1, 1, 1,
1.160165, 0.7983974, 1.33319, 1, 1, 1, 1, 1,
1.167735, -1.599586, 3.229576, 1, 1, 1, 1, 1,
1.171957, 0.01280586, 1.495511, 1, 1, 1, 1, 1,
1.180367, 0.9333336, 1.070901, 1, 1, 1, 1, 1,
1.185538, -0.255766, 3.655474, 1, 1, 1, 1, 1,
1.186144, 0.3566356, 1.738196, 1, 1, 1, 1, 1,
1.202409, 0.7049096, 1.808939, 1, 1, 1, 1, 1,
1.206668, 0.9654646, -0.4813061, 1, 1, 1, 1, 1,
1.211282, -0.9652305, 0.9038268, 1, 1, 1, 1, 1,
1.211667, 0.7307456, 0.2393509, 0, 0, 1, 1, 1,
1.212821, -0.5744228, 1.199033, 1, 0, 0, 1, 1,
1.214816, -0.2279004, 0.1007857, 1, 0, 0, 1, 1,
1.219625, 0.4171756, 1.465808, 1, 0, 0, 1, 1,
1.231195, 0.9901277, 0.8416963, 1, 0, 0, 1, 1,
1.249412, -0.8165704, 1.624462, 1, 0, 0, 1, 1,
1.249653, -1.54355, 0.4998005, 0, 0, 0, 1, 1,
1.250808, -0.6589042, 2.492841, 0, 0, 0, 1, 1,
1.258249, 0.2201655, 0.6358017, 0, 0, 0, 1, 1,
1.262135, 0.2986707, 1.471492, 0, 0, 0, 1, 1,
1.275185, -0.4567986, 2.406079, 0, 0, 0, 1, 1,
1.280311, -1.61535, 2.562828, 0, 0, 0, 1, 1,
1.283135, -1.624133, 1.51826, 0, 0, 0, 1, 1,
1.28369, -0.6765511, 3.395808, 1, 1, 1, 1, 1,
1.291572, 0.6697158, 1.865412, 1, 1, 1, 1, 1,
1.294079, 0.7246277, 2.11059, 1, 1, 1, 1, 1,
1.294778, -0.6950359, 1.787218, 1, 1, 1, 1, 1,
1.295458, 0.1929097, 1.013217, 1, 1, 1, 1, 1,
1.299013, -0.1896744, 0.7718948, 1, 1, 1, 1, 1,
1.307124, 2.723315, 0.7691877, 1, 1, 1, 1, 1,
1.325691, 0.5416339, 0.8597295, 1, 1, 1, 1, 1,
1.330022, -0.6177028, 2.157511, 1, 1, 1, 1, 1,
1.332468, -1.111833, 1.776896, 1, 1, 1, 1, 1,
1.334612, -0.0385298, 0.6234376, 1, 1, 1, 1, 1,
1.34042, -0.02627424, -0.03554662, 1, 1, 1, 1, 1,
1.344944, 1.614292, 0.1645613, 1, 1, 1, 1, 1,
1.346737, 0.4734299, 0.5927109, 1, 1, 1, 1, 1,
1.35355, 0.5547791, 0.8779413, 1, 1, 1, 1, 1,
1.367942, 1.676038, 0.5553951, 0, 0, 1, 1, 1,
1.372107, 1.755825, -1.146109, 1, 0, 0, 1, 1,
1.374975, -0.02704719, 1.529483, 1, 0, 0, 1, 1,
1.379004, -0.1680358, 1.707768, 1, 0, 0, 1, 1,
1.382234, 0.2252166, 1.141354, 1, 0, 0, 1, 1,
1.389978, 0.656132, 0.5541328, 1, 0, 0, 1, 1,
1.400461, -2.643139, 2.640207, 0, 0, 0, 1, 1,
1.406814, -1.58557, 2.940687, 0, 0, 0, 1, 1,
1.408848, 0.440766, 0.8372511, 0, 0, 0, 1, 1,
1.41311, -0.5999671, 1.042247, 0, 0, 0, 1, 1,
1.43821, 0.2481799, 1.485936, 0, 0, 0, 1, 1,
1.507324, -0.1262653, 1.538719, 0, 0, 0, 1, 1,
1.5136, -0.5234776, 1.743414, 0, 0, 0, 1, 1,
1.515353, -0.9682692, 1.3425, 1, 1, 1, 1, 1,
1.51886, 0.2423213, 1.579104, 1, 1, 1, 1, 1,
1.530575, 0.8556257, 2.395475, 1, 1, 1, 1, 1,
1.532969, -0.9890209, 1.893529, 1, 1, 1, 1, 1,
1.544976, -0.7994162, 3.268674, 1, 1, 1, 1, 1,
1.568385, -0.2265003, 2.152163, 1, 1, 1, 1, 1,
1.575772, 0.2671211, 0.35158, 1, 1, 1, 1, 1,
1.577431, -0.3404349, 4.185516, 1, 1, 1, 1, 1,
1.578723, -0.171688, 1.184022, 1, 1, 1, 1, 1,
1.583592, -0.07413962, 1.104702, 1, 1, 1, 1, 1,
1.586102, -1.019898, 3.941355, 1, 1, 1, 1, 1,
1.612078, -1.142795, 1.224085, 1, 1, 1, 1, 1,
1.613405, -0.8897048, 1.001182, 1, 1, 1, 1, 1,
1.619896, -0.3403742, 2.280581, 1, 1, 1, 1, 1,
1.627562, -0.5973973, 2.414463, 1, 1, 1, 1, 1,
1.630161, 0.8377009, 1.112524, 0, 0, 1, 1, 1,
1.633724, -0.1015701, 0.5740704, 1, 0, 0, 1, 1,
1.646906, 0.8656766, 1.674202, 1, 0, 0, 1, 1,
1.64766, -1.389563, 2.709865, 1, 0, 0, 1, 1,
1.66798, 0.7267016, 0.3414945, 1, 0, 0, 1, 1,
1.678187, 1.469169, 1.504291, 1, 0, 0, 1, 1,
1.679066, 0.03749288, 4.049615, 0, 0, 0, 1, 1,
1.684919, 0.9834253, 0.9691837, 0, 0, 0, 1, 1,
1.685649, 0.2204001, 0.9004858, 0, 0, 0, 1, 1,
1.709602, 1.740561, 0.626952, 0, 0, 0, 1, 1,
1.722728, 0.9946588, 2.017661, 0, 0, 0, 1, 1,
1.735188, -0.270658, 0.9472955, 0, 0, 0, 1, 1,
1.735839, 0.09858753, 2.377276, 0, 0, 0, 1, 1,
1.751287, -1.124435, 3.295807, 1, 1, 1, 1, 1,
1.756922, -0.08683706, 1.0143, 1, 1, 1, 1, 1,
1.758279, -0.2960028, 3.164113, 1, 1, 1, 1, 1,
1.783163, -1.644832, 2.68799, 1, 1, 1, 1, 1,
1.791981, -1.717915, 3.885712, 1, 1, 1, 1, 1,
1.820199, 0.08222278, 2.336784, 1, 1, 1, 1, 1,
1.833813, -0.8015189, 3.239922, 1, 1, 1, 1, 1,
1.859106, 0.8577799, 0.4986334, 1, 1, 1, 1, 1,
1.877709, -0.4874735, 1.135953, 1, 1, 1, 1, 1,
1.893731, -1.024994, 2.5168, 1, 1, 1, 1, 1,
1.898778, -0.401178, 2.243422, 1, 1, 1, 1, 1,
1.910115, -0.4100932, 1.324058, 1, 1, 1, 1, 1,
1.918176, -2.100415, 3.042392, 1, 1, 1, 1, 1,
1.942696, -1.473105, 3.708921, 1, 1, 1, 1, 1,
1.94911, -0.5649378, 1.359267, 1, 1, 1, 1, 1,
1.956529, -0.9355018, 2.570166, 0, 0, 1, 1, 1,
1.969007, 0.01861505, 2.769277, 1, 0, 0, 1, 1,
2.003185, 0.742557, 3.682682, 1, 0, 0, 1, 1,
2.102209, 0.7995052, 1.708888, 1, 0, 0, 1, 1,
2.119642, 0.4145816, 0.05738242, 1, 0, 0, 1, 1,
2.167424, 0.8583288, 2.775853, 1, 0, 0, 1, 1,
2.192216, -0.4389141, -0.1444429, 0, 0, 0, 1, 1,
2.212167, -0.5417168, 2.600798, 0, 0, 0, 1, 1,
2.245218, 1.257921, 1.52721, 0, 0, 0, 1, 1,
2.269116, 0.5303795, 1.829028, 0, 0, 0, 1, 1,
2.27843, -1.899704, 0.8171347, 0, 0, 0, 1, 1,
2.315616, 0.5387178, 1.905967, 0, 0, 0, 1, 1,
2.359888, 1.203153, 1.438029, 0, 0, 0, 1, 1,
2.45233, 1.357373, 1.721011, 1, 1, 1, 1, 1,
2.572289, 0.4477057, 0.7616442, 1, 1, 1, 1, 1,
2.872322, 1.221636, 1.76011, 1, 1, 1, 1, 1,
2.89527, -1.326634, 2.198203, 1, 1, 1, 1, 1,
2.977214, 2.526998, 3.087486, 1, 1, 1, 1, 1,
3.089736, 0.5017526, 1.63617, 1, 1, 1, 1, 1,
3.387292, -0.3948118, 1.56976, 1, 1, 1, 1, 1
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
var radius = 9.667089;
var distance = 33.95524;
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
mvMatrix.translate( 0.272613, -0.1105568, 0.03993225 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.95524);
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
