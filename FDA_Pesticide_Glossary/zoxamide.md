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
-2.949677, 0.0515622, -2.073776, 1, 0, 0, 1,
-2.796115, 0.63782, -1.826135, 1, 0.007843138, 0, 1,
-2.760983, -0.3306071, -2.157866, 1, 0.01176471, 0, 1,
-2.370736, 0.9762635, -1.01374, 1, 0.01960784, 0, 1,
-2.273738, -0.4363003, -2.703254, 1, 0.02352941, 0, 1,
-2.202992, -2.028957, -2.49235, 1, 0.03137255, 0, 1,
-2.192624, -0.2126001, -2.039708, 1, 0.03529412, 0, 1,
-2.162433, -0.7772985, -1.90163, 1, 0.04313726, 0, 1,
-2.150609, 2.022927, -1.544794, 1, 0.04705882, 0, 1,
-2.125639, -1.519474, -3.944772, 1, 0.05490196, 0, 1,
-2.121551, 0.6715614, -0.2306016, 1, 0.05882353, 0, 1,
-2.109421, -0.9759251, -2.920981, 1, 0.06666667, 0, 1,
-2.098905, 0.5646948, -1.157473, 1, 0.07058824, 0, 1,
-2.085855, -0.1361645, 0.03042145, 1, 0.07843138, 0, 1,
-2.044804, -0.04216713, -0.5651885, 1, 0.08235294, 0, 1,
-2.027566, -1.025918, -1.28172, 1, 0.09019608, 0, 1,
-2.026486, 0.9940466, -0.8551996, 1, 0.09411765, 0, 1,
-2.021184, 0.265944, -2.132261, 1, 0.1019608, 0, 1,
-2.007538, -0.1670277, -1.374018, 1, 0.1098039, 0, 1,
-1.988091, -1.656717, -0.5396709, 1, 0.1137255, 0, 1,
-1.937258, -0.9224585, -1.766238, 1, 0.1215686, 0, 1,
-1.92937, -2.205023, -1.679146, 1, 0.1254902, 0, 1,
-1.888081, 1.039687, -2.345356, 1, 0.1333333, 0, 1,
-1.884145, 0.857294, -0.7293178, 1, 0.1372549, 0, 1,
-1.880199, -0.4552601, -0.9695156, 1, 0.145098, 0, 1,
-1.872322, 0.2278618, -0.3537631, 1, 0.1490196, 0, 1,
-1.860705, -0.5668449, -1.176062, 1, 0.1568628, 0, 1,
-1.853088, 1.407191, -0.04492911, 1, 0.1607843, 0, 1,
-1.804017, 0.8778713, 1.192298, 1, 0.1686275, 0, 1,
-1.801527, -0.4306464, -1.885742, 1, 0.172549, 0, 1,
-1.788656, 1.582533, -1.961833, 1, 0.1803922, 0, 1,
-1.772138, -3.462578, -1.452679, 1, 0.1843137, 0, 1,
-1.765624, -0.7173839, -0.7137204, 1, 0.1921569, 0, 1,
-1.75618, 0.5231949, -0.7996361, 1, 0.1960784, 0, 1,
-1.697108, 0.7037348, -1.002182, 1, 0.2039216, 0, 1,
-1.696028, -0.2926356, -2.076033, 1, 0.2117647, 0, 1,
-1.670701, 0.7509042, -2.50611, 1, 0.2156863, 0, 1,
-1.657464, -0.5702929, -4.013107, 1, 0.2235294, 0, 1,
-1.63688, 1.612728, -0.6764361, 1, 0.227451, 0, 1,
-1.629705, 2.04808, -2.359494, 1, 0.2352941, 0, 1,
-1.623862, -0.5859143, -2.099708, 1, 0.2392157, 0, 1,
-1.621599, 1.630533, -0.5297399, 1, 0.2470588, 0, 1,
-1.600184, 1.234367, -0.6988803, 1, 0.2509804, 0, 1,
-1.592582, 0.4734162, -0.7812324, 1, 0.2588235, 0, 1,
-1.588829, 1.6162, -0.6577666, 1, 0.2627451, 0, 1,
-1.578576, -0.02931717, -1.707168, 1, 0.2705882, 0, 1,
-1.564968, 1.668663, -1.01693, 1, 0.2745098, 0, 1,
-1.562021, -0.3219599, -2.467407, 1, 0.282353, 0, 1,
-1.554781, -0.7727053, -1.209787, 1, 0.2862745, 0, 1,
-1.552413, -1.318477, -1.474059, 1, 0.2941177, 0, 1,
-1.535286, 0.1939122, -1.818372, 1, 0.3019608, 0, 1,
-1.533602, 0.05267248, -1.996867, 1, 0.3058824, 0, 1,
-1.527846, -0.6168135, -1.419608, 1, 0.3137255, 0, 1,
-1.526439, 1.235449, -1.269442, 1, 0.3176471, 0, 1,
-1.525978, 1.163381, -0.7211607, 1, 0.3254902, 0, 1,
-1.511073, -0.09378985, -2.117555, 1, 0.3294118, 0, 1,
-1.507635, -1.112063, -2.023129, 1, 0.3372549, 0, 1,
-1.504415, 0.9628323, -2.135751, 1, 0.3411765, 0, 1,
-1.482996, 0.9606988, -2.333198, 1, 0.3490196, 0, 1,
-1.478536, -0.1663285, -2.32882, 1, 0.3529412, 0, 1,
-1.471222, 0.9961315, -0.7854844, 1, 0.3607843, 0, 1,
-1.465166, 0.6357951, 0.7140523, 1, 0.3647059, 0, 1,
-1.46099, -0.0207493, -1.806315, 1, 0.372549, 0, 1,
-1.446091, 0.6345625, -3.067965, 1, 0.3764706, 0, 1,
-1.441178, -0.1595089, -0.7589853, 1, 0.3843137, 0, 1,
-1.438582, -1.74863, -2.247412, 1, 0.3882353, 0, 1,
-1.432539, -0.8171626, -2.314253, 1, 0.3960784, 0, 1,
-1.419745, 0.09033967, -1.542905, 1, 0.4039216, 0, 1,
-1.405864, 1.289924, -1.085863, 1, 0.4078431, 0, 1,
-1.402552, 0.4734985, -1.426, 1, 0.4156863, 0, 1,
-1.401606, 0.2644978, -1.73123, 1, 0.4196078, 0, 1,
-1.385753, 0.1931971, -0.2520646, 1, 0.427451, 0, 1,
-1.384645, -0.3992434, -1.762417, 1, 0.4313726, 0, 1,
-1.38356, 0.5235439, -1.273934, 1, 0.4392157, 0, 1,
-1.378747, 0.8220184, -1.148561, 1, 0.4431373, 0, 1,
-1.377795, -0.431835, 0.1044392, 1, 0.4509804, 0, 1,
-1.36811, 0.6093014, -1.941808, 1, 0.454902, 0, 1,
-1.355568, 0.5625032, -0.6123365, 1, 0.4627451, 0, 1,
-1.346911, 1.344312, -1.490242, 1, 0.4666667, 0, 1,
-1.346315, 0.960223, -2.737268, 1, 0.4745098, 0, 1,
-1.328422, -2.773712, -3.612198, 1, 0.4784314, 0, 1,
-1.328005, 1.528887, -0.06536156, 1, 0.4862745, 0, 1,
-1.32416, -0.9884098, -2.948106, 1, 0.4901961, 0, 1,
-1.319497, 0.8798338, -1.56005, 1, 0.4980392, 0, 1,
-1.317979, 0.7077443, -1.954879, 1, 0.5058824, 0, 1,
-1.316997, 0.7234531, 0.06150737, 1, 0.509804, 0, 1,
-1.312457, 1.862412, -1.836658, 1, 0.5176471, 0, 1,
-1.307364, 0.3708605, -3.052188, 1, 0.5215687, 0, 1,
-1.294638, 0.2099722, -1.115056, 1, 0.5294118, 0, 1,
-1.286607, 0.2095339, -2.16437, 1, 0.5333334, 0, 1,
-1.284666, -0.6610811, -1.463273, 1, 0.5411765, 0, 1,
-1.283545, -0.2163242, -1.771167, 1, 0.5450981, 0, 1,
-1.275657, -0.9975359, -1.78397, 1, 0.5529412, 0, 1,
-1.270519, -0.383625, -2.390536, 1, 0.5568628, 0, 1,
-1.265209, 0.212439, -1.671124, 1, 0.5647059, 0, 1,
-1.263837, -1.863019, -1.708926, 1, 0.5686275, 0, 1,
-1.259722, -0.4558175, 0.4159445, 1, 0.5764706, 0, 1,
-1.258257, -1.839839, -4.269024, 1, 0.5803922, 0, 1,
-1.257628, -0.3796864, -1.609835, 1, 0.5882353, 0, 1,
-1.255931, 0.7352214, -0.1057512, 1, 0.5921569, 0, 1,
-1.255034, 1.54244, -0.7801673, 1, 0.6, 0, 1,
-1.249653, -0.08226749, -0.4382127, 1, 0.6078432, 0, 1,
-1.247572, 0.06074364, 0.4954864, 1, 0.6117647, 0, 1,
-1.236036, -1.283401, -2.65964, 1, 0.6196079, 0, 1,
-1.235108, -0.7432467, -1.565113, 1, 0.6235294, 0, 1,
-1.22951, 0.9471355, 0.01150239, 1, 0.6313726, 0, 1,
-1.227385, 0.8991931, -1.228949, 1, 0.6352941, 0, 1,
-1.219597, -0.6765435, -2.064138, 1, 0.6431373, 0, 1,
-1.218271, -1.334933, -4.036992, 1, 0.6470588, 0, 1,
-1.212092, -0.4152638, -3.251821, 1, 0.654902, 0, 1,
-1.209775, 1.478922, -1.237872, 1, 0.6588235, 0, 1,
-1.208959, -1.232716, -2.316076, 1, 0.6666667, 0, 1,
-1.201791, 0.3870322, -0.8502123, 1, 0.6705883, 0, 1,
-1.191676, -0.05738487, 0.2611777, 1, 0.6784314, 0, 1,
-1.190211, -0.8230422, -1.259166, 1, 0.682353, 0, 1,
-1.189756, 1.221023, -1.03752, 1, 0.6901961, 0, 1,
-1.176017, -2.192563, -1.264391, 1, 0.6941177, 0, 1,
-1.170704, -1.429499, -1.919448, 1, 0.7019608, 0, 1,
-1.168625, -0.3113798, -1.190752, 1, 0.7098039, 0, 1,
-1.165318, -0.5180621, -2.18955, 1, 0.7137255, 0, 1,
-1.162899, -1.760607, -2.197441, 1, 0.7215686, 0, 1,
-1.159088, -0.5455521, -1.96921, 1, 0.7254902, 0, 1,
-1.151476, 0.9012654, -0.5402339, 1, 0.7333333, 0, 1,
-1.151199, -0.8114685, -2.416378, 1, 0.7372549, 0, 1,
-1.132043, -0.5977999, -2.614155, 1, 0.7450981, 0, 1,
-1.111124, -0.122072, -1.602191, 1, 0.7490196, 0, 1,
-1.110594, 0.1037884, -0.944405, 1, 0.7568628, 0, 1,
-1.10989, -0.1458223, -2.61483, 1, 0.7607843, 0, 1,
-1.108829, 0.04170964, -0.6049246, 1, 0.7686275, 0, 1,
-1.108146, -1.559716, -2.214215, 1, 0.772549, 0, 1,
-1.106191, -0.3585876, -2.500807, 1, 0.7803922, 0, 1,
-1.104555, -0.05152683, -1.209195, 1, 0.7843137, 0, 1,
-1.097378, 1.143317, 0.01505106, 1, 0.7921569, 0, 1,
-1.096289, -0.5881291, -2.12531, 1, 0.7960784, 0, 1,
-1.094159, 0.5926741, -1.023458, 1, 0.8039216, 0, 1,
-1.093846, -0.1176659, -2.618887, 1, 0.8117647, 0, 1,
-1.091987, 0.145843, -1.106411, 1, 0.8156863, 0, 1,
-1.091618, 0.3613323, -1.8534, 1, 0.8235294, 0, 1,
-1.090459, 0.4955564, -2.344667, 1, 0.827451, 0, 1,
-1.089353, -0.3709258, -1.898866, 1, 0.8352941, 0, 1,
-1.086994, -0.2896097, -0.2778658, 1, 0.8392157, 0, 1,
-1.084954, -0.8656564, -3.796922, 1, 0.8470588, 0, 1,
-1.080918, -1.975712, -2.33104, 1, 0.8509804, 0, 1,
-1.071794, -0.2837385, -1.521311, 1, 0.8588235, 0, 1,
-1.071487, 0.7632644, -0.8746684, 1, 0.8627451, 0, 1,
-1.06389, 1.753544, -0.7286144, 1, 0.8705882, 0, 1,
-1.055615, -0.6474167, -1.731736, 1, 0.8745098, 0, 1,
-1.0497, -1.127308, -0.9713628, 1, 0.8823529, 0, 1,
-1.049601, 0.3983778, -1.29338, 1, 0.8862745, 0, 1,
-1.046239, -0.5123156, -3.679266, 1, 0.8941177, 0, 1,
-1.031105, 0.3205682, -1.533447, 1, 0.8980392, 0, 1,
-1.027847, 0.7911728, -0.05590073, 1, 0.9058824, 0, 1,
-1.025735, 0.4206199, -0.3152378, 1, 0.9137255, 0, 1,
-1.016414, -0.5086759, -1.103006, 1, 0.9176471, 0, 1,
-1.014654, 0.01892003, -0.8028126, 1, 0.9254902, 0, 1,
-1.012149, -0.9378701, -2.043791, 1, 0.9294118, 0, 1,
-1.004847, 1.190679, 0.1354798, 1, 0.9372549, 0, 1,
-0.9983975, 0.5086247, -2.67698, 1, 0.9411765, 0, 1,
-0.9982668, -0.3783993, -0.7274495, 1, 0.9490196, 0, 1,
-0.9934194, 0.7980973, -0.4321866, 1, 0.9529412, 0, 1,
-0.9934053, -1.02338, -3.654387, 1, 0.9607843, 0, 1,
-0.9872319, -2.415865, -1.428551, 1, 0.9647059, 0, 1,
-0.9864278, -1.13687, -5.489566, 1, 0.972549, 0, 1,
-0.9839666, 0.81868, 0.2078736, 1, 0.9764706, 0, 1,
-0.9823409, 1.514054, -1.772268, 1, 0.9843137, 0, 1,
-0.9815843, 0.7649451, -0.8296641, 1, 0.9882353, 0, 1,
-0.9779257, -0.6162019, -2.412254, 1, 0.9960784, 0, 1,
-0.9733026, -2.488277, -3.009361, 0.9960784, 1, 0, 1,
-0.9583369, -0.6163905, -0.7770263, 0.9921569, 1, 0, 1,
-0.9582752, 0.08506587, 0.08647902, 0.9843137, 1, 0, 1,
-0.9551532, -0.4399278, -0.6181206, 0.9803922, 1, 0, 1,
-0.9550333, -0.6865644, -1.93098, 0.972549, 1, 0, 1,
-0.954441, -1.369725, -1.83093, 0.9686275, 1, 0, 1,
-0.9488618, 0.08230932, -0.9227971, 0.9607843, 1, 0, 1,
-0.9476991, 0.5583459, -0.9320915, 0.9568627, 1, 0, 1,
-0.9473184, -0.06517036, -1.937027, 0.9490196, 1, 0, 1,
-0.9408028, 0.01462175, -1.018496, 0.945098, 1, 0, 1,
-0.9380069, -1.874889, -3.8392, 0.9372549, 1, 0, 1,
-0.9353364, 0.6112093, -0.00212224, 0.9333333, 1, 0, 1,
-0.9307944, -0.4033292, -1.432515, 0.9254902, 1, 0, 1,
-0.9262352, 1.494681, -0.4979457, 0.9215686, 1, 0, 1,
-0.921852, -1.732388, -1.470808, 0.9137255, 1, 0, 1,
-0.9200187, 1.09954, -0.7616116, 0.9098039, 1, 0, 1,
-0.9167765, 0.2268137, -1.058555, 0.9019608, 1, 0, 1,
-0.9166063, 0.9481089, -0.8650125, 0.8941177, 1, 0, 1,
-0.9112469, -1.817738, -2.359154, 0.8901961, 1, 0, 1,
-0.9077755, 0.9851403, -1.276289, 0.8823529, 1, 0, 1,
-0.9075637, 0.02354672, -1.767156, 0.8784314, 1, 0, 1,
-0.9028525, 1.214024, -1.875993, 0.8705882, 1, 0, 1,
-0.9015529, 0.1496376, -1.038347, 0.8666667, 1, 0, 1,
-0.8977299, 0.2241406, -0.5708945, 0.8588235, 1, 0, 1,
-0.897535, 0.5707372, -1.824879, 0.854902, 1, 0, 1,
-0.8953103, -0.9077603, -3.8949, 0.8470588, 1, 0, 1,
-0.8889937, -1.808494, -3.854061, 0.8431373, 1, 0, 1,
-0.8881099, 1.231501, -1.142333, 0.8352941, 1, 0, 1,
-0.8752956, 0.7240409, -1.915436, 0.8313726, 1, 0, 1,
-0.8751605, -0.2610852, -0.5927298, 0.8235294, 1, 0, 1,
-0.8696355, -1.143788, -2.466645, 0.8196079, 1, 0, 1,
-0.8656294, 0.838192, -0.8455423, 0.8117647, 1, 0, 1,
-0.8636683, -0.2575718, -1.02195, 0.8078431, 1, 0, 1,
-0.8604279, 1.066194, -1.47029, 0.8, 1, 0, 1,
-0.8595105, 0.2393997, -2.803528, 0.7921569, 1, 0, 1,
-0.8591071, 0.002969301, -0.9691916, 0.7882353, 1, 0, 1,
-0.858533, 0.7169532, -0.03130131, 0.7803922, 1, 0, 1,
-0.8533087, 0.4661541, -1.036256, 0.7764706, 1, 0, 1,
-0.8527534, 0.4832134, -1.517268, 0.7686275, 1, 0, 1,
-0.8499738, 1.986785, 0.7449809, 0.7647059, 1, 0, 1,
-0.8494179, 0.4587829, -0.8535458, 0.7568628, 1, 0, 1,
-0.8420497, 0.9757352, -0.1493658, 0.7529412, 1, 0, 1,
-0.8399816, -2.513507, -0.7204527, 0.7450981, 1, 0, 1,
-0.8341932, 0.3702428, 0.81263, 0.7411765, 1, 0, 1,
-0.8326589, 1.177148, -0.3700314, 0.7333333, 1, 0, 1,
-0.8304477, 1.435148, 1.434958, 0.7294118, 1, 0, 1,
-0.8269315, -1.273971, -2.26647, 0.7215686, 1, 0, 1,
-0.8267899, -0.06544805, -1.689713, 0.7176471, 1, 0, 1,
-0.8256918, 1.778986, -2.513998, 0.7098039, 1, 0, 1,
-0.8205422, -0.2305719, -0.6888698, 0.7058824, 1, 0, 1,
-0.8137012, 0.8712096, 0.03451223, 0.6980392, 1, 0, 1,
-0.8095745, 1.514462, 0.7332128, 0.6901961, 1, 0, 1,
-0.8078243, -0.1575516, -0.4862994, 0.6862745, 1, 0, 1,
-0.8043984, 1.944441, -1.185651, 0.6784314, 1, 0, 1,
-0.8011689, 0.1073607, -1.995142, 0.6745098, 1, 0, 1,
-0.7971945, -0.9653576, -1.789025, 0.6666667, 1, 0, 1,
-0.7965835, -0.78491, -0.9238945, 0.6627451, 1, 0, 1,
-0.7899536, -0.3289822, -1.652629, 0.654902, 1, 0, 1,
-0.7899395, 0.6740096, -0.7802805, 0.6509804, 1, 0, 1,
-0.7892406, 1.109335, -0.06103082, 0.6431373, 1, 0, 1,
-0.7872078, 1.613077, -2.021353, 0.6392157, 1, 0, 1,
-0.7857126, -1.54999, -4.83181, 0.6313726, 1, 0, 1,
-0.777244, -1.075892, -0.9939436, 0.627451, 1, 0, 1,
-0.7770878, 0.04554955, -0.4014091, 0.6196079, 1, 0, 1,
-0.7718181, -0.2529339, -2.174515, 0.6156863, 1, 0, 1,
-0.7701189, 0.9701597, -1.26068, 0.6078432, 1, 0, 1,
-0.768491, -1.710915, -3.974873, 0.6039216, 1, 0, 1,
-0.7650156, -0.8003904, -0.6827241, 0.5960785, 1, 0, 1,
-0.7634466, 1.072614, -1.509963, 0.5882353, 1, 0, 1,
-0.7606152, -0.869, -3.485265, 0.5843138, 1, 0, 1,
-0.7564839, -1.633891, -2.011111, 0.5764706, 1, 0, 1,
-0.7548876, -1.537191, -3.39761, 0.572549, 1, 0, 1,
-0.754352, 1.676605, -0.4713573, 0.5647059, 1, 0, 1,
-0.7460927, 0.9656433, 0.2264291, 0.5607843, 1, 0, 1,
-0.7449801, 1.513327, -1.055951, 0.5529412, 1, 0, 1,
-0.7419629, 0.1008244, -2.052826, 0.5490196, 1, 0, 1,
-0.7417945, -0.7288681, -1.740669, 0.5411765, 1, 0, 1,
-0.7403831, 0.7509575, -2.343203, 0.5372549, 1, 0, 1,
-0.7400445, -1.574473, -3.220325, 0.5294118, 1, 0, 1,
-0.7369272, -0.07989747, -2.647568, 0.5254902, 1, 0, 1,
-0.7302489, -0.2156549, -2.83846, 0.5176471, 1, 0, 1,
-0.7261669, 0.6070877, -0.5798339, 0.5137255, 1, 0, 1,
-0.7230008, 0.1122484, -1.578161, 0.5058824, 1, 0, 1,
-0.7167997, 0.04394033, -0.08415774, 0.5019608, 1, 0, 1,
-0.7060544, 0.06506443, -2.359626, 0.4941176, 1, 0, 1,
-0.7035105, 0.8469806, -1.36552, 0.4862745, 1, 0, 1,
-0.7008291, 1.671224, -0.587707, 0.4823529, 1, 0, 1,
-0.6980503, -2.666936, -3.39706, 0.4745098, 1, 0, 1,
-0.6916212, -1.57963, -2.667125, 0.4705882, 1, 0, 1,
-0.6897362, -0.1203521, -2.564961, 0.4627451, 1, 0, 1,
-0.6874589, -0.1908476, -0.2169698, 0.4588235, 1, 0, 1,
-0.6846658, 1.009462, -2.440792, 0.4509804, 1, 0, 1,
-0.6827059, 0.7340214, -0.04585963, 0.4470588, 1, 0, 1,
-0.6818574, 0.9834267, -0.06460233, 0.4392157, 1, 0, 1,
-0.6759141, -0.9173675, -3.612415, 0.4352941, 1, 0, 1,
-0.6741554, 0.6692758, 0.8106315, 0.427451, 1, 0, 1,
-0.6705711, -0.9553022, -2.857684, 0.4235294, 1, 0, 1,
-0.6634918, -0.01516219, -2.701515, 0.4156863, 1, 0, 1,
-0.6600204, -1.160329, -1.661481, 0.4117647, 1, 0, 1,
-0.6593385, 0.2878031, -0.4892048, 0.4039216, 1, 0, 1,
-0.6592237, 1.470489, -1.832646, 0.3960784, 1, 0, 1,
-0.6513133, 0.07561695, -1.564074, 0.3921569, 1, 0, 1,
-0.6446042, 0.3040785, -0.09768096, 0.3843137, 1, 0, 1,
-0.6411945, -0.6117793, -2.594408, 0.3803922, 1, 0, 1,
-0.6356618, 1.188147, 2.095122, 0.372549, 1, 0, 1,
-0.6336626, -0.003210128, -0.5324464, 0.3686275, 1, 0, 1,
-0.633478, 0.5816072, 0.3546684, 0.3607843, 1, 0, 1,
-0.6292749, -1.093658, -2.314393, 0.3568628, 1, 0, 1,
-0.6277, 1.139099, -2.168719, 0.3490196, 1, 0, 1,
-0.621412, -0.7955548, -2.079604, 0.345098, 1, 0, 1,
-0.6202829, -1.424112, -2.392147, 0.3372549, 1, 0, 1,
-0.6201658, -0.1633725, -2.73607, 0.3333333, 1, 0, 1,
-0.619317, 0.4945736, -0.6204777, 0.3254902, 1, 0, 1,
-0.6182778, 0.4081821, -2.782689, 0.3215686, 1, 0, 1,
-0.6148015, 2.436122, 0.005685094, 0.3137255, 1, 0, 1,
-0.6121858, -0.7676002, 0.7719831, 0.3098039, 1, 0, 1,
-0.608124, -0.3577994, -2.360291, 0.3019608, 1, 0, 1,
-0.6069796, 1.113905, -0.4160851, 0.2941177, 1, 0, 1,
-0.6069564, 0.7653979, 0.4805238, 0.2901961, 1, 0, 1,
-0.6053654, -0.5344796, -1.302092, 0.282353, 1, 0, 1,
-0.6044161, -0.5058512, -3.764082, 0.2784314, 1, 0, 1,
-0.5968722, -1.892164, -3.88566, 0.2705882, 1, 0, 1,
-0.5955319, -0.6542559, -1.421171, 0.2666667, 1, 0, 1,
-0.5858881, -0.8593901, -2.612296, 0.2588235, 1, 0, 1,
-0.5858535, 1.371641, 0.4942596, 0.254902, 1, 0, 1,
-0.5820539, -1.436283, -2.344278, 0.2470588, 1, 0, 1,
-0.5766664, -0.1392576, -1.930565, 0.2431373, 1, 0, 1,
-0.5722116, 0.2879362, -0.3221547, 0.2352941, 1, 0, 1,
-0.5702044, 2.025776, -1.221365, 0.2313726, 1, 0, 1,
-0.5641209, 0.1631949, -0.1253499, 0.2235294, 1, 0, 1,
-0.5639644, 0.02901955, -1.10389, 0.2196078, 1, 0, 1,
-0.5626709, -0.002119443, -1.961099, 0.2117647, 1, 0, 1,
-0.5587065, 0.5122344, -2.057465, 0.2078431, 1, 0, 1,
-0.551659, 1.385128, -1.47228, 0.2, 1, 0, 1,
-0.5450104, 0.7758396, -1.400716, 0.1921569, 1, 0, 1,
-0.5423471, -0.8868619, -3.539958, 0.1882353, 1, 0, 1,
-0.5396616, -1.232463, -3.23333, 0.1803922, 1, 0, 1,
-0.5337673, 2.044987, -0.5907902, 0.1764706, 1, 0, 1,
-0.5329178, -0.7530601, -2.487873, 0.1686275, 1, 0, 1,
-0.5326925, -1.239732, -1.039068, 0.1647059, 1, 0, 1,
-0.5191787, -0.828232, -2.927272, 0.1568628, 1, 0, 1,
-0.5190937, 0.2258918, -2.166226, 0.1529412, 1, 0, 1,
-0.5101866, -0.135851, -1.96805, 0.145098, 1, 0, 1,
-0.5016857, -0.03968438, -2.634312, 0.1411765, 1, 0, 1,
-0.5015422, -1.0031, -1.204263, 0.1333333, 1, 0, 1,
-0.4970235, 0.7029403, 0.5618618, 0.1294118, 1, 0, 1,
-0.4945737, 0.1669472, -0.7084398, 0.1215686, 1, 0, 1,
-0.4879189, -0.6103606, -2.846112, 0.1176471, 1, 0, 1,
-0.4808227, 0.1504437, -0.8219121, 0.1098039, 1, 0, 1,
-0.4754075, -0.4395998, -3.114259, 0.1058824, 1, 0, 1,
-0.4718984, -0.3890225, -1.482309, 0.09803922, 1, 0, 1,
-0.4634538, 0.1448247, 0.3098728, 0.09019608, 1, 0, 1,
-0.4629149, -0.2503104, -2.150994, 0.08627451, 1, 0, 1,
-0.4603319, -0.3377194, -3.743619, 0.07843138, 1, 0, 1,
-0.4568964, 1.048691, 0.2825105, 0.07450981, 1, 0, 1,
-0.4559528, -1.188877, -5.439095, 0.06666667, 1, 0, 1,
-0.4553006, -0.4160157, -2.048491, 0.0627451, 1, 0, 1,
-0.45501, 1.573919, -0.05909889, 0.05490196, 1, 0, 1,
-0.4543785, -0.04116839, -2.933207, 0.05098039, 1, 0, 1,
-0.4496303, -1.153447, -2.772309, 0.04313726, 1, 0, 1,
-0.448684, 0.3924375, -1.838193, 0.03921569, 1, 0, 1,
-0.4472012, -0.9577305, -1.713387, 0.03137255, 1, 0, 1,
-0.4469004, 1.374934, -1.031518, 0.02745098, 1, 0, 1,
-0.4430599, -2.067839, -1.972949, 0.01960784, 1, 0, 1,
-0.4381057, -0.104385, -1.548364, 0.01568628, 1, 0, 1,
-0.4378238, -0.6810089, -3.822756, 0.007843138, 1, 0, 1,
-0.4333195, 0.2265033, -0.7220064, 0.003921569, 1, 0, 1,
-0.4296518, -0.1296654, -3.384631, 0, 1, 0.003921569, 1,
-0.4288839, -0.006841907, -1.257887, 0, 1, 0.01176471, 1,
-0.4265867, -1.079997, -1.488487, 0, 1, 0.01568628, 1,
-0.424236, 1.279768, -0.7061317, 0, 1, 0.02352941, 1,
-0.4239276, 1.250918, -1.742439, 0, 1, 0.02745098, 1,
-0.4214542, -0.4835251, -1.719081, 0, 1, 0.03529412, 1,
-0.4172384, -0.9109015, -2.79998, 0, 1, 0.03921569, 1,
-0.4103107, 0.5726044, 0.7614894, 0, 1, 0.04705882, 1,
-0.4022035, 0.07046717, -3.023293, 0, 1, 0.05098039, 1,
-0.4009818, 0.6881526, -0.6003753, 0, 1, 0.05882353, 1,
-0.3981226, -1.332517, -3.065264, 0, 1, 0.0627451, 1,
-0.3940314, -0.01208054, -1.524632, 0, 1, 0.07058824, 1,
-0.3937745, -1.434047, -4.196414, 0, 1, 0.07450981, 1,
-0.3919266, -0.5469128, -2.222358, 0, 1, 0.08235294, 1,
-0.3889606, -0.1235177, -2.522451, 0, 1, 0.08627451, 1,
-0.3846656, 0.9898334, -0.8809581, 0, 1, 0.09411765, 1,
-0.3819025, -1.189517, -2.665751, 0, 1, 0.1019608, 1,
-0.3795426, 0.07452992, -1.246858, 0, 1, 0.1058824, 1,
-0.3793993, -1.026677, -3.579328, 0, 1, 0.1137255, 1,
-0.3700036, 0.8195961, -0.8363485, 0, 1, 0.1176471, 1,
-0.3678562, 1.21063, 0.3508327, 0, 1, 0.1254902, 1,
-0.3675353, -0.3028423, -2.458069, 0, 1, 0.1294118, 1,
-0.365742, -0.007081135, -0.4009959, 0, 1, 0.1372549, 1,
-0.3603022, 0.02595372, -2.172266, 0, 1, 0.1411765, 1,
-0.3545341, -0.8003578, -2.54454, 0, 1, 0.1490196, 1,
-0.3533834, -1.096569, -4.446023, 0, 1, 0.1529412, 1,
-0.3526249, 0.6884438, -0.4530879, 0, 1, 0.1607843, 1,
-0.3506584, 1.351758, -0.6918647, 0, 1, 0.1647059, 1,
-0.3479216, 0.4033035, -0.2012891, 0, 1, 0.172549, 1,
-0.3435615, -1.957651, -3.114552, 0, 1, 0.1764706, 1,
-0.3389167, -0.7722673, -4.69201, 0, 1, 0.1843137, 1,
-0.3280808, 0.2315622, -1.052184, 0, 1, 0.1882353, 1,
-0.3261529, 0.2047343, -1.353323, 0, 1, 0.1960784, 1,
-0.3224844, 1.379564, -2.316006, 0, 1, 0.2039216, 1,
-0.3224359, -0.9379326, -2.434284, 0, 1, 0.2078431, 1,
-0.3131099, -0.5009753, -1.692012, 0, 1, 0.2156863, 1,
-0.3115286, -0.9215516, -1.646731, 0, 1, 0.2196078, 1,
-0.3108394, -0.153349, -2.808604, 0, 1, 0.227451, 1,
-0.3090041, 1.356355, 0.2601906, 0, 1, 0.2313726, 1,
-0.3062722, 0.1273006, -1.840102, 0, 1, 0.2392157, 1,
-0.3060546, 1.044067, -3.27597, 0, 1, 0.2431373, 1,
-0.3031325, -0.3312995, -1.560687, 0, 1, 0.2509804, 1,
-0.2976616, -0.6624036, -3.415997, 0, 1, 0.254902, 1,
-0.2970562, -1.787766, -3.839827, 0, 1, 0.2627451, 1,
-0.2885637, -1.041957, -3.975344, 0, 1, 0.2666667, 1,
-0.286945, -1.141785, -2.933837, 0, 1, 0.2745098, 1,
-0.2850015, 0.6923022, -0.269329, 0, 1, 0.2784314, 1,
-0.2816264, -0.6228678, -0.6247304, 0, 1, 0.2862745, 1,
-0.2759493, -1.434235, -2.553975, 0, 1, 0.2901961, 1,
-0.2685772, -0.2051272, -1.707946, 0, 1, 0.2980392, 1,
-0.2642567, 0.7602978, 0.7877798, 0, 1, 0.3058824, 1,
-0.2642311, 0.1323202, 0.01308561, 0, 1, 0.3098039, 1,
-0.2627752, 1.512363, -1.864438, 0, 1, 0.3176471, 1,
-0.2579346, -0.9783242, -1.835861, 0, 1, 0.3215686, 1,
-0.2578222, -0.6704671, -2.547917, 0, 1, 0.3294118, 1,
-0.2533243, -0.3874461, -2.600715, 0, 1, 0.3333333, 1,
-0.2527118, 0.5360432, -0.5176484, 0, 1, 0.3411765, 1,
-0.2526851, 1.550377, 0.9085698, 0, 1, 0.345098, 1,
-0.2525047, 0.5297096, -1.427776, 0, 1, 0.3529412, 1,
-0.2519532, -0.5312139, -4.093005, 0, 1, 0.3568628, 1,
-0.2396099, 1.095722, 0.003866209, 0, 1, 0.3647059, 1,
-0.2379204, 0.5408973, -0.486253, 0, 1, 0.3686275, 1,
-0.230016, -1.60866, -2.562641, 0, 1, 0.3764706, 1,
-0.2280419, -0.6158218, -2.904973, 0, 1, 0.3803922, 1,
-0.2243236, 0.5443483, -1.732882, 0, 1, 0.3882353, 1,
-0.2241781, 0.7108313, 0.578095, 0, 1, 0.3921569, 1,
-0.2161244, 0.2301611, -1.860862, 0, 1, 0.4, 1,
-0.2141839, -1.520882, -3.511058, 0, 1, 0.4078431, 1,
-0.2099548, 0.4011575, -1.043097, 0, 1, 0.4117647, 1,
-0.2054841, -0.4658794, -1.250159, 0, 1, 0.4196078, 1,
-0.2051292, 0.08791925, 0.5595614, 0, 1, 0.4235294, 1,
-0.2029005, 0.1258963, -1.56765, 0, 1, 0.4313726, 1,
-0.2022034, 0.8250814, -1.105016, 0, 1, 0.4352941, 1,
-0.1981821, 0.9415486, 0.534776, 0, 1, 0.4431373, 1,
-0.1977244, -1.605207, -4.661958, 0, 1, 0.4470588, 1,
-0.1947072, -0.3422492, -3.384022, 0, 1, 0.454902, 1,
-0.1917534, -1.274959, -2.481048, 0, 1, 0.4588235, 1,
-0.1908894, -1.31459, -2.554498, 0, 1, 0.4666667, 1,
-0.1858753, 0.3071883, 0.5395196, 0, 1, 0.4705882, 1,
-0.1806202, -0.2536746, -1.305901, 0, 1, 0.4784314, 1,
-0.1800182, -0.04566991, -1.831954, 0, 1, 0.4823529, 1,
-0.1796622, 1.413074, -0.9434274, 0, 1, 0.4901961, 1,
-0.1761294, 0.06366056, -1.588332, 0, 1, 0.4941176, 1,
-0.1734671, -0.4309651, -1.720148, 0, 1, 0.5019608, 1,
-0.1714009, 1.442506, -0.7817126, 0, 1, 0.509804, 1,
-0.1683807, 1.087959, -0.2268471, 0, 1, 0.5137255, 1,
-0.1654637, -0.4195467, -2.858508, 0, 1, 0.5215687, 1,
-0.1630175, 0.3102299, 1.095289, 0, 1, 0.5254902, 1,
-0.1621912, -1.39547, -3.923402, 0, 1, 0.5333334, 1,
-0.160414, 0.7220517, 0.5687748, 0, 1, 0.5372549, 1,
-0.1558397, -0.6228775, -3.122276, 0, 1, 0.5450981, 1,
-0.1529175, -0.844235, -2.653137, 0, 1, 0.5490196, 1,
-0.1495958, 1.258767, -0.4519255, 0, 1, 0.5568628, 1,
-0.1485475, -0.09408336, -2.518778, 0, 1, 0.5607843, 1,
-0.1470717, -0.3467253, -3.466824, 0, 1, 0.5686275, 1,
-0.1459745, 0.5024126, 1.112153, 0, 1, 0.572549, 1,
-0.1446411, -2.024602, -4.501151, 0, 1, 0.5803922, 1,
-0.1445729, 1.044933, -0.5490023, 0, 1, 0.5843138, 1,
-0.1387775, -0.8543149, -2.425075, 0, 1, 0.5921569, 1,
-0.1379875, 1.154277, 1.82474, 0, 1, 0.5960785, 1,
-0.1371923, 0.9983946, 0.0548877, 0, 1, 0.6039216, 1,
-0.1365555, 0.7078421, -1.053301, 0, 1, 0.6117647, 1,
-0.1347986, -0.06793834, -0.9070699, 0, 1, 0.6156863, 1,
-0.134081, 1.432803, -1.013233, 0, 1, 0.6235294, 1,
-0.1298107, 0.3543405, -0.7827147, 0, 1, 0.627451, 1,
-0.1282994, -0.1889148, -2.920232, 0, 1, 0.6352941, 1,
-0.1217814, -1.357643, -1.577059, 0, 1, 0.6392157, 1,
-0.1168415, -0.5599166, -3.408811, 0, 1, 0.6470588, 1,
-0.1156389, 0.7110699, -0.08291601, 0, 1, 0.6509804, 1,
-0.1151318, 1.142425, 0.562953, 0, 1, 0.6588235, 1,
-0.1146285, 0.09424463, -0.3633687, 0, 1, 0.6627451, 1,
-0.1117881, -1.932708, -2.114312, 0, 1, 0.6705883, 1,
-0.1107923, -1.074988, -4.918515, 0, 1, 0.6745098, 1,
-0.09870487, -0.3808179, -2.101156, 0, 1, 0.682353, 1,
-0.09430384, 0.6777479, 0.9416562, 0, 1, 0.6862745, 1,
-0.0933814, -0.6100308, -4.046134, 0, 1, 0.6941177, 1,
-0.08728661, 1.065194, -1.397329, 0, 1, 0.7019608, 1,
-0.084245, 1.21431, -1.695051, 0, 1, 0.7058824, 1,
-0.07400607, -1.110899, -2.918406, 0, 1, 0.7137255, 1,
-0.07314558, -1.770345, -1.87334, 0, 1, 0.7176471, 1,
-0.07295042, 0.8926402, 0.2291244, 0, 1, 0.7254902, 1,
-0.07044059, 0.5517674, -0.01873801, 0, 1, 0.7294118, 1,
-0.07013386, -1.564928, -2.561984, 0, 1, 0.7372549, 1,
-0.06601533, -0.4323976, -3.52669, 0, 1, 0.7411765, 1,
-0.06312343, 1.543161, 1.215542, 0, 1, 0.7490196, 1,
-0.0584939, 0.7834548, -2.09775, 0, 1, 0.7529412, 1,
-0.03587988, 0.1251571, 2.045278, 0, 1, 0.7607843, 1,
-0.03503221, 0.784373, -0.8915811, 0, 1, 0.7647059, 1,
-0.03129953, 1.089065, -1.058378, 0, 1, 0.772549, 1,
-0.02975934, 1.184882, -0.609498, 0, 1, 0.7764706, 1,
-0.02862418, -1.086346, -3.420503, 0, 1, 0.7843137, 1,
-0.02537692, 0.5543108, 1.278828, 0, 1, 0.7882353, 1,
-0.02252519, -0.5126953, -1.97299, 0, 1, 0.7960784, 1,
-0.02161012, -0.8876407, -2.198448, 0, 1, 0.8039216, 1,
-0.0196193, -0.06278478, -1.249662, 0, 1, 0.8078431, 1,
-0.01921489, 1.026676, -0.8107471, 0, 1, 0.8156863, 1,
-0.01542885, -0.6361858, -4.423804, 0, 1, 0.8196079, 1,
-0.01176783, 0.8571399, -1.020848, 0, 1, 0.827451, 1,
-0.008118813, 0.554555, 0.3046691, 0, 1, 0.8313726, 1,
-0.004094403, 0.3290634, -0.1936216, 0, 1, 0.8392157, 1,
-0.0008650656, 0.2992975, 1.191285, 0, 1, 0.8431373, 1,
0.005890333, -0.3732219, 3.684061, 0, 1, 0.8509804, 1,
0.006146585, -0.1300141, 3.451778, 0, 1, 0.854902, 1,
0.006601836, -0.8257003, 4.581094, 0, 1, 0.8627451, 1,
0.009403078, 1.34642, -2.372092, 0, 1, 0.8666667, 1,
0.009969742, -0.4076722, 2.985841, 0, 1, 0.8745098, 1,
0.01015825, 0.3354891, -0.2391185, 0, 1, 0.8784314, 1,
0.01825589, 0.8634151, -0.7052077, 0, 1, 0.8862745, 1,
0.02097284, 0.4731175, 0.4032658, 0, 1, 0.8901961, 1,
0.0242738, -0.7949736, 4.788156, 0, 1, 0.8980392, 1,
0.03028863, 0.8968238, -0.5207738, 0, 1, 0.9058824, 1,
0.03294251, 1.510856, -0.5914834, 0, 1, 0.9098039, 1,
0.03456647, 0.6176144, 0.2789015, 0, 1, 0.9176471, 1,
0.03538012, -0.3543377, 3.188809, 0, 1, 0.9215686, 1,
0.03666651, 1.17406, 2.41537, 0, 1, 0.9294118, 1,
0.03686216, -1.006939, 5.357016, 0, 1, 0.9333333, 1,
0.03967603, -1.936494, 1.822487, 0, 1, 0.9411765, 1,
0.04066254, 0.023149, -0.3412813, 0, 1, 0.945098, 1,
0.04125831, -1.287928, 4.90225, 0, 1, 0.9529412, 1,
0.04129954, 1.705873, -0.1017365, 0, 1, 0.9568627, 1,
0.04805136, 1.037407, -1.507542, 0, 1, 0.9647059, 1,
0.05754549, 0.7061347, -0.004242793, 0, 1, 0.9686275, 1,
0.06096103, 1.805503, 1.176412, 0, 1, 0.9764706, 1,
0.06308731, -1.037623, 4.123898, 0, 1, 0.9803922, 1,
0.0635545, -1.428112, 2.895979, 0, 1, 0.9882353, 1,
0.06466229, -0.5363386, 3.648711, 0, 1, 0.9921569, 1,
0.06847281, -1.601995, 4.974725, 0, 1, 1, 1,
0.06870513, 0.1111835, 0.4255973, 0, 0.9921569, 1, 1,
0.07583303, 0.9877588, 1.699568, 0, 0.9882353, 1, 1,
0.07614646, -0.8491655, 3.31678, 0, 0.9803922, 1, 1,
0.08065394, 0.20865, -0.1016751, 0, 0.9764706, 1, 1,
0.08730269, -0.3992223, 3.821658, 0, 0.9686275, 1, 1,
0.08949633, -1.502657, 1.820801, 0, 0.9647059, 1, 1,
0.09061125, -1.032925, 4.194658, 0, 0.9568627, 1, 1,
0.09138348, 0.1553488, 0.7625079, 0, 0.9529412, 1, 1,
0.09579384, -0.4861678, 3.864677, 0, 0.945098, 1, 1,
0.1003189, -1.45924, 4.876248, 0, 0.9411765, 1, 1,
0.1047775, 0.4022463, 0.4684278, 0, 0.9333333, 1, 1,
0.1064699, -0.01783228, 0.9211474, 0, 0.9294118, 1, 1,
0.1095239, 0.2460332, -0.9635251, 0, 0.9215686, 1, 1,
0.1097756, 1.48668, 0.3677439, 0, 0.9176471, 1, 1,
0.1131503, -1.477817, 3.768367, 0, 0.9098039, 1, 1,
0.1140611, 0.5828244, 0.954819, 0, 0.9058824, 1, 1,
0.114893, 0.7028518, 0.2472846, 0, 0.8980392, 1, 1,
0.1157557, 1.574011, 0.8937261, 0, 0.8901961, 1, 1,
0.1164582, 0.432958, 0.9886667, 0, 0.8862745, 1, 1,
0.1173445, -0.3025301, 1.951909, 0, 0.8784314, 1, 1,
0.1186588, -1.076877, 3.021533, 0, 0.8745098, 1, 1,
0.1222152, -0.5312967, 2.605446, 0, 0.8666667, 1, 1,
0.1237974, 0.2360254, -0.163778, 0, 0.8627451, 1, 1,
0.126492, 0.7279735, 0.2792875, 0, 0.854902, 1, 1,
0.1315043, 2.016115, 2.109046, 0, 0.8509804, 1, 1,
0.1328026, 0.6212016, 0.1603392, 0, 0.8431373, 1, 1,
0.1353075, -0.461551, 2.214293, 0, 0.8392157, 1, 1,
0.1360951, -0.8176183, 2.448915, 0, 0.8313726, 1, 1,
0.1374313, 0.4272434, 0.8882447, 0, 0.827451, 1, 1,
0.1376927, 0.1180602, -0.6630718, 0, 0.8196079, 1, 1,
0.1392037, 0.2860917, -0.08148643, 0, 0.8156863, 1, 1,
0.1420778, -0.01739515, 0.8195353, 0, 0.8078431, 1, 1,
0.1427353, -0.09399319, 3.433975, 0, 0.8039216, 1, 1,
0.1442008, -1.786202, 2.568029, 0, 0.7960784, 1, 1,
0.1458833, 0.4077131, 0.6473418, 0, 0.7882353, 1, 1,
0.1480954, 1.176151, 0.676103, 0, 0.7843137, 1, 1,
0.1500585, -0.3048104, 2.334173, 0, 0.7764706, 1, 1,
0.1513861, -0.3238924, 3.555726, 0, 0.772549, 1, 1,
0.1524977, 0.1444168, 1.626287, 0, 0.7647059, 1, 1,
0.1619982, 0.07588168, -0.1158675, 0, 0.7607843, 1, 1,
0.1680461, -1.208033, 3.22487, 0, 0.7529412, 1, 1,
0.1704793, -1.201614, 3.375321, 0, 0.7490196, 1, 1,
0.1716128, -1.435027, 2.520777, 0, 0.7411765, 1, 1,
0.1733049, -0.8240638, 4.780785, 0, 0.7372549, 1, 1,
0.1742076, 0.1899569, 0.2877371, 0, 0.7294118, 1, 1,
0.1756352, 0.5663829, 0.5474106, 0, 0.7254902, 1, 1,
0.1790789, -0.314535, 2.53245, 0, 0.7176471, 1, 1,
0.1822357, -2.411391, 3.34071, 0, 0.7137255, 1, 1,
0.1828047, -0.4857943, 4.234308, 0, 0.7058824, 1, 1,
0.1828422, -0.9953994, 4.077623, 0, 0.6980392, 1, 1,
0.1830564, 0.7730844, 0.06059235, 0, 0.6941177, 1, 1,
0.1842291, -2.519672, 3.513636, 0, 0.6862745, 1, 1,
0.1857746, -0.6725511, 3.649303, 0, 0.682353, 1, 1,
0.1857924, 1.847963, 0.374761, 0, 0.6745098, 1, 1,
0.1859357, -0.00368931, 2.811846, 0, 0.6705883, 1, 1,
0.1861756, 1.392418, 0.8981133, 0, 0.6627451, 1, 1,
0.1864993, 0.7636796, 0.146179, 0, 0.6588235, 1, 1,
0.1882888, -0.3924635, 3.370801, 0, 0.6509804, 1, 1,
0.188349, -0.374472, 4.521947, 0, 0.6470588, 1, 1,
0.1901608, 0.5892593, 0.8621017, 0, 0.6392157, 1, 1,
0.1914935, -1.493062, 1.96024, 0, 0.6352941, 1, 1,
0.1917934, -0.5620068, 3.469268, 0, 0.627451, 1, 1,
0.192415, -1.024797, 3.6076, 0, 0.6235294, 1, 1,
0.1938629, -0.499642, 2.467256, 0, 0.6156863, 1, 1,
0.1962112, -1.127053, 5.065304, 0, 0.6117647, 1, 1,
0.1966436, -0.2820056, 1.802416, 0, 0.6039216, 1, 1,
0.1966761, -0.9875516, 2.174356, 0, 0.5960785, 1, 1,
0.1978626, 0.1644022, 1.189325, 0, 0.5921569, 1, 1,
0.1993815, -0.2794464, 3.619572, 0, 0.5843138, 1, 1,
0.2004629, -2.307644, 2.703332, 0, 0.5803922, 1, 1,
0.2047256, 0.9849933, 1.92475, 0, 0.572549, 1, 1,
0.2047256, 0.6360713, -0.2583648, 0, 0.5686275, 1, 1,
0.2051562, -0.9406718, 3.396338, 0, 0.5607843, 1, 1,
0.2062328, -0.3805775, 1.761943, 0, 0.5568628, 1, 1,
0.209372, -2.21593, 3.191071, 0, 0.5490196, 1, 1,
0.2133608, 0.6522557, -0.4331861, 0, 0.5450981, 1, 1,
0.2139995, -0.2971847, 1.243046, 0, 0.5372549, 1, 1,
0.2197444, 0.1872394, -0.02836801, 0, 0.5333334, 1, 1,
0.2198325, 1.209462, 0.2976987, 0, 0.5254902, 1, 1,
0.2218649, 0.4329865, 1.674788, 0, 0.5215687, 1, 1,
0.2242761, 0.7293792, 1.175727, 0, 0.5137255, 1, 1,
0.2291546, 0.8945324, -0.8576924, 0, 0.509804, 1, 1,
0.2417632, 0.9592013, 0.6716819, 0, 0.5019608, 1, 1,
0.2430193, -0.9094936, 1.947094, 0, 0.4941176, 1, 1,
0.2431365, -1.996259, 2.558994, 0, 0.4901961, 1, 1,
0.2459011, -1.025957, 3.878872, 0, 0.4823529, 1, 1,
0.2492653, -0.1206839, 3.779185, 0, 0.4784314, 1, 1,
0.2534352, 0.5371922, 0.2355561, 0, 0.4705882, 1, 1,
0.2537199, 0.8174139, 0.1818161, 0, 0.4666667, 1, 1,
0.2540179, -0.4302329, 2.817963, 0, 0.4588235, 1, 1,
0.2556977, 0.3689601, 0.4734076, 0, 0.454902, 1, 1,
0.2564918, 1.208279, 1.929174, 0, 0.4470588, 1, 1,
0.2599427, -1.084323, 3.483138, 0, 0.4431373, 1, 1,
0.261676, -0.2395512, 2.295246, 0, 0.4352941, 1, 1,
0.2629128, 0.1639442, 1.109919, 0, 0.4313726, 1, 1,
0.2656653, -0.889311, 3.110246, 0, 0.4235294, 1, 1,
0.2661455, -0.8175274, 3.293131, 0, 0.4196078, 1, 1,
0.2664598, 0.1316231, 2.298021, 0, 0.4117647, 1, 1,
0.2698911, -1.281405, 1.173234, 0, 0.4078431, 1, 1,
0.2721308, 1.034335, 0.1084951, 0, 0.4, 1, 1,
0.2738228, -0.7646464, 3.073064, 0, 0.3921569, 1, 1,
0.2797291, 0.9106219, -0.432714, 0, 0.3882353, 1, 1,
0.2827072, 0.5525081, 0.6939454, 0, 0.3803922, 1, 1,
0.2837728, -0.8598768, 4.203275, 0, 0.3764706, 1, 1,
0.2849117, 0.2860659, 1.439451, 0, 0.3686275, 1, 1,
0.2855537, -0.3552818, 1.664972, 0, 0.3647059, 1, 1,
0.2889966, -1.196717, 2.988859, 0, 0.3568628, 1, 1,
0.289146, -0.3972469, 2.810457, 0, 0.3529412, 1, 1,
0.2926153, 0.502822, 1.195998, 0, 0.345098, 1, 1,
0.2967488, 0.6302781, 2.317038, 0, 0.3411765, 1, 1,
0.3005374, 0.220164, 1.144607, 0, 0.3333333, 1, 1,
0.3031089, -0.1693702, 1.891339, 0, 0.3294118, 1, 1,
0.3055505, -0.3988765, 3.388656, 0, 0.3215686, 1, 1,
0.3160876, 0.4541093, 0.4258043, 0, 0.3176471, 1, 1,
0.3164063, -1.232117, 1.824378, 0, 0.3098039, 1, 1,
0.3172648, -0.7940816, 2.659068, 0, 0.3058824, 1, 1,
0.3182016, 2.004078, -0.4141455, 0, 0.2980392, 1, 1,
0.3188244, 1.252999, -0.9606813, 0, 0.2901961, 1, 1,
0.3212545, -1.262595, 3.106685, 0, 0.2862745, 1, 1,
0.3223911, 1.079479, 0.6070644, 0, 0.2784314, 1, 1,
0.3226351, -1.153986, 3.354008, 0, 0.2745098, 1, 1,
0.3239026, -1.865455, 2.188131, 0, 0.2666667, 1, 1,
0.3244739, 0.33, 1.083819, 0, 0.2627451, 1, 1,
0.3254165, -0.2337832, 3.427693, 0, 0.254902, 1, 1,
0.3317158, 0.07713103, 3.26527, 0, 0.2509804, 1, 1,
0.337975, -0.04913554, 0.6904112, 0, 0.2431373, 1, 1,
0.342697, 0.02978617, 0.9040166, 0, 0.2392157, 1, 1,
0.3550072, 0.331913, 0.3686318, 0, 0.2313726, 1, 1,
0.3559736, 0.45657, 1.199962, 0, 0.227451, 1, 1,
0.3577111, -0.6916025, 3.458952, 0, 0.2196078, 1, 1,
0.3639117, 0.3824087, 0.660291, 0, 0.2156863, 1, 1,
0.3651548, -0.4436243, 1.272978, 0, 0.2078431, 1, 1,
0.3661702, 0.8955564, 1.152766, 0, 0.2039216, 1, 1,
0.3711556, 0.9676896, -0.137435, 0, 0.1960784, 1, 1,
0.3714727, -0.210868, 2.031638, 0, 0.1882353, 1, 1,
0.3717742, -0.152967, 2.455715, 0, 0.1843137, 1, 1,
0.3725272, 1.212864, -1.826888, 0, 0.1764706, 1, 1,
0.3799185, -0.6946882, 2.709451, 0, 0.172549, 1, 1,
0.3812872, -0.06081464, 2.257426, 0, 0.1647059, 1, 1,
0.3832631, 0.3887142, 0.992572, 0, 0.1607843, 1, 1,
0.3836504, 1.3028, -0.03404662, 0, 0.1529412, 1, 1,
0.3890209, 0.7736288, -1.251673, 0, 0.1490196, 1, 1,
0.3919323, -0.9242508, 1.339619, 0, 0.1411765, 1, 1,
0.402356, 1.942712, 3.85256, 0, 0.1372549, 1, 1,
0.4024542, -0.04736258, 1.942376, 0, 0.1294118, 1, 1,
0.4054883, -1.597424, 3.409986, 0, 0.1254902, 1, 1,
0.4147041, -1.502538, 4.219167, 0, 0.1176471, 1, 1,
0.4179769, 0.2974485, -0.4732461, 0, 0.1137255, 1, 1,
0.4200621, -1.339464, 1.498303, 0, 0.1058824, 1, 1,
0.4239807, -2.166533, 2.817235, 0, 0.09803922, 1, 1,
0.4266921, 0.3695972, 1.592982, 0, 0.09411765, 1, 1,
0.4303917, -1.381506, 5.72596, 0, 0.08627451, 1, 1,
0.4364295, -1.417247, 3.078063, 0, 0.08235294, 1, 1,
0.43761, 0.2719745, 0.7222267, 0, 0.07450981, 1, 1,
0.4390813, 0.4545294, 0.4018241, 0, 0.07058824, 1, 1,
0.4407963, 0.3446116, 0.7013307, 0, 0.0627451, 1, 1,
0.4415974, -0.05485814, 2.566345, 0, 0.05882353, 1, 1,
0.444428, -0.554031, 2.161577, 0, 0.05098039, 1, 1,
0.445321, -1.101597, 2.840117, 0, 0.04705882, 1, 1,
0.4458359, 0.3058745, -0.4643373, 0, 0.03921569, 1, 1,
0.4506004, -0.2688532, 2.284058, 0, 0.03529412, 1, 1,
0.4513851, -1.382204, 2.875831, 0, 0.02745098, 1, 1,
0.4517578, -0.7684567, 1.710529, 0, 0.02352941, 1, 1,
0.4538016, -0.8115731, 2.234826, 0, 0.01568628, 1, 1,
0.4598687, 1.56805, 0.476751, 0, 0.01176471, 1, 1,
0.4656726, -1.382322, 2.891438, 0, 0.003921569, 1, 1,
0.4662908, -1.434008, 2.172046, 0.003921569, 0, 1, 1,
0.4693381, -1.611983, 3.643888, 0.007843138, 0, 1, 1,
0.4694243, -0.2533837, 1.266734, 0.01568628, 0, 1, 1,
0.4700219, -0.1114528, 2.152016, 0.01960784, 0, 1, 1,
0.4718064, -1.280653, 3.217731, 0.02745098, 0, 1, 1,
0.4771062, 0.6281276, 0.5280096, 0.03137255, 0, 1, 1,
0.4777635, 0.9208691, 1.405673, 0.03921569, 0, 1, 1,
0.480347, -0.2346378, 1.616222, 0.04313726, 0, 1, 1,
0.4813607, 0.1247192, 0.001177004, 0.05098039, 0, 1, 1,
0.4830285, -0.7974496, 2.38548, 0.05490196, 0, 1, 1,
0.4853685, -1.304212, 3.49724, 0.0627451, 0, 1, 1,
0.4903688, -1.490191, 3.375301, 0.06666667, 0, 1, 1,
0.4939549, 1.963095, 0.4347673, 0.07450981, 0, 1, 1,
0.4975278, 1.741497, 0.4032415, 0.07843138, 0, 1, 1,
0.498209, 0.2322033, 0.3885327, 0.08627451, 0, 1, 1,
0.5006049, -0.5636774, 1.18146, 0.09019608, 0, 1, 1,
0.5011967, -0.5074866, 3.183521, 0.09803922, 0, 1, 1,
0.5026054, 0.6251381, -0.1592539, 0.1058824, 0, 1, 1,
0.5030187, -0.8185234, 4.156988, 0.1098039, 0, 1, 1,
0.5089155, 0.1089732, 0.862259, 0.1176471, 0, 1, 1,
0.5092655, -0.05336955, 2.084416, 0.1215686, 0, 1, 1,
0.5096393, 0.1493783, 2.284904, 0.1294118, 0, 1, 1,
0.5147254, -0.781191, 2.176949, 0.1333333, 0, 1, 1,
0.5164605, 0.2800572, 1.595942, 0.1411765, 0, 1, 1,
0.5175067, -0.5279658, 2.265508, 0.145098, 0, 1, 1,
0.5199049, -0.7907378, 3.214379, 0.1529412, 0, 1, 1,
0.5234962, 0.6891007, 1.81408, 0.1568628, 0, 1, 1,
0.5247446, 0.0347661, 2.74927, 0.1647059, 0, 1, 1,
0.5302291, 1.917611, -0.1234469, 0.1686275, 0, 1, 1,
0.5349411, -0.6620657, 3.023956, 0.1764706, 0, 1, 1,
0.536626, 0.2860699, 0.1136482, 0.1803922, 0, 1, 1,
0.537591, -0.02936181, 3.887395, 0.1882353, 0, 1, 1,
0.539352, 0.5366689, -0.1347741, 0.1921569, 0, 1, 1,
0.5395262, 1.175811, -1.055298, 0.2, 0, 1, 1,
0.5411461, 0.5878985, 1.525719, 0.2078431, 0, 1, 1,
0.5427712, 0.2835616, 2.015579, 0.2117647, 0, 1, 1,
0.5446565, 1.74474, -0.1951124, 0.2196078, 0, 1, 1,
0.5466601, 1.925317, 0.304722, 0.2235294, 0, 1, 1,
0.547694, 0.1007632, -1.192613, 0.2313726, 0, 1, 1,
0.5554718, -0.1642168, 1.449912, 0.2352941, 0, 1, 1,
0.5601725, -0.6707332, 1.399381, 0.2431373, 0, 1, 1,
0.5612832, -0.6574013, 2.423453, 0.2470588, 0, 1, 1,
0.5645288, -0.6687809, 2.226994, 0.254902, 0, 1, 1,
0.5645323, 1.024113, 1.69803, 0.2588235, 0, 1, 1,
0.5648093, 0.4381513, 2.600522, 0.2666667, 0, 1, 1,
0.5697123, 0.15404, 1.705554, 0.2705882, 0, 1, 1,
0.5715452, 0.9711384, 0.1623471, 0.2784314, 0, 1, 1,
0.5737071, -0.2687182, 2.610565, 0.282353, 0, 1, 1,
0.574994, -1.326741, 2.3802, 0.2901961, 0, 1, 1,
0.5796207, -1.046055, 3.011134, 0.2941177, 0, 1, 1,
0.5829555, 1.95189, 0.8187202, 0.3019608, 0, 1, 1,
0.5915788, 1.223999, 1.549707, 0.3098039, 0, 1, 1,
0.5948049, 0.2814401, 1.184615, 0.3137255, 0, 1, 1,
0.5956368, 0.923909, 0.8641989, 0.3215686, 0, 1, 1,
0.5960987, 0.06697571, 2.054375, 0.3254902, 0, 1, 1,
0.5973985, -0.2378502, 1.389244, 0.3333333, 0, 1, 1,
0.5993399, 0.5415382, 1.214363, 0.3372549, 0, 1, 1,
0.6030274, 0.5116501, 2.011326, 0.345098, 0, 1, 1,
0.6033869, -1.6894, 3.60399, 0.3490196, 0, 1, 1,
0.6100419, 0.7842684, 0.006377778, 0.3568628, 0, 1, 1,
0.6158078, -0.1793021, 1.716312, 0.3607843, 0, 1, 1,
0.6171119, -0.676618, 2.238927, 0.3686275, 0, 1, 1,
0.6206601, -2.024686, 2.629347, 0.372549, 0, 1, 1,
0.6209673, 1.234358, -0.7160342, 0.3803922, 0, 1, 1,
0.6258487, 1.506257, -0.174207, 0.3843137, 0, 1, 1,
0.626293, -1.075754, 1.684739, 0.3921569, 0, 1, 1,
0.6285759, -3.168811, 4.927696, 0.3960784, 0, 1, 1,
0.6331664, -0.05485911, 0.4843558, 0.4039216, 0, 1, 1,
0.6338062, -0.2611786, 1.98144, 0.4117647, 0, 1, 1,
0.6367475, 1.259288, 0.2758704, 0.4156863, 0, 1, 1,
0.6377853, -1.614722, 1.365825, 0.4235294, 0, 1, 1,
0.6403714, 1.849776, 0.3673567, 0.427451, 0, 1, 1,
0.6461791, 0.9676491, 1.508026, 0.4352941, 0, 1, 1,
0.6534089, -0.06923911, 2.790933, 0.4392157, 0, 1, 1,
0.6549001, 1.204026, 0.1802327, 0.4470588, 0, 1, 1,
0.6549435, 0.7197117, 0.1386843, 0.4509804, 0, 1, 1,
0.657335, -0.08818943, 1.352557, 0.4588235, 0, 1, 1,
0.6593037, 0.08893239, 1.525718, 0.4627451, 0, 1, 1,
0.6599095, 1.376317, -0.4286923, 0.4705882, 0, 1, 1,
0.6695313, -0.9426652, 4.78717, 0.4745098, 0, 1, 1,
0.678815, -0.801542, 2.906624, 0.4823529, 0, 1, 1,
0.6806713, -0.2370034, 2.690226, 0.4862745, 0, 1, 1,
0.6812975, -0.9052768, 3.684205, 0.4941176, 0, 1, 1,
0.6818361, 0.1917069, 3.275563, 0.5019608, 0, 1, 1,
0.6821759, 1.182513, 0.6015024, 0.5058824, 0, 1, 1,
0.6883738, 0.5775746, -0.5526624, 0.5137255, 0, 1, 1,
0.6947078, -0.3408514, 2.817963, 0.5176471, 0, 1, 1,
0.6966549, 0.1369807, 1.60626, 0.5254902, 0, 1, 1,
0.7000721, 0.3392018, 1.831125, 0.5294118, 0, 1, 1,
0.700551, 0.5073373, 0.1448538, 0.5372549, 0, 1, 1,
0.7008626, 0.7602808, 1.035184, 0.5411765, 0, 1, 1,
0.702725, 0.1791576, 2.808658, 0.5490196, 0, 1, 1,
0.7028043, -0.1572037, 2.09911, 0.5529412, 0, 1, 1,
0.7036066, 0.7485449, 0.3437169, 0.5607843, 0, 1, 1,
0.7059556, 1.922354, 2.210832, 0.5647059, 0, 1, 1,
0.7061729, 0.5660147, 1.499769, 0.572549, 0, 1, 1,
0.7072995, -0.1885484, 1.438499, 0.5764706, 0, 1, 1,
0.712997, 0.02711704, 1.342982, 0.5843138, 0, 1, 1,
0.7182964, 0.9019256, 1.717133, 0.5882353, 0, 1, 1,
0.7192047, 0.6754298, 0.1241672, 0.5960785, 0, 1, 1,
0.7219669, 0.2389063, 1.848735, 0.6039216, 0, 1, 1,
0.7254246, -0.4099319, 2.05658, 0.6078432, 0, 1, 1,
0.726047, 0.6460421, 0.6630374, 0.6156863, 0, 1, 1,
0.7377794, -0.8531258, 2.375247, 0.6196079, 0, 1, 1,
0.7397557, 1.187879, 1.99361, 0.627451, 0, 1, 1,
0.7488474, -0.8196341, 1.226677, 0.6313726, 0, 1, 1,
0.7495446, -0.613349, 2.583677, 0.6392157, 0, 1, 1,
0.7516016, -0.2362894, 0.02366045, 0.6431373, 0, 1, 1,
0.7541392, -0.01319116, 1.542934, 0.6509804, 0, 1, 1,
0.7616013, -0.365776, 2.328485, 0.654902, 0, 1, 1,
0.7618368, 0.2370254, 0.4531577, 0.6627451, 0, 1, 1,
0.7688996, -0.8384888, 2.55777, 0.6666667, 0, 1, 1,
0.7696583, 0.7086285, -0.8754736, 0.6745098, 0, 1, 1,
0.7736121, 0.7897714, 2.052545, 0.6784314, 0, 1, 1,
0.7821839, -0.5806752, 1.344776, 0.6862745, 0, 1, 1,
0.7922193, -0.3250953, 0.2473834, 0.6901961, 0, 1, 1,
0.7949067, 0.9245313, 0.6199984, 0.6980392, 0, 1, 1,
0.8000742, -0.3190151, -0.2807795, 0.7058824, 0, 1, 1,
0.8005786, -1.824198, 4.012201, 0.7098039, 0, 1, 1,
0.8073179, -0.6291589, 3.177488, 0.7176471, 0, 1, 1,
0.8151938, 0.7196281, 0.1074229, 0.7215686, 0, 1, 1,
0.8248152, -1.104479, 2.230866, 0.7294118, 0, 1, 1,
0.8308734, -0.6751893, 1.573946, 0.7333333, 0, 1, 1,
0.8310391, 1.636778, -0.2164238, 0.7411765, 0, 1, 1,
0.8317909, 0.8069625, 1.537195, 0.7450981, 0, 1, 1,
0.8383517, 0.2080363, 2.40933, 0.7529412, 0, 1, 1,
0.8429747, -0.2465194, 1.965285, 0.7568628, 0, 1, 1,
0.848823, 0.1531333, 1.477033, 0.7647059, 0, 1, 1,
0.8523939, 0.6263846, -0.172778, 0.7686275, 0, 1, 1,
0.8580205, 0.7004979, -0.2066823, 0.7764706, 0, 1, 1,
0.8644009, -0.2860858, -0.49617, 0.7803922, 0, 1, 1,
0.8653648, -0.5930216, 2.92801, 0.7882353, 0, 1, 1,
0.8689591, -0.545087, 3.558405, 0.7921569, 0, 1, 1,
0.8797289, 0.9693446, 2.220459, 0.8, 0, 1, 1,
0.8808063, -0.1468876, 2.839232, 0.8078431, 0, 1, 1,
0.8828569, -0.01736834, 2.449667, 0.8117647, 0, 1, 1,
0.8864256, 1.620147, 1.537199, 0.8196079, 0, 1, 1,
0.8898528, -0.01441111, 2.202601, 0.8235294, 0, 1, 1,
0.892091, 1.72377, 0.5065696, 0.8313726, 0, 1, 1,
0.9038485, -0.5590473, 1.575911, 0.8352941, 0, 1, 1,
0.9061109, -0.422391, 1.051695, 0.8431373, 0, 1, 1,
0.9064657, 0.2347704, -0.80771, 0.8470588, 0, 1, 1,
0.9083955, -2.084294, 2.043241, 0.854902, 0, 1, 1,
0.910659, 0.7875344, 1.644225, 0.8588235, 0, 1, 1,
0.9147984, 1.226828, 0.803765, 0.8666667, 0, 1, 1,
0.9152205, 0.09625204, 1.193989, 0.8705882, 0, 1, 1,
0.918352, 2.230839, -0.5839648, 0.8784314, 0, 1, 1,
0.9194205, -1.495029, 2.689703, 0.8823529, 0, 1, 1,
0.9227458, 0.2672612, -0.03514717, 0.8901961, 0, 1, 1,
0.9263093, 1.5786, 1.344721, 0.8941177, 0, 1, 1,
0.9266677, 1.536793, -1.471736, 0.9019608, 0, 1, 1,
0.928579, -0.5812271, 3.411872, 0.9098039, 0, 1, 1,
0.9317366, 0.4593547, 1.649469, 0.9137255, 0, 1, 1,
0.9435511, -1.822833, 2.450127, 0.9215686, 0, 1, 1,
0.9444858, -0.232673, 2.350127, 0.9254902, 0, 1, 1,
0.9549762, -1.1522, 1.936646, 0.9333333, 0, 1, 1,
0.9561995, -0.4812874, 2.480422, 0.9372549, 0, 1, 1,
0.957863, -1.515609, 3.416543, 0.945098, 0, 1, 1,
0.9602301, -0.9276475, 4.58698, 0.9490196, 0, 1, 1,
0.9765838, 0.01035633, 1.720944, 0.9568627, 0, 1, 1,
0.9863645, -0.2718234, 2.584747, 0.9607843, 0, 1, 1,
0.9897317, -1.350122, 2.663921, 0.9686275, 0, 1, 1,
0.9931551, -1.074989, 1.284062, 0.972549, 0, 1, 1,
0.9932051, 0.8973908, 1.520022, 0.9803922, 0, 1, 1,
0.9996778, 0.0456978, 0.8671467, 0.9843137, 0, 1, 1,
1.000837, 0.1212565, 0.1619618, 0.9921569, 0, 1, 1,
1.00699, -0.3609206, 1.813877, 0.9960784, 0, 1, 1,
1.009863, -0.5823295, 0.9111315, 1, 0, 0.9960784, 1,
1.010168, -0.3112518, 2.567025, 1, 0, 0.9882353, 1,
1.015837, -0.9687216, 2.420866, 1, 0, 0.9843137, 1,
1.021457, -0.4683904, 1.929355, 1, 0, 0.9764706, 1,
1.030979, 0.7497256, 0.6798757, 1, 0, 0.972549, 1,
1.031498, -1.993372, 4.104839, 1, 0, 0.9647059, 1,
1.033058, 0.5227647, 0.3869216, 1, 0, 0.9607843, 1,
1.03547, 0.02905946, 1.863314, 1, 0, 0.9529412, 1,
1.038696, 1.888273, -0.370573, 1, 0, 0.9490196, 1,
1.04731, 0.7917464, 1.493674, 1, 0, 0.9411765, 1,
1.05637, 0.630491, -0.6046088, 1, 0, 0.9372549, 1,
1.05904, -0.9631776, 3.42449, 1, 0, 0.9294118, 1,
1.060797, -0.3021429, 2.746962, 1, 0, 0.9254902, 1,
1.065238, -1.638883, 3.659979, 1, 0, 0.9176471, 1,
1.073845, -1.823443, 3.084598, 1, 0, 0.9137255, 1,
1.076787, 1.271835, -0.2390661, 1, 0, 0.9058824, 1,
1.076868, -1.197734, 3.486781, 1, 0, 0.9019608, 1,
1.102564, -0.3987787, 0.8721848, 1, 0, 0.8941177, 1,
1.102994, 0.4262429, 0.6114535, 1, 0, 0.8862745, 1,
1.10863, 1.240512, -0.4000963, 1, 0, 0.8823529, 1,
1.122072, -0.1440341, 3.526229, 1, 0, 0.8745098, 1,
1.125903, 0.2211896, 3.105349, 1, 0, 0.8705882, 1,
1.127618, -0.356156, 1.396546, 1, 0, 0.8627451, 1,
1.129139, -1.680655, 1.960453, 1, 0, 0.8588235, 1,
1.134869, 0.8585484, 0.6884819, 1, 0, 0.8509804, 1,
1.149108, -1.285462, 2.956462, 1, 0, 0.8470588, 1,
1.149356, 0.03059108, -0.1196622, 1, 0, 0.8392157, 1,
1.150598, 1.156368, 0.5616827, 1, 0, 0.8352941, 1,
1.16869, -0.7534036, 1.590267, 1, 0, 0.827451, 1,
1.175876, -0.362498, 2.832794, 1, 0, 0.8235294, 1,
1.183345, -1.640704, 1.314159, 1, 0, 0.8156863, 1,
1.183413, -0.04223576, 2.027542, 1, 0, 0.8117647, 1,
1.190397, -1.212082, 2.147156, 1, 0, 0.8039216, 1,
1.203383, -2.363521, 1.750974, 1, 0, 0.7960784, 1,
1.204469, 0.04396315, 1.820849, 1, 0, 0.7921569, 1,
1.208923, 0.2283691, 1.494877, 1, 0, 0.7843137, 1,
1.214311, 0.6477859, 1.032366, 1, 0, 0.7803922, 1,
1.225723, -0.4175226, 2.280611, 1, 0, 0.772549, 1,
1.24189, -1.325107, 2.164452, 1, 0, 0.7686275, 1,
1.242368, -0.5480733, 0.7998335, 1, 0, 0.7607843, 1,
1.243765, 0.460877, 1.554713, 1, 0, 0.7568628, 1,
1.252324, 2.038321, -1.014155, 1, 0, 0.7490196, 1,
1.257947, -0.6744961, 1.460814, 1, 0, 0.7450981, 1,
1.25884, 0.9755497, 0.1863192, 1, 0, 0.7372549, 1,
1.280586, -1.346341, 4.224009, 1, 0, 0.7333333, 1,
1.280774, 0.2129876, 1.196109, 1, 0, 0.7254902, 1,
1.282285, 0.151307, 3.06192, 1, 0, 0.7215686, 1,
1.288797, -0.04301155, 1.951614, 1, 0, 0.7137255, 1,
1.290707, 1.624221, 1.077852, 1, 0, 0.7098039, 1,
1.292517, -2.458589, 3.454258, 1, 0, 0.7019608, 1,
1.29928, -0.07772633, 1.841184, 1, 0, 0.6941177, 1,
1.302093, -1.761952, 1.10057, 1, 0, 0.6901961, 1,
1.304475, -0.1596296, 2.265837, 1, 0, 0.682353, 1,
1.308283, 0.9842306, 0.3799989, 1, 0, 0.6784314, 1,
1.329615, 1.14409, 0.4640834, 1, 0, 0.6705883, 1,
1.33205, 0.471348, 1.434502, 1, 0, 0.6666667, 1,
1.333378, -1.041371, 2.60544, 1, 0, 0.6588235, 1,
1.338417, -0.1213816, 2.440754, 1, 0, 0.654902, 1,
1.344738, -1.081537, 1.919078, 1, 0, 0.6470588, 1,
1.353752, 2.142711, 1.546477, 1, 0, 0.6431373, 1,
1.353794, 0.8640679, -0.7734334, 1, 0, 0.6352941, 1,
1.35674, 0.05139893, 3.0382, 1, 0, 0.6313726, 1,
1.357202, -0.7207102, 2.268516, 1, 0, 0.6235294, 1,
1.358407, -0.8204828, 4.322121, 1, 0, 0.6196079, 1,
1.367325, -0.6402657, 3.119699, 1, 0, 0.6117647, 1,
1.373028, -0.2391568, 1.666928, 1, 0, 0.6078432, 1,
1.379568, -0.05879632, 0.09202036, 1, 0, 0.6, 1,
1.392542, 0.497293, 0.3326929, 1, 0, 0.5921569, 1,
1.402985, -0.9236124, 2.092756, 1, 0, 0.5882353, 1,
1.411832, -0.8139136, 1.967057, 1, 0, 0.5803922, 1,
1.412651, 0.4899355, 0.2444059, 1, 0, 0.5764706, 1,
1.420759, -0.5021757, 0.4898493, 1, 0, 0.5686275, 1,
1.42098, 0.4106973, 1.739416, 1, 0, 0.5647059, 1,
1.457149, -1.603064, 2.527271, 1, 0, 0.5568628, 1,
1.464063, 0.332967, 2.62806, 1, 0, 0.5529412, 1,
1.465492, -0.4124682, 2.719723, 1, 0, 0.5450981, 1,
1.489832, 0.6501743, 2.152094, 1, 0, 0.5411765, 1,
1.49029, 1.358213, 1.733514, 1, 0, 0.5333334, 1,
1.498115, 0.2536978, 2.338122, 1, 0, 0.5294118, 1,
1.499787, -1.399208, 2.729511, 1, 0, 0.5215687, 1,
1.502168, -0.666124, 1.223701, 1, 0, 0.5176471, 1,
1.504105, 0.4501301, -0.05566384, 1, 0, 0.509804, 1,
1.509004, 1.367752, 0.3063002, 1, 0, 0.5058824, 1,
1.511574, 0.09064082, 2.006116, 1, 0, 0.4980392, 1,
1.513812, -1.045781, 2.874816, 1, 0, 0.4901961, 1,
1.518593, -0.2636116, 2.145337, 1, 0, 0.4862745, 1,
1.523868, 0.5437115, 2.957183, 1, 0, 0.4784314, 1,
1.525448, 1.636516, 0.1057526, 1, 0, 0.4745098, 1,
1.526169, 1.57871, 2.278238, 1, 0, 0.4666667, 1,
1.531072, 0.2158101, 3.114632, 1, 0, 0.4627451, 1,
1.534048, -0.5056407, 3.056861, 1, 0, 0.454902, 1,
1.548922, 0.1236665, 1.323945, 1, 0, 0.4509804, 1,
1.561905, 0.9785622, -0.2172712, 1, 0, 0.4431373, 1,
1.562943, -0.7810025, 0.4520795, 1, 0, 0.4392157, 1,
1.565171, 1.919459, 0.5706514, 1, 0, 0.4313726, 1,
1.581968, -0.1151117, 1.285209, 1, 0, 0.427451, 1,
1.583055, 0.2056085, 2.996516, 1, 0, 0.4196078, 1,
1.612098, 0.2123063, 3.122394, 1, 0, 0.4156863, 1,
1.615542, 0.8916638, 1.299485, 1, 0, 0.4078431, 1,
1.633296, -0.625428, 1.854279, 1, 0, 0.4039216, 1,
1.637839, -1.439043, 0.807079, 1, 0, 0.3960784, 1,
1.660361, 1.383894, 1.196901, 1, 0, 0.3882353, 1,
1.662349, -0.4752671, 2.945508, 1, 0, 0.3843137, 1,
1.669397, 1.581354, 0.2276638, 1, 0, 0.3764706, 1,
1.670579, -0.8833118, 1.734658, 1, 0, 0.372549, 1,
1.675545, -0.3583989, 2.859792, 1, 0, 0.3647059, 1,
1.678783, 1.88609, 1.680425, 1, 0, 0.3607843, 1,
1.681071, -0.8353812, 2.86276, 1, 0, 0.3529412, 1,
1.682432, 0.1857601, 0.4396604, 1, 0, 0.3490196, 1,
1.690229, -0.2638601, 0.7946349, 1, 0, 0.3411765, 1,
1.690916, 1.959235, 0.5537858, 1, 0, 0.3372549, 1,
1.697021, -0.8824486, 0.2589315, 1, 0, 0.3294118, 1,
1.702848, -0.6182886, 2.001466, 1, 0, 0.3254902, 1,
1.706236, -1.399778, 1.145736, 1, 0, 0.3176471, 1,
1.724516, 1.189354, 1.873712, 1, 0, 0.3137255, 1,
1.728602, 0.125019, 1.442745, 1, 0, 0.3058824, 1,
1.741178, -0.5681223, 0.4917053, 1, 0, 0.2980392, 1,
1.748259, -0.01063036, 1.492267, 1, 0, 0.2941177, 1,
1.768876, -0.1652624, 0.7469149, 1, 0, 0.2862745, 1,
1.783841, 0.6741958, -0.6310515, 1, 0, 0.282353, 1,
1.787044, -0.2160085, 0.1538251, 1, 0, 0.2745098, 1,
1.803444, -0.406875, 3.466877, 1, 0, 0.2705882, 1,
1.808919, 0.7692758, 1.133246, 1, 0, 0.2627451, 1,
1.810184, -0.0665822, 2.017382, 1, 0, 0.2588235, 1,
1.81893, 0.560331, 0.8576179, 1, 0, 0.2509804, 1,
1.840524, 0.3618681, 1.565412, 1, 0, 0.2470588, 1,
1.850936, -0.9059947, 0.7366824, 1, 0, 0.2392157, 1,
1.860444, 0.06393046, 3.487984, 1, 0, 0.2352941, 1,
1.918132, 0.3458467, -0.07692651, 1, 0, 0.227451, 1,
1.922942, -1.527362, 0.8170162, 1, 0, 0.2235294, 1,
1.923869, -0.07200269, 2.283249, 1, 0, 0.2156863, 1,
1.944933, -0.8301421, 1.785155, 1, 0, 0.2117647, 1,
1.954498, -1.439618, 1.311232, 1, 0, 0.2039216, 1,
1.962354, -0.7884762, 2.433807, 1, 0, 0.1960784, 1,
1.963847, 0.9413571, 0.02601635, 1, 0, 0.1921569, 1,
1.971544, -0.4200568, 1.173539, 1, 0, 0.1843137, 1,
1.973264, -0.1772097, 2.06058, 1, 0, 0.1803922, 1,
1.978316, -1.193179, 1.563829, 1, 0, 0.172549, 1,
2.086015, 1.113819, 0.8385917, 1, 0, 0.1686275, 1,
2.107598, -0.8826075, 0.2911964, 1, 0, 0.1607843, 1,
2.147492, 0.4729742, 1.440686, 1, 0, 0.1568628, 1,
2.173329, 0.4487101, 0.6382498, 1, 0, 0.1490196, 1,
2.1875, 0.4688647, 2.140434, 1, 0, 0.145098, 1,
2.204824, -0.003055637, 1.701015, 1, 0, 0.1372549, 1,
2.214745, 0.222058, 1.866654, 1, 0, 0.1333333, 1,
2.216232, -0.3826167, 1.782636, 1, 0, 0.1254902, 1,
2.262593, -0.6618294, 2.78337, 1, 0, 0.1215686, 1,
2.262925, 0.541636, 1.191777, 1, 0, 0.1137255, 1,
2.263668, -0.5653476, 3.002028, 1, 0, 0.1098039, 1,
2.318531, 0.02851574, 1.847286, 1, 0, 0.1019608, 1,
2.338701, -1.587538, 1.426462, 1, 0, 0.09411765, 1,
2.352467, -0.3490296, 0.9438689, 1, 0, 0.09019608, 1,
2.441246, 0.5101548, 0.4617041, 1, 0, 0.08235294, 1,
2.497607, -0.3460283, -0.04703585, 1, 0, 0.07843138, 1,
2.515514, -1.280865, 2.851894, 1, 0, 0.07058824, 1,
2.534545, 0.4978496, 3.115448, 1, 0, 0.06666667, 1,
2.563275, 0.2216957, 2.535084, 1, 0, 0.05882353, 1,
2.583615, -0.1977291, 0.4133612, 1, 0, 0.05490196, 1,
2.58582, -0.8687646, 2.247358, 1, 0, 0.04705882, 1,
2.586476, -1.217754, 2.736111, 1, 0, 0.04313726, 1,
2.712303, 0.9905628, 1.258417, 1, 0, 0.03529412, 1,
2.733935, -1.914771, 2.415019, 1, 0, 0.03137255, 1,
2.778703, -0.333968, 0.3037649, 1, 0, 0.02352941, 1,
2.960737, 0.7078153, 1.211896, 1, 0, 0.01960784, 1,
3.30447, 0.8366254, 1.363655, 1, 0, 0.01176471, 1,
3.365734, 0.9241818, 0.09158176, 1, 0, 0.007843138, 1
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
0.2080283, -4.462408, -7.390598, 0, -0.5, 0.5, 0.5,
0.2080283, -4.462408, -7.390598, 1, -0.5, 0.5, 0.5,
0.2080283, -4.462408, -7.390598, 1, 1.5, 0.5, 0.5,
0.2080283, -4.462408, -7.390598, 0, 1.5, 0.5, 0.5
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
-4.02014, -0.5132281, -7.390598, 0, -0.5, 0.5, 0.5,
-4.02014, -0.5132281, -7.390598, 1, -0.5, 0.5, 0.5,
-4.02014, -0.5132281, -7.390598, 1, 1.5, 0.5, 0.5,
-4.02014, -0.5132281, -7.390598, 0, 1.5, 0.5, 0.5
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
-4.02014, -4.462408, 0.1181967, 0, -0.5, 0.5, 0.5,
-4.02014, -4.462408, 0.1181967, 1, -0.5, 0.5, 0.5,
-4.02014, -4.462408, 0.1181967, 1, 1.5, 0.5, 0.5,
-4.02014, -4.462408, 0.1181967, 0, 1.5, 0.5, 0.5
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
-2, -3.551059, -5.657799,
3, -3.551059, -5.657799,
-2, -3.551059, -5.657799,
-2, -3.70295, -5.946599,
-1, -3.551059, -5.657799,
-1, -3.70295, -5.946599,
0, -3.551059, -5.657799,
0, -3.70295, -5.946599,
1, -3.551059, -5.657799,
1, -3.70295, -5.946599,
2, -3.551059, -5.657799,
2, -3.70295, -5.946599,
3, -3.551059, -5.657799,
3, -3.70295, -5.946599
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
-2, -4.006733, -6.524199, 0, -0.5, 0.5, 0.5,
-2, -4.006733, -6.524199, 1, -0.5, 0.5, 0.5,
-2, -4.006733, -6.524199, 1, 1.5, 0.5, 0.5,
-2, -4.006733, -6.524199, 0, 1.5, 0.5, 0.5,
-1, -4.006733, -6.524199, 0, -0.5, 0.5, 0.5,
-1, -4.006733, -6.524199, 1, -0.5, 0.5, 0.5,
-1, -4.006733, -6.524199, 1, 1.5, 0.5, 0.5,
-1, -4.006733, -6.524199, 0, 1.5, 0.5, 0.5,
0, -4.006733, -6.524199, 0, -0.5, 0.5, 0.5,
0, -4.006733, -6.524199, 1, -0.5, 0.5, 0.5,
0, -4.006733, -6.524199, 1, 1.5, 0.5, 0.5,
0, -4.006733, -6.524199, 0, 1.5, 0.5, 0.5,
1, -4.006733, -6.524199, 0, -0.5, 0.5, 0.5,
1, -4.006733, -6.524199, 1, -0.5, 0.5, 0.5,
1, -4.006733, -6.524199, 1, 1.5, 0.5, 0.5,
1, -4.006733, -6.524199, 0, 1.5, 0.5, 0.5,
2, -4.006733, -6.524199, 0, -0.5, 0.5, 0.5,
2, -4.006733, -6.524199, 1, -0.5, 0.5, 0.5,
2, -4.006733, -6.524199, 1, 1.5, 0.5, 0.5,
2, -4.006733, -6.524199, 0, 1.5, 0.5, 0.5,
3, -4.006733, -6.524199, 0, -0.5, 0.5, 0.5,
3, -4.006733, -6.524199, 1, -0.5, 0.5, 0.5,
3, -4.006733, -6.524199, 1, 1.5, 0.5, 0.5,
3, -4.006733, -6.524199, 0, 1.5, 0.5, 0.5
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
-3.044409, -3, -5.657799,
-3.044409, 2, -5.657799,
-3.044409, -3, -5.657799,
-3.207031, -3, -5.946599,
-3.044409, -2, -5.657799,
-3.207031, -2, -5.946599,
-3.044409, -1, -5.657799,
-3.207031, -1, -5.946599,
-3.044409, 0, -5.657799,
-3.207031, 0, -5.946599,
-3.044409, 1, -5.657799,
-3.207031, 1, -5.946599,
-3.044409, 2, -5.657799,
-3.207031, 2, -5.946599
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
-3.532274, -3, -6.524199, 0, -0.5, 0.5, 0.5,
-3.532274, -3, -6.524199, 1, -0.5, 0.5, 0.5,
-3.532274, -3, -6.524199, 1, 1.5, 0.5, 0.5,
-3.532274, -3, -6.524199, 0, 1.5, 0.5, 0.5,
-3.532274, -2, -6.524199, 0, -0.5, 0.5, 0.5,
-3.532274, -2, -6.524199, 1, -0.5, 0.5, 0.5,
-3.532274, -2, -6.524199, 1, 1.5, 0.5, 0.5,
-3.532274, -2, -6.524199, 0, 1.5, 0.5, 0.5,
-3.532274, -1, -6.524199, 0, -0.5, 0.5, 0.5,
-3.532274, -1, -6.524199, 1, -0.5, 0.5, 0.5,
-3.532274, -1, -6.524199, 1, 1.5, 0.5, 0.5,
-3.532274, -1, -6.524199, 0, 1.5, 0.5, 0.5,
-3.532274, 0, -6.524199, 0, -0.5, 0.5, 0.5,
-3.532274, 0, -6.524199, 1, -0.5, 0.5, 0.5,
-3.532274, 0, -6.524199, 1, 1.5, 0.5, 0.5,
-3.532274, 0, -6.524199, 0, 1.5, 0.5, 0.5,
-3.532274, 1, -6.524199, 0, -0.5, 0.5, 0.5,
-3.532274, 1, -6.524199, 1, -0.5, 0.5, 0.5,
-3.532274, 1, -6.524199, 1, 1.5, 0.5, 0.5,
-3.532274, 1, -6.524199, 0, 1.5, 0.5, 0.5,
-3.532274, 2, -6.524199, 0, -0.5, 0.5, 0.5,
-3.532274, 2, -6.524199, 1, -0.5, 0.5, 0.5,
-3.532274, 2, -6.524199, 1, 1.5, 0.5, 0.5,
-3.532274, 2, -6.524199, 0, 1.5, 0.5, 0.5
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
-3.044409, -3.551059, -4,
-3.044409, -3.551059, 4,
-3.044409, -3.551059, -4,
-3.207031, -3.70295, -4,
-3.044409, -3.551059, -2,
-3.207031, -3.70295, -2,
-3.044409, -3.551059, 0,
-3.207031, -3.70295, 0,
-3.044409, -3.551059, 2,
-3.207031, -3.70295, 2,
-3.044409, -3.551059, 4,
-3.207031, -3.70295, 4
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
-3.532274, -4.006733, -4, 0, -0.5, 0.5, 0.5,
-3.532274, -4.006733, -4, 1, -0.5, 0.5, 0.5,
-3.532274, -4.006733, -4, 1, 1.5, 0.5, 0.5,
-3.532274, -4.006733, -4, 0, 1.5, 0.5, 0.5,
-3.532274, -4.006733, -2, 0, -0.5, 0.5, 0.5,
-3.532274, -4.006733, -2, 1, -0.5, 0.5, 0.5,
-3.532274, -4.006733, -2, 1, 1.5, 0.5, 0.5,
-3.532274, -4.006733, -2, 0, 1.5, 0.5, 0.5,
-3.532274, -4.006733, 0, 0, -0.5, 0.5, 0.5,
-3.532274, -4.006733, 0, 1, -0.5, 0.5, 0.5,
-3.532274, -4.006733, 0, 1, 1.5, 0.5, 0.5,
-3.532274, -4.006733, 0, 0, 1.5, 0.5, 0.5,
-3.532274, -4.006733, 2, 0, -0.5, 0.5, 0.5,
-3.532274, -4.006733, 2, 1, -0.5, 0.5, 0.5,
-3.532274, -4.006733, 2, 1, 1.5, 0.5, 0.5,
-3.532274, -4.006733, 2, 0, 1.5, 0.5, 0.5,
-3.532274, -4.006733, 4, 0, -0.5, 0.5, 0.5,
-3.532274, -4.006733, 4, 1, -0.5, 0.5, 0.5,
-3.532274, -4.006733, 4, 1, 1.5, 0.5, 0.5,
-3.532274, -4.006733, 4, 0, 1.5, 0.5, 0.5
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
-3.044409, -3.551059, -5.657799,
-3.044409, 2.524603, -5.657799,
-3.044409, -3.551059, 5.894193,
-3.044409, 2.524603, 5.894193,
-3.044409, -3.551059, -5.657799,
-3.044409, -3.551059, 5.894193,
-3.044409, 2.524603, -5.657799,
-3.044409, 2.524603, 5.894193,
-3.044409, -3.551059, -5.657799,
3.460465, -3.551059, -5.657799,
-3.044409, -3.551059, 5.894193,
3.460465, -3.551059, 5.894193,
-3.044409, 2.524603, -5.657799,
3.460465, 2.524603, -5.657799,
-3.044409, 2.524603, 5.894193,
3.460465, 2.524603, 5.894193,
3.460465, -3.551059, -5.657799,
3.460465, 2.524603, -5.657799,
3.460465, -3.551059, 5.894193,
3.460465, 2.524603, 5.894193,
3.460465, -3.551059, -5.657799,
3.460465, -3.551059, 5.894193,
3.460465, 2.524603, -5.657799,
3.460465, 2.524603, 5.894193
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
var radius = 7.787253;
var distance = 34.64637;
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
mvMatrix.translate( -0.2080283, 0.5132281, -0.1181967 );
mvMatrix.scale( 1.294373, 1.385813, 0.7288553 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.64637);
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
zoxamide<-read.table("zoxamide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-zoxamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'zoxamide' not found
```

```r
y<-zoxamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'zoxamide' not found
```

```r
z<-zoxamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'zoxamide' not found
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
-2.949677, 0.0515622, -2.073776, 0, 0, 1, 1, 1,
-2.796115, 0.63782, -1.826135, 1, 0, 0, 1, 1,
-2.760983, -0.3306071, -2.157866, 1, 0, 0, 1, 1,
-2.370736, 0.9762635, -1.01374, 1, 0, 0, 1, 1,
-2.273738, -0.4363003, -2.703254, 1, 0, 0, 1, 1,
-2.202992, -2.028957, -2.49235, 1, 0, 0, 1, 1,
-2.192624, -0.2126001, -2.039708, 0, 0, 0, 1, 1,
-2.162433, -0.7772985, -1.90163, 0, 0, 0, 1, 1,
-2.150609, 2.022927, -1.544794, 0, 0, 0, 1, 1,
-2.125639, -1.519474, -3.944772, 0, 0, 0, 1, 1,
-2.121551, 0.6715614, -0.2306016, 0, 0, 0, 1, 1,
-2.109421, -0.9759251, -2.920981, 0, 0, 0, 1, 1,
-2.098905, 0.5646948, -1.157473, 0, 0, 0, 1, 1,
-2.085855, -0.1361645, 0.03042145, 1, 1, 1, 1, 1,
-2.044804, -0.04216713, -0.5651885, 1, 1, 1, 1, 1,
-2.027566, -1.025918, -1.28172, 1, 1, 1, 1, 1,
-2.026486, 0.9940466, -0.8551996, 1, 1, 1, 1, 1,
-2.021184, 0.265944, -2.132261, 1, 1, 1, 1, 1,
-2.007538, -0.1670277, -1.374018, 1, 1, 1, 1, 1,
-1.988091, -1.656717, -0.5396709, 1, 1, 1, 1, 1,
-1.937258, -0.9224585, -1.766238, 1, 1, 1, 1, 1,
-1.92937, -2.205023, -1.679146, 1, 1, 1, 1, 1,
-1.888081, 1.039687, -2.345356, 1, 1, 1, 1, 1,
-1.884145, 0.857294, -0.7293178, 1, 1, 1, 1, 1,
-1.880199, -0.4552601, -0.9695156, 1, 1, 1, 1, 1,
-1.872322, 0.2278618, -0.3537631, 1, 1, 1, 1, 1,
-1.860705, -0.5668449, -1.176062, 1, 1, 1, 1, 1,
-1.853088, 1.407191, -0.04492911, 1, 1, 1, 1, 1,
-1.804017, 0.8778713, 1.192298, 0, 0, 1, 1, 1,
-1.801527, -0.4306464, -1.885742, 1, 0, 0, 1, 1,
-1.788656, 1.582533, -1.961833, 1, 0, 0, 1, 1,
-1.772138, -3.462578, -1.452679, 1, 0, 0, 1, 1,
-1.765624, -0.7173839, -0.7137204, 1, 0, 0, 1, 1,
-1.75618, 0.5231949, -0.7996361, 1, 0, 0, 1, 1,
-1.697108, 0.7037348, -1.002182, 0, 0, 0, 1, 1,
-1.696028, -0.2926356, -2.076033, 0, 0, 0, 1, 1,
-1.670701, 0.7509042, -2.50611, 0, 0, 0, 1, 1,
-1.657464, -0.5702929, -4.013107, 0, 0, 0, 1, 1,
-1.63688, 1.612728, -0.6764361, 0, 0, 0, 1, 1,
-1.629705, 2.04808, -2.359494, 0, 0, 0, 1, 1,
-1.623862, -0.5859143, -2.099708, 0, 0, 0, 1, 1,
-1.621599, 1.630533, -0.5297399, 1, 1, 1, 1, 1,
-1.600184, 1.234367, -0.6988803, 1, 1, 1, 1, 1,
-1.592582, 0.4734162, -0.7812324, 1, 1, 1, 1, 1,
-1.588829, 1.6162, -0.6577666, 1, 1, 1, 1, 1,
-1.578576, -0.02931717, -1.707168, 1, 1, 1, 1, 1,
-1.564968, 1.668663, -1.01693, 1, 1, 1, 1, 1,
-1.562021, -0.3219599, -2.467407, 1, 1, 1, 1, 1,
-1.554781, -0.7727053, -1.209787, 1, 1, 1, 1, 1,
-1.552413, -1.318477, -1.474059, 1, 1, 1, 1, 1,
-1.535286, 0.1939122, -1.818372, 1, 1, 1, 1, 1,
-1.533602, 0.05267248, -1.996867, 1, 1, 1, 1, 1,
-1.527846, -0.6168135, -1.419608, 1, 1, 1, 1, 1,
-1.526439, 1.235449, -1.269442, 1, 1, 1, 1, 1,
-1.525978, 1.163381, -0.7211607, 1, 1, 1, 1, 1,
-1.511073, -0.09378985, -2.117555, 1, 1, 1, 1, 1,
-1.507635, -1.112063, -2.023129, 0, 0, 1, 1, 1,
-1.504415, 0.9628323, -2.135751, 1, 0, 0, 1, 1,
-1.482996, 0.9606988, -2.333198, 1, 0, 0, 1, 1,
-1.478536, -0.1663285, -2.32882, 1, 0, 0, 1, 1,
-1.471222, 0.9961315, -0.7854844, 1, 0, 0, 1, 1,
-1.465166, 0.6357951, 0.7140523, 1, 0, 0, 1, 1,
-1.46099, -0.0207493, -1.806315, 0, 0, 0, 1, 1,
-1.446091, 0.6345625, -3.067965, 0, 0, 0, 1, 1,
-1.441178, -0.1595089, -0.7589853, 0, 0, 0, 1, 1,
-1.438582, -1.74863, -2.247412, 0, 0, 0, 1, 1,
-1.432539, -0.8171626, -2.314253, 0, 0, 0, 1, 1,
-1.419745, 0.09033967, -1.542905, 0, 0, 0, 1, 1,
-1.405864, 1.289924, -1.085863, 0, 0, 0, 1, 1,
-1.402552, 0.4734985, -1.426, 1, 1, 1, 1, 1,
-1.401606, 0.2644978, -1.73123, 1, 1, 1, 1, 1,
-1.385753, 0.1931971, -0.2520646, 1, 1, 1, 1, 1,
-1.384645, -0.3992434, -1.762417, 1, 1, 1, 1, 1,
-1.38356, 0.5235439, -1.273934, 1, 1, 1, 1, 1,
-1.378747, 0.8220184, -1.148561, 1, 1, 1, 1, 1,
-1.377795, -0.431835, 0.1044392, 1, 1, 1, 1, 1,
-1.36811, 0.6093014, -1.941808, 1, 1, 1, 1, 1,
-1.355568, 0.5625032, -0.6123365, 1, 1, 1, 1, 1,
-1.346911, 1.344312, -1.490242, 1, 1, 1, 1, 1,
-1.346315, 0.960223, -2.737268, 1, 1, 1, 1, 1,
-1.328422, -2.773712, -3.612198, 1, 1, 1, 1, 1,
-1.328005, 1.528887, -0.06536156, 1, 1, 1, 1, 1,
-1.32416, -0.9884098, -2.948106, 1, 1, 1, 1, 1,
-1.319497, 0.8798338, -1.56005, 1, 1, 1, 1, 1,
-1.317979, 0.7077443, -1.954879, 0, 0, 1, 1, 1,
-1.316997, 0.7234531, 0.06150737, 1, 0, 0, 1, 1,
-1.312457, 1.862412, -1.836658, 1, 0, 0, 1, 1,
-1.307364, 0.3708605, -3.052188, 1, 0, 0, 1, 1,
-1.294638, 0.2099722, -1.115056, 1, 0, 0, 1, 1,
-1.286607, 0.2095339, -2.16437, 1, 0, 0, 1, 1,
-1.284666, -0.6610811, -1.463273, 0, 0, 0, 1, 1,
-1.283545, -0.2163242, -1.771167, 0, 0, 0, 1, 1,
-1.275657, -0.9975359, -1.78397, 0, 0, 0, 1, 1,
-1.270519, -0.383625, -2.390536, 0, 0, 0, 1, 1,
-1.265209, 0.212439, -1.671124, 0, 0, 0, 1, 1,
-1.263837, -1.863019, -1.708926, 0, 0, 0, 1, 1,
-1.259722, -0.4558175, 0.4159445, 0, 0, 0, 1, 1,
-1.258257, -1.839839, -4.269024, 1, 1, 1, 1, 1,
-1.257628, -0.3796864, -1.609835, 1, 1, 1, 1, 1,
-1.255931, 0.7352214, -0.1057512, 1, 1, 1, 1, 1,
-1.255034, 1.54244, -0.7801673, 1, 1, 1, 1, 1,
-1.249653, -0.08226749, -0.4382127, 1, 1, 1, 1, 1,
-1.247572, 0.06074364, 0.4954864, 1, 1, 1, 1, 1,
-1.236036, -1.283401, -2.65964, 1, 1, 1, 1, 1,
-1.235108, -0.7432467, -1.565113, 1, 1, 1, 1, 1,
-1.22951, 0.9471355, 0.01150239, 1, 1, 1, 1, 1,
-1.227385, 0.8991931, -1.228949, 1, 1, 1, 1, 1,
-1.219597, -0.6765435, -2.064138, 1, 1, 1, 1, 1,
-1.218271, -1.334933, -4.036992, 1, 1, 1, 1, 1,
-1.212092, -0.4152638, -3.251821, 1, 1, 1, 1, 1,
-1.209775, 1.478922, -1.237872, 1, 1, 1, 1, 1,
-1.208959, -1.232716, -2.316076, 1, 1, 1, 1, 1,
-1.201791, 0.3870322, -0.8502123, 0, 0, 1, 1, 1,
-1.191676, -0.05738487, 0.2611777, 1, 0, 0, 1, 1,
-1.190211, -0.8230422, -1.259166, 1, 0, 0, 1, 1,
-1.189756, 1.221023, -1.03752, 1, 0, 0, 1, 1,
-1.176017, -2.192563, -1.264391, 1, 0, 0, 1, 1,
-1.170704, -1.429499, -1.919448, 1, 0, 0, 1, 1,
-1.168625, -0.3113798, -1.190752, 0, 0, 0, 1, 1,
-1.165318, -0.5180621, -2.18955, 0, 0, 0, 1, 1,
-1.162899, -1.760607, -2.197441, 0, 0, 0, 1, 1,
-1.159088, -0.5455521, -1.96921, 0, 0, 0, 1, 1,
-1.151476, 0.9012654, -0.5402339, 0, 0, 0, 1, 1,
-1.151199, -0.8114685, -2.416378, 0, 0, 0, 1, 1,
-1.132043, -0.5977999, -2.614155, 0, 0, 0, 1, 1,
-1.111124, -0.122072, -1.602191, 1, 1, 1, 1, 1,
-1.110594, 0.1037884, -0.944405, 1, 1, 1, 1, 1,
-1.10989, -0.1458223, -2.61483, 1, 1, 1, 1, 1,
-1.108829, 0.04170964, -0.6049246, 1, 1, 1, 1, 1,
-1.108146, -1.559716, -2.214215, 1, 1, 1, 1, 1,
-1.106191, -0.3585876, -2.500807, 1, 1, 1, 1, 1,
-1.104555, -0.05152683, -1.209195, 1, 1, 1, 1, 1,
-1.097378, 1.143317, 0.01505106, 1, 1, 1, 1, 1,
-1.096289, -0.5881291, -2.12531, 1, 1, 1, 1, 1,
-1.094159, 0.5926741, -1.023458, 1, 1, 1, 1, 1,
-1.093846, -0.1176659, -2.618887, 1, 1, 1, 1, 1,
-1.091987, 0.145843, -1.106411, 1, 1, 1, 1, 1,
-1.091618, 0.3613323, -1.8534, 1, 1, 1, 1, 1,
-1.090459, 0.4955564, -2.344667, 1, 1, 1, 1, 1,
-1.089353, -0.3709258, -1.898866, 1, 1, 1, 1, 1,
-1.086994, -0.2896097, -0.2778658, 0, 0, 1, 1, 1,
-1.084954, -0.8656564, -3.796922, 1, 0, 0, 1, 1,
-1.080918, -1.975712, -2.33104, 1, 0, 0, 1, 1,
-1.071794, -0.2837385, -1.521311, 1, 0, 0, 1, 1,
-1.071487, 0.7632644, -0.8746684, 1, 0, 0, 1, 1,
-1.06389, 1.753544, -0.7286144, 1, 0, 0, 1, 1,
-1.055615, -0.6474167, -1.731736, 0, 0, 0, 1, 1,
-1.0497, -1.127308, -0.9713628, 0, 0, 0, 1, 1,
-1.049601, 0.3983778, -1.29338, 0, 0, 0, 1, 1,
-1.046239, -0.5123156, -3.679266, 0, 0, 0, 1, 1,
-1.031105, 0.3205682, -1.533447, 0, 0, 0, 1, 1,
-1.027847, 0.7911728, -0.05590073, 0, 0, 0, 1, 1,
-1.025735, 0.4206199, -0.3152378, 0, 0, 0, 1, 1,
-1.016414, -0.5086759, -1.103006, 1, 1, 1, 1, 1,
-1.014654, 0.01892003, -0.8028126, 1, 1, 1, 1, 1,
-1.012149, -0.9378701, -2.043791, 1, 1, 1, 1, 1,
-1.004847, 1.190679, 0.1354798, 1, 1, 1, 1, 1,
-0.9983975, 0.5086247, -2.67698, 1, 1, 1, 1, 1,
-0.9982668, -0.3783993, -0.7274495, 1, 1, 1, 1, 1,
-0.9934194, 0.7980973, -0.4321866, 1, 1, 1, 1, 1,
-0.9934053, -1.02338, -3.654387, 1, 1, 1, 1, 1,
-0.9872319, -2.415865, -1.428551, 1, 1, 1, 1, 1,
-0.9864278, -1.13687, -5.489566, 1, 1, 1, 1, 1,
-0.9839666, 0.81868, 0.2078736, 1, 1, 1, 1, 1,
-0.9823409, 1.514054, -1.772268, 1, 1, 1, 1, 1,
-0.9815843, 0.7649451, -0.8296641, 1, 1, 1, 1, 1,
-0.9779257, -0.6162019, -2.412254, 1, 1, 1, 1, 1,
-0.9733026, -2.488277, -3.009361, 1, 1, 1, 1, 1,
-0.9583369, -0.6163905, -0.7770263, 0, 0, 1, 1, 1,
-0.9582752, 0.08506587, 0.08647902, 1, 0, 0, 1, 1,
-0.9551532, -0.4399278, -0.6181206, 1, 0, 0, 1, 1,
-0.9550333, -0.6865644, -1.93098, 1, 0, 0, 1, 1,
-0.954441, -1.369725, -1.83093, 1, 0, 0, 1, 1,
-0.9488618, 0.08230932, -0.9227971, 1, 0, 0, 1, 1,
-0.9476991, 0.5583459, -0.9320915, 0, 0, 0, 1, 1,
-0.9473184, -0.06517036, -1.937027, 0, 0, 0, 1, 1,
-0.9408028, 0.01462175, -1.018496, 0, 0, 0, 1, 1,
-0.9380069, -1.874889, -3.8392, 0, 0, 0, 1, 1,
-0.9353364, 0.6112093, -0.00212224, 0, 0, 0, 1, 1,
-0.9307944, -0.4033292, -1.432515, 0, 0, 0, 1, 1,
-0.9262352, 1.494681, -0.4979457, 0, 0, 0, 1, 1,
-0.921852, -1.732388, -1.470808, 1, 1, 1, 1, 1,
-0.9200187, 1.09954, -0.7616116, 1, 1, 1, 1, 1,
-0.9167765, 0.2268137, -1.058555, 1, 1, 1, 1, 1,
-0.9166063, 0.9481089, -0.8650125, 1, 1, 1, 1, 1,
-0.9112469, -1.817738, -2.359154, 1, 1, 1, 1, 1,
-0.9077755, 0.9851403, -1.276289, 1, 1, 1, 1, 1,
-0.9075637, 0.02354672, -1.767156, 1, 1, 1, 1, 1,
-0.9028525, 1.214024, -1.875993, 1, 1, 1, 1, 1,
-0.9015529, 0.1496376, -1.038347, 1, 1, 1, 1, 1,
-0.8977299, 0.2241406, -0.5708945, 1, 1, 1, 1, 1,
-0.897535, 0.5707372, -1.824879, 1, 1, 1, 1, 1,
-0.8953103, -0.9077603, -3.8949, 1, 1, 1, 1, 1,
-0.8889937, -1.808494, -3.854061, 1, 1, 1, 1, 1,
-0.8881099, 1.231501, -1.142333, 1, 1, 1, 1, 1,
-0.8752956, 0.7240409, -1.915436, 1, 1, 1, 1, 1,
-0.8751605, -0.2610852, -0.5927298, 0, 0, 1, 1, 1,
-0.8696355, -1.143788, -2.466645, 1, 0, 0, 1, 1,
-0.8656294, 0.838192, -0.8455423, 1, 0, 0, 1, 1,
-0.8636683, -0.2575718, -1.02195, 1, 0, 0, 1, 1,
-0.8604279, 1.066194, -1.47029, 1, 0, 0, 1, 1,
-0.8595105, 0.2393997, -2.803528, 1, 0, 0, 1, 1,
-0.8591071, 0.002969301, -0.9691916, 0, 0, 0, 1, 1,
-0.858533, 0.7169532, -0.03130131, 0, 0, 0, 1, 1,
-0.8533087, 0.4661541, -1.036256, 0, 0, 0, 1, 1,
-0.8527534, 0.4832134, -1.517268, 0, 0, 0, 1, 1,
-0.8499738, 1.986785, 0.7449809, 0, 0, 0, 1, 1,
-0.8494179, 0.4587829, -0.8535458, 0, 0, 0, 1, 1,
-0.8420497, 0.9757352, -0.1493658, 0, 0, 0, 1, 1,
-0.8399816, -2.513507, -0.7204527, 1, 1, 1, 1, 1,
-0.8341932, 0.3702428, 0.81263, 1, 1, 1, 1, 1,
-0.8326589, 1.177148, -0.3700314, 1, 1, 1, 1, 1,
-0.8304477, 1.435148, 1.434958, 1, 1, 1, 1, 1,
-0.8269315, -1.273971, -2.26647, 1, 1, 1, 1, 1,
-0.8267899, -0.06544805, -1.689713, 1, 1, 1, 1, 1,
-0.8256918, 1.778986, -2.513998, 1, 1, 1, 1, 1,
-0.8205422, -0.2305719, -0.6888698, 1, 1, 1, 1, 1,
-0.8137012, 0.8712096, 0.03451223, 1, 1, 1, 1, 1,
-0.8095745, 1.514462, 0.7332128, 1, 1, 1, 1, 1,
-0.8078243, -0.1575516, -0.4862994, 1, 1, 1, 1, 1,
-0.8043984, 1.944441, -1.185651, 1, 1, 1, 1, 1,
-0.8011689, 0.1073607, -1.995142, 1, 1, 1, 1, 1,
-0.7971945, -0.9653576, -1.789025, 1, 1, 1, 1, 1,
-0.7965835, -0.78491, -0.9238945, 1, 1, 1, 1, 1,
-0.7899536, -0.3289822, -1.652629, 0, 0, 1, 1, 1,
-0.7899395, 0.6740096, -0.7802805, 1, 0, 0, 1, 1,
-0.7892406, 1.109335, -0.06103082, 1, 0, 0, 1, 1,
-0.7872078, 1.613077, -2.021353, 1, 0, 0, 1, 1,
-0.7857126, -1.54999, -4.83181, 1, 0, 0, 1, 1,
-0.777244, -1.075892, -0.9939436, 1, 0, 0, 1, 1,
-0.7770878, 0.04554955, -0.4014091, 0, 0, 0, 1, 1,
-0.7718181, -0.2529339, -2.174515, 0, 0, 0, 1, 1,
-0.7701189, 0.9701597, -1.26068, 0, 0, 0, 1, 1,
-0.768491, -1.710915, -3.974873, 0, 0, 0, 1, 1,
-0.7650156, -0.8003904, -0.6827241, 0, 0, 0, 1, 1,
-0.7634466, 1.072614, -1.509963, 0, 0, 0, 1, 1,
-0.7606152, -0.869, -3.485265, 0, 0, 0, 1, 1,
-0.7564839, -1.633891, -2.011111, 1, 1, 1, 1, 1,
-0.7548876, -1.537191, -3.39761, 1, 1, 1, 1, 1,
-0.754352, 1.676605, -0.4713573, 1, 1, 1, 1, 1,
-0.7460927, 0.9656433, 0.2264291, 1, 1, 1, 1, 1,
-0.7449801, 1.513327, -1.055951, 1, 1, 1, 1, 1,
-0.7419629, 0.1008244, -2.052826, 1, 1, 1, 1, 1,
-0.7417945, -0.7288681, -1.740669, 1, 1, 1, 1, 1,
-0.7403831, 0.7509575, -2.343203, 1, 1, 1, 1, 1,
-0.7400445, -1.574473, -3.220325, 1, 1, 1, 1, 1,
-0.7369272, -0.07989747, -2.647568, 1, 1, 1, 1, 1,
-0.7302489, -0.2156549, -2.83846, 1, 1, 1, 1, 1,
-0.7261669, 0.6070877, -0.5798339, 1, 1, 1, 1, 1,
-0.7230008, 0.1122484, -1.578161, 1, 1, 1, 1, 1,
-0.7167997, 0.04394033, -0.08415774, 1, 1, 1, 1, 1,
-0.7060544, 0.06506443, -2.359626, 1, 1, 1, 1, 1,
-0.7035105, 0.8469806, -1.36552, 0, 0, 1, 1, 1,
-0.7008291, 1.671224, -0.587707, 1, 0, 0, 1, 1,
-0.6980503, -2.666936, -3.39706, 1, 0, 0, 1, 1,
-0.6916212, -1.57963, -2.667125, 1, 0, 0, 1, 1,
-0.6897362, -0.1203521, -2.564961, 1, 0, 0, 1, 1,
-0.6874589, -0.1908476, -0.2169698, 1, 0, 0, 1, 1,
-0.6846658, 1.009462, -2.440792, 0, 0, 0, 1, 1,
-0.6827059, 0.7340214, -0.04585963, 0, 0, 0, 1, 1,
-0.6818574, 0.9834267, -0.06460233, 0, 0, 0, 1, 1,
-0.6759141, -0.9173675, -3.612415, 0, 0, 0, 1, 1,
-0.6741554, 0.6692758, 0.8106315, 0, 0, 0, 1, 1,
-0.6705711, -0.9553022, -2.857684, 0, 0, 0, 1, 1,
-0.6634918, -0.01516219, -2.701515, 0, 0, 0, 1, 1,
-0.6600204, -1.160329, -1.661481, 1, 1, 1, 1, 1,
-0.6593385, 0.2878031, -0.4892048, 1, 1, 1, 1, 1,
-0.6592237, 1.470489, -1.832646, 1, 1, 1, 1, 1,
-0.6513133, 0.07561695, -1.564074, 1, 1, 1, 1, 1,
-0.6446042, 0.3040785, -0.09768096, 1, 1, 1, 1, 1,
-0.6411945, -0.6117793, -2.594408, 1, 1, 1, 1, 1,
-0.6356618, 1.188147, 2.095122, 1, 1, 1, 1, 1,
-0.6336626, -0.003210128, -0.5324464, 1, 1, 1, 1, 1,
-0.633478, 0.5816072, 0.3546684, 1, 1, 1, 1, 1,
-0.6292749, -1.093658, -2.314393, 1, 1, 1, 1, 1,
-0.6277, 1.139099, -2.168719, 1, 1, 1, 1, 1,
-0.621412, -0.7955548, -2.079604, 1, 1, 1, 1, 1,
-0.6202829, -1.424112, -2.392147, 1, 1, 1, 1, 1,
-0.6201658, -0.1633725, -2.73607, 1, 1, 1, 1, 1,
-0.619317, 0.4945736, -0.6204777, 1, 1, 1, 1, 1,
-0.6182778, 0.4081821, -2.782689, 0, 0, 1, 1, 1,
-0.6148015, 2.436122, 0.005685094, 1, 0, 0, 1, 1,
-0.6121858, -0.7676002, 0.7719831, 1, 0, 0, 1, 1,
-0.608124, -0.3577994, -2.360291, 1, 0, 0, 1, 1,
-0.6069796, 1.113905, -0.4160851, 1, 0, 0, 1, 1,
-0.6069564, 0.7653979, 0.4805238, 1, 0, 0, 1, 1,
-0.6053654, -0.5344796, -1.302092, 0, 0, 0, 1, 1,
-0.6044161, -0.5058512, -3.764082, 0, 0, 0, 1, 1,
-0.5968722, -1.892164, -3.88566, 0, 0, 0, 1, 1,
-0.5955319, -0.6542559, -1.421171, 0, 0, 0, 1, 1,
-0.5858881, -0.8593901, -2.612296, 0, 0, 0, 1, 1,
-0.5858535, 1.371641, 0.4942596, 0, 0, 0, 1, 1,
-0.5820539, -1.436283, -2.344278, 0, 0, 0, 1, 1,
-0.5766664, -0.1392576, -1.930565, 1, 1, 1, 1, 1,
-0.5722116, 0.2879362, -0.3221547, 1, 1, 1, 1, 1,
-0.5702044, 2.025776, -1.221365, 1, 1, 1, 1, 1,
-0.5641209, 0.1631949, -0.1253499, 1, 1, 1, 1, 1,
-0.5639644, 0.02901955, -1.10389, 1, 1, 1, 1, 1,
-0.5626709, -0.002119443, -1.961099, 1, 1, 1, 1, 1,
-0.5587065, 0.5122344, -2.057465, 1, 1, 1, 1, 1,
-0.551659, 1.385128, -1.47228, 1, 1, 1, 1, 1,
-0.5450104, 0.7758396, -1.400716, 1, 1, 1, 1, 1,
-0.5423471, -0.8868619, -3.539958, 1, 1, 1, 1, 1,
-0.5396616, -1.232463, -3.23333, 1, 1, 1, 1, 1,
-0.5337673, 2.044987, -0.5907902, 1, 1, 1, 1, 1,
-0.5329178, -0.7530601, -2.487873, 1, 1, 1, 1, 1,
-0.5326925, -1.239732, -1.039068, 1, 1, 1, 1, 1,
-0.5191787, -0.828232, -2.927272, 1, 1, 1, 1, 1,
-0.5190937, 0.2258918, -2.166226, 0, 0, 1, 1, 1,
-0.5101866, -0.135851, -1.96805, 1, 0, 0, 1, 1,
-0.5016857, -0.03968438, -2.634312, 1, 0, 0, 1, 1,
-0.5015422, -1.0031, -1.204263, 1, 0, 0, 1, 1,
-0.4970235, 0.7029403, 0.5618618, 1, 0, 0, 1, 1,
-0.4945737, 0.1669472, -0.7084398, 1, 0, 0, 1, 1,
-0.4879189, -0.6103606, -2.846112, 0, 0, 0, 1, 1,
-0.4808227, 0.1504437, -0.8219121, 0, 0, 0, 1, 1,
-0.4754075, -0.4395998, -3.114259, 0, 0, 0, 1, 1,
-0.4718984, -0.3890225, -1.482309, 0, 0, 0, 1, 1,
-0.4634538, 0.1448247, 0.3098728, 0, 0, 0, 1, 1,
-0.4629149, -0.2503104, -2.150994, 0, 0, 0, 1, 1,
-0.4603319, -0.3377194, -3.743619, 0, 0, 0, 1, 1,
-0.4568964, 1.048691, 0.2825105, 1, 1, 1, 1, 1,
-0.4559528, -1.188877, -5.439095, 1, 1, 1, 1, 1,
-0.4553006, -0.4160157, -2.048491, 1, 1, 1, 1, 1,
-0.45501, 1.573919, -0.05909889, 1, 1, 1, 1, 1,
-0.4543785, -0.04116839, -2.933207, 1, 1, 1, 1, 1,
-0.4496303, -1.153447, -2.772309, 1, 1, 1, 1, 1,
-0.448684, 0.3924375, -1.838193, 1, 1, 1, 1, 1,
-0.4472012, -0.9577305, -1.713387, 1, 1, 1, 1, 1,
-0.4469004, 1.374934, -1.031518, 1, 1, 1, 1, 1,
-0.4430599, -2.067839, -1.972949, 1, 1, 1, 1, 1,
-0.4381057, -0.104385, -1.548364, 1, 1, 1, 1, 1,
-0.4378238, -0.6810089, -3.822756, 1, 1, 1, 1, 1,
-0.4333195, 0.2265033, -0.7220064, 1, 1, 1, 1, 1,
-0.4296518, -0.1296654, -3.384631, 1, 1, 1, 1, 1,
-0.4288839, -0.006841907, -1.257887, 1, 1, 1, 1, 1,
-0.4265867, -1.079997, -1.488487, 0, 0, 1, 1, 1,
-0.424236, 1.279768, -0.7061317, 1, 0, 0, 1, 1,
-0.4239276, 1.250918, -1.742439, 1, 0, 0, 1, 1,
-0.4214542, -0.4835251, -1.719081, 1, 0, 0, 1, 1,
-0.4172384, -0.9109015, -2.79998, 1, 0, 0, 1, 1,
-0.4103107, 0.5726044, 0.7614894, 1, 0, 0, 1, 1,
-0.4022035, 0.07046717, -3.023293, 0, 0, 0, 1, 1,
-0.4009818, 0.6881526, -0.6003753, 0, 0, 0, 1, 1,
-0.3981226, -1.332517, -3.065264, 0, 0, 0, 1, 1,
-0.3940314, -0.01208054, -1.524632, 0, 0, 0, 1, 1,
-0.3937745, -1.434047, -4.196414, 0, 0, 0, 1, 1,
-0.3919266, -0.5469128, -2.222358, 0, 0, 0, 1, 1,
-0.3889606, -0.1235177, -2.522451, 0, 0, 0, 1, 1,
-0.3846656, 0.9898334, -0.8809581, 1, 1, 1, 1, 1,
-0.3819025, -1.189517, -2.665751, 1, 1, 1, 1, 1,
-0.3795426, 0.07452992, -1.246858, 1, 1, 1, 1, 1,
-0.3793993, -1.026677, -3.579328, 1, 1, 1, 1, 1,
-0.3700036, 0.8195961, -0.8363485, 1, 1, 1, 1, 1,
-0.3678562, 1.21063, 0.3508327, 1, 1, 1, 1, 1,
-0.3675353, -0.3028423, -2.458069, 1, 1, 1, 1, 1,
-0.365742, -0.007081135, -0.4009959, 1, 1, 1, 1, 1,
-0.3603022, 0.02595372, -2.172266, 1, 1, 1, 1, 1,
-0.3545341, -0.8003578, -2.54454, 1, 1, 1, 1, 1,
-0.3533834, -1.096569, -4.446023, 1, 1, 1, 1, 1,
-0.3526249, 0.6884438, -0.4530879, 1, 1, 1, 1, 1,
-0.3506584, 1.351758, -0.6918647, 1, 1, 1, 1, 1,
-0.3479216, 0.4033035, -0.2012891, 1, 1, 1, 1, 1,
-0.3435615, -1.957651, -3.114552, 1, 1, 1, 1, 1,
-0.3389167, -0.7722673, -4.69201, 0, 0, 1, 1, 1,
-0.3280808, 0.2315622, -1.052184, 1, 0, 0, 1, 1,
-0.3261529, 0.2047343, -1.353323, 1, 0, 0, 1, 1,
-0.3224844, 1.379564, -2.316006, 1, 0, 0, 1, 1,
-0.3224359, -0.9379326, -2.434284, 1, 0, 0, 1, 1,
-0.3131099, -0.5009753, -1.692012, 1, 0, 0, 1, 1,
-0.3115286, -0.9215516, -1.646731, 0, 0, 0, 1, 1,
-0.3108394, -0.153349, -2.808604, 0, 0, 0, 1, 1,
-0.3090041, 1.356355, 0.2601906, 0, 0, 0, 1, 1,
-0.3062722, 0.1273006, -1.840102, 0, 0, 0, 1, 1,
-0.3060546, 1.044067, -3.27597, 0, 0, 0, 1, 1,
-0.3031325, -0.3312995, -1.560687, 0, 0, 0, 1, 1,
-0.2976616, -0.6624036, -3.415997, 0, 0, 0, 1, 1,
-0.2970562, -1.787766, -3.839827, 1, 1, 1, 1, 1,
-0.2885637, -1.041957, -3.975344, 1, 1, 1, 1, 1,
-0.286945, -1.141785, -2.933837, 1, 1, 1, 1, 1,
-0.2850015, 0.6923022, -0.269329, 1, 1, 1, 1, 1,
-0.2816264, -0.6228678, -0.6247304, 1, 1, 1, 1, 1,
-0.2759493, -1.434235, -2.553975, 1, 1, 1, 1, 1,
-0.2685772, -0.2051272, -1.707946, 1, 1, 1, 1, 1,
-0.2642567, 0.7602978, 0.7877798, 1, 1, 1, 1, 1,
-0.2642311, 0.1323202, 0.01308561, 1, 1, 1, 1, 1,
-0.2627752, 1.512363, -1.864438, 1, 1, 1, 1, 1,
-0.2579346, -0.9783242, -1.835861, 1, 1, 1, 1, 1,
-0.2578222, -0.6704671, -2.547917, 1, 1, 1, 1, 1,
-0.2533243, -0.3874461, -2.600715, 1, 1, 1, 1, 1,
-0.2527118, 0.5360432, -0.5176484, 1, 1, 1, 1, 1,
-0.2526851, 1.550377, 0.9085698, 1, 1, 1, 1, 1,
-0.2525047, 0.5297096, -1.427776, 0, 0, 1, 1, 1,
-0.2519532, -0.5312139, -4.093005, 1, 0, 0, 1, 1,
-0.2396099, 1.095722, 0.003866209, 1, 0, 0, 1, 1,
-0.2379204, 0.5408973, -0.486253, 1, 0, 0, 1, 1,
-0.230016, -1.60866, -2.562641, 1, 0, 0, 1, 1,
-0.2280419, -0.6158218, -2.904973, 1, 0, 0, 1, 1,
-0.2243236, 0.5443483, -1.732882, 0, 0, 0, 1, 1,
-0.2241781, 0.7108313, 0.578095, 0, 0, 0, 1, 1,
-0.2161244, 0.2301611, -1.860862, 0, 0, 0, 1, 1,
-0.2141839, -1.520882, -3.511058, 0, 0, 0, 1, 1,
-0.2099548, 0.4011575, -1.043097, 0, 0, 0, 1, 1,
-0.2054841, -0.4658794, -1.250159, 0, 0, 0, 1, 1,
-0.2051292, 0.08791925, 0.5595614, 0, 0, 0, 1, 1,
-0.2029005, 0.1258963, -1.56765, 1, 1, 1, 1, 1,
-0.2022034, 0.8250814, -1.105016, 1, 1, 1, 1, 1,
-0.1981821, 0.9415486, 0.534776, 1, 1, 1, 1, 1,
-0.1977244, -1.605207, -4.661958, 1, 1, 1, 1, 1,
-0.1947072, -0.3422492, -3.384022, 1, 1, 1, 1, 1,
-0.1917534, -1.274959, -2.481048, 1, 1, 1, 1, 1,
-0.1908894, -1.31459, -2.554498, 1, 1, 1, 1, 1,
-0.1858753, 0.3071883, 0.5395196, 1, 1, 1, 1, 1,
-0.1806202, -0.2536746, -1.305901, 1, 1, 1, 1, 1,
-0.1800182, -0.04566991, -1.831954, 1, 1, 1, 1, 1,
-0.1796622, 1.413074, -0.9434274, 1, 1, 1, 1, 1,
-0.1761294, 0.06366056, -1.588332, 1, 1, 1, 1, 1,
-0.1734671, -0.4309651, -1.720148, 1, 1, 1, 1, 1,
-0.1714009, 1.442506, -0.7817126, 1, 1, 1, 1, 1,
-0.1683807, 1.087959, -0.2268471, 1, 1, 1, 1, 1,
-0.1654637, -0.4195467, -2.858508, 0, 0, 1, 1, 1,
-0.1630175, 0.3102299, 1.095289, 1, 0, 0, 1, 1,
-0.1621912, -1.39547, -3.923402, 1, 0, 0, 1, 1,
-0.160414, 0.7220517, 0.5687748, 1, 0, 0, 1, 1,
-0.1558397, -0.6228775, -3.122276, 1, 0, 0, 1, 1,
-0.1529175, -0.844235, -2.653137, 1, 0, 0, 1, 1,
-0.1495958, 1.258767, -0.4519255, 0, 0, 0, 1, 1,
-0.1485475, -0.09408336, -2.518778, 0, 0, 0, 1, 1,
-0.1470717, -0.3467253, -3.466824, 0, 0, 0, 1, 1,
-0.1459745, 0.5024126, 1.112153, 0, 0, 0, 1, 1,
-0.1446411, -2.024602, -4.501151, 0, 0, 0, 1, 1,
-0.1445729, 1.044933, -0.5490023, 0, 0, 0, 1, 1,
-0.1387775, -0.8543149, -2.425075, 0, 0, 0, 1, 1,
-0.1379875, 1.154277, 1.82474, 1, 1, 1, 1, 1,
-0.1371923, 0.9983946, 0.0548877, 1, 1, 1, 1, 1,
-0.1365555, 0.7078421, -1.053301, 1, 1, 1, 1, 1,
-0.1347986, -0.06793834, -0.9070699, 1, 1, 1, 1, 1,
-0.134081, 1.432803, -1.013233, 1, 1, 1, 1, 1,
-0.1298107, 0.3543405, -0.7827147, 1, 1, 1, 1, 1,
-0.1282994, -0.1889148, -2.920232, 1, 1, 1, 1, 1,
-0.1217814, -1.357643, -1.577059, 1, 1, 1, 1, 1,
-0.1168415, -0.5599166, -3.408811, 1, 1, 1, 1, 1,
-0.1156389, 0.7110699, -0.08291601, 1, 1, 1, 1, 1,
-0.1151318, 1.142425, 0.562953, 1, 1, 1, 1, 1,
-0.1146285, 0.09424463, -0.3633687, 1, 1, 1, 1, 1,
-0.1117881, -1.932708, -2.114312, 1, 1, 1, 1, 1,
-0.1107923, -1.074988, -4.918515, 1, 1, 1, 1, 1,
-0.09870487, -0.3808179, -2.101156, 1, 1, 1, 1, 1,
-0.09430384, 0.6777479, 0.9416562, 0, 0, 1, 1, 1,
-0.0933814, -0.6100308, -4.046134, 1, 0, 0, 1, 1,
-0.08728661, 1.065194, -1.397329, 1, 0, 0, 1, 1,
-0.084245, 1.21431, -1.695051, 1, 0, 0, 1, 1,
-0.07400607, -1.110899, -2.918406, 1, 0, 0, 1, 1,
-0.07314558, -1.770345, -1.87334, 1, 0, 0, 1, 1,
-0.07295042, 0.8926402, 0.2291244, 0, 0, 0, 1, 1,
-0.07044059, 0.5517674, -0.01873801, 0, 0, 0, 1, 1,
-0.07013386, -1.564928, -2.561984, 0, 0, 0, 1, 1,
-0.06601533, -0.4323976, -3.52669, 0, 0, 0, 1, 1,
-0.06312343, 1.543161, 1.215542, 0, 0, 0, 1, 1,
-0.0584939, 0.7834548, -2.09775, 0, 0, 0, 1, 1,
-0.03587988, 0.1251571, 2.045278, 0, 0, 0, 1, 1,
-0.03503221, 0.784373, -0.8915811, 1, 1, 1, 1, 1,
-0.03129953, 1.089065, -1.058378, 1, 1, 1, 1, 1,
-0.02975934, 1.184882, -0.609498, 1, 1, 1, 1, 1,
-0.02862418, -1.086346, -3.420503, 1, 1, 1, 1, 1,
-0.02537692, 0.5543108, 1.278828, 1, 1, 1, 1, 1,
-0.02252519, -0.5126953, -1.97299, 1, 1, 1, 1, 1,
-0.02161012, -0.8876407, -2.198448, 1, 1, 1, 1, 1,
-0.0196193, -0.06278478, -1.249662, 1, 1, 1, 1, 1,
-0.01921489, 1.026676, -0.8107471, 1, 1, 1, 1, 1,
-0.01542885, -0.6361858, -4.423804, 1, 1, 1, 1, 1,
-0.01176783, 0.8571399, -1.020848, 1, 1, 1, 1, 1,
-0.008118813, 0.554555, 0.3046691, 1, 1, 1, 1, 1,
-0.004094403, 0.3290634, -0.1936216, 1, 1, 1, 1, 1,
-0.0008650656, 0.2992975, 1.191285, 1, 1, 1, 1, 1,
0.005890333, -0.3732219, 3.684061, 1, 1, 1, 1, 1,
0.006146585, -0.1300141, 3.451778, 0, 0, 1, 1, 1,
0.006601836, -0.8257003, 4.581094, 1, 0, 0, 1, 1,
0.009403078, 1.34642, -2.372092, 1, 0, 0, 1, 1,
0.009969742, -0.4076722, 2.985841, 1, 0, 0, 1, 1,
0.01015825, 0.3354891, -0.2391185, 1, 0, 0, 1, 1,
0.01825589, 0.8634151, -0.7052077, 1, 0, 0, 1, 1,
0.02097284, 0.4731175, 0.4032658, 0, 0, 0, 1, 1,
0.0242738, -0.7949736, 4.788156, 0, 0, 0, 1, 1,
0.03028863, 0.8968238, -0.5207738, 0, 0, 0, 1, 1,
0.03294251, 1.510856, -0.5914834, 0, 0, 0, 1, 1,
0.03456647, 0.6176144, 0.2789015, 0, 0, 0, 1, 1,
0.03538012, -0.3543377, 3.188809, 0, 0, 0, 1, 1,
0.03666651, 1.17406, 2.41537, 0, 0, 0, 1, 1,
0.03686216, -1.006939, 5.357016, 1, 1, 1, 1, 1,
0.03967603, -1.936494, 1.822487, 1, 1, 1, 1, 1,
0.04066254, 0.023149, -0.3412813, 1, 1, 1, 1, 1,
0.04125831, -1.287928, 4.90225, 1, 1, 1, 1, 1,
0.04129954, 1.705873, -0.1017365, 1, 1, 1, 1, 1,
0.04805136, 1.037407, -1.507542, 1, 1, 1, 1, 1,
0.05754549, 0.7061347, -0.004242793, 1, 1, 1, 1, 1,
0.06096103, 1.805503, 1.176412, 1, 1, 1, 1, 1,
0.06308731, -1.037623, 4.123898, 1, 1, 1, 1, 1,
0.0635545, -1.428112, 2.895979, 1, 1, 1, 1, 1,
0.06466229, -0.5363386, 3.648711, 1, 1, 1, 1, 1,
0.06847281, -1.601995, 4.974725, 1, 1, 1, 1, 1,
0.06870513, 0.1111835, 0.4255973, 1, 1, 1, 1, 1,
0.07583303, 0.9877588, 1.699568, 1, 1, 1, 1, 1,
0.07614646, -0.8491655, 3.31678, 1, 1, 1, 1, 1,
0.08065394, 0.20865, -0.1016751, 0, 0, 1, 1, 1,
0.08730269, -0.3992223, 3.821658, 1, 0, 0, 1, 1,
0.08949633, -1.502657, 1.820801, 1, 0, 0, 1, 1,
0.09061125, -1.032925, 4.194658, 1, 0, 0, 1, 1,
0.09138348, 0.1553488, 0.7625079, 1, 0, 0, 1, 1,
0.09579384, -0.4861678, 3.864677, 1, 0, 0, 1, 1,
0.1003189, -1.45924, 4.876248, 0, 0, 0, 1, 1,
0.1047775, 0.4022463, 0.4684278, 0, 0, 0, 1, 1,
0.1064699, -0.01783228, 0.9211474, 0, 0, 0, 1, 1,
0.1095239, 0.2460332, -0.9635251, 0, 0, 0, 1, 1,
0.1097756, 1.48668, 0.3677439, 0, 0, 0, 1, 1,
0.1131503, -1.477817, 3.768367, 0, 0, 0, 1, 1,
0.1140611, 0.5828244, 0.954819, 0, 0, 0, 1, 1,
0.114893, 0.7028518, 0.2472846, 1, 1, 1, 1, 1,
0.1157557, 1.574011, 0.8937261, 1, 1, 1, 1, 1,
0.1164582, 0.432958, 0.9886667, 1, 1, 1, 1, 1,
0.1173445, -0.3025301, 1.951909, 1, 1, 1, 1, 1,
0.1186588, -1.076877, 3.021533, 1, 1, 1, 1, 1,
0.1222152, -0.5312967, 2.605446, 1, 1, 1, 1, 1,
0.1237974, 0.2360254, -0.163778, 1, 1, 1, 1, 1,
0.126492, 0.7279735, 0.2792875, 1, 1, 1, 1, 1,
0.1315043, 2.016115, 2.109046, 1, 1, 1, 1, 1,
0.1328026, 0.6212016, 0.1603392, 1, 1, 1, 1, 1,
0.1353075, -0.461551, 2.214293, 1, 1, 1, 1, 1,
0.1360951, -0.8176183, 2.448915, 1, 1, 1, 1, 1,
0.1374313, 0.4272434, 0.8882447, 1, 1, 1, 1, 1,
0.1376927, 0.1180602, -0.6630718, 1, 1, 1, 1, 1,
0.1392037, 0.2860917, -0.08148643, 1, 1, 1, 1, 1,
0.1420778, -0.01739515, 0.8195353, 0, 0, 1, 1, 1,
0.1427353, -0.09399319, 3.433975, 1, 0, 0, 1, 1,
0.1442008, -1.786202, 2.568029, 1, 0, 0, 1, 1,
0.1458833, 0.4077131, 0.6473418, 1, 0, 0, 1, 1,
0.1480954, 1.176151, 0.676103, 1, 0, 0, 1, 1,
0.1500585, -0.3048104, 2.334173, 1, 0, 0, 1, 1,
0.1513861, -0.3238924, 3.555726, 0, 0, 0, 1, 1,
0.1524977, 0.1444168, 1.626287, 0, 0, 0, 1, 1,
0.1619982, 0.07588168, -0.1158675, 0, 0, 0, 1, 1,
0.1680461, -1.208033, 3.22487, 0, 0, 0, 1, 1,
0.1704793, -1.201614, 3.375321, 0, 0, 0, 1, 1,
0.1716128, -1.435027, 2.520777, 0, 0, 0, 1, 1,
0.1733049, -0.8240638, 4.780785, 0, 0, 0, 1, 1,
0.1742076, 0.1899569, 0.2877371, 1, 1, 1, 1, 1,
0.1756352, 0.5663829, 0.5474106, 1, 1, 1, 1, 1,
0.1790789, -0.314535, 2.53245, 1, 1, 1, 1, 1,
0.1822357, -2.411391, 3.34071, 1, 1, 1, 1, 1,
0.1828047, -0.4857943, 4.234308, 1, 1, 1, 1, 1,
0.1828422, -0.9953994, 4.077623, 1, 1, 1, 1, 1,
0.1830564, 0.7730844, 0.06059235, 1, 1, 1, 1, 1,
0.1842291, -2.519672, 3.513636, 1, 1, 1, 1, 1,
0.1857746, -0.6725511, 3.649303, 1, 1, 1, 1, 1,
0.1857924, 1.847963, 0.374761, 1, 1, 1, 1, 1,
0.1859357, -0.00368931, 2.811846, 1, 1, 1, 1, 1,
0.1861756, 1.392418, 0.8981133, 1, 1, 1, 1, 1,
0.1864993, 0.7636796, 0.146179, 1, 1, 1, 1, 1,
0.1882888, -0.3924635, 3.370801, 1, 1, 1, 1, 1,
0.188349, -0.374472, 4.521947, 1, 1, 1, 1, 1,
0.1901608, 0.5892593, 0.8621017, 0, 0, 1, 1, 1,
0.1914935, -1.493062, 1.96024, 1, 0, 0, 1, 1,
0.1917934, -0.5620068, 3.469268, 1, 0, 0, 1, 1,
0.192415, -1.024797, 3.6076, 1, 0, 0, 1, 1,
0.1938629, -0.499642, 2.467256, 1, 0, 0, 1, 1,
0.1962112, -1.127053, 5.065304, 1, 0, 0, 1, 1,
0.1966436, -0.2820056, 1.802416, 0, 0, 0, 1, 1,
0.1966761, -0.9875516, 2.174356, 0, 0, 0, 1, 1,
0.1978626, 0.1644022, 1.189325, 0, 0, 0, 1, 1,
0.1993815, -0.2794464, 3.619572, 0, 0, 0, 1, 1,
0.2004629, -2.307644, 2.703332, 0, 0, 0, 1, 1,
0.2047256, 0.9849933, 1.92475, 0, 0, 0, 1, 1,
0.2047256, 0.6360713, -0.2583648, 0, 0, 0, 1, 1,
0.2051562, -0.9406718, 3.396338, 1, 1, 1, 1, 1,
0.2062328, -0.3805775, 1.761943, 1, 1, 1, 1, 1,
0.209372, -2.21593, 3.191071, 1, 1, 1, 1, 1,
0.2133608, 0.6522557, -0.4331861, 1, 1, 1, 1, 1,
0.2139995, -0.2971847, 1.243046, 1, 1, 1, 1, 1,
0.2197444, 0.1872394, -0.02836801, 1, 1, 1, 1, 1,
0.2198325, 1.209462, 0.2976987, 1, 1, 1, 1, 1,
0.2218649, 0.4329865, 1.674788, 1, 1, 1, 1, 1,
0.2242761, 0.7293792, 1.175727, 1, 1, 1, 1, 1,
0.2291546, 0.8945324, -0.8576924, 1, 1, 1, 1, 1,
0.2417632, 0.9592013, 0.6716819, 1, 1, 1, 1, 1,
0.2430193, -0.9094936, 1.947094, 1, 1, 1, 1, 1,
0.2431365, -1.996259, 2.558994, 1, 1, 1, 1, 1,
0.2459011, -1.025957, 3.878872, 1, 1, 1, 1, 1,
0.2492653, -0.1206839, 3.779185, 1, 1, 1, 1, 1,
0.2534352, 0.5371922, 0.2355561, 0, 0, 1, 1, 1,
0.2537199, 0.8174139, 0.1818161, 1, 0, 0, 1, 1,
0.2540179, -0.4302329, 2.817963, 1, 0, 0, 1, 1,
0.2556977, 0.3689601, 0.4734076, 1, 0, 0, 1, 1,
0.2564918, 1.208279, 1.929174, 1, 0, 0, 1, 1,
0.2599427, -1.084323, 3.483138, 1, 0, 0, 1, 1,
0.261676, -0.2395512, 2.295246, 0, 0, 0, 1, 1,
0.2629128, 0.1639442, 1.109919, 0, 0, 0, 1, 1,
0.2656653, -0.889311, 3.110246, 0, 0, 0, 1, 1,
0.2661455, -0.8175274, 3.293131, 0, 0, 0, 1, 1,
0.2664598, 0.1316231, 2.298021, 0, 0, 0, 1, 1,
0.2698911, -1.281405, 1.173234, 0, 0, 0, 1, 1,
0.2721308, 1.034335, 0.1084951, 0, 0, 0, 1, 1,
0.2738228, -0.7646464, 3.073064, 1, 1, 1, 1, 1,
0.2797291, 0.9106219, -0.432714, 1, 1, 1, 1, 1,
0.2827072, 0.5525081, 0.6939454, 1, 1, 1, 1, 1,
0.2837728, -0.8598768, 4.203275, 1, 1, 1, 1, 1,
0.2849117, 0.2860659, 1.439451, 1, 1, 1, 1, 1,
0.2855537, -0.3552818, 1.664972, 1, 1, 1, 1, 1,
0.2889966, -1.196717, 2.988859, 1, 1, 1, 1, 1,
0.289146, -0.3972469, 2.810457, 1, 1, 1, 1, 1,
0.2926153, 0.502822, 1.195998, 1, 1, 1, 1, 1,
0.2967488, 0.6302781, 2.317038, 1, 1, 1, 1, 1,
0.3005374, 0.220164, 1.144607, 1, 1, 1, 1, 1,
0.3031089, -0.1693702, 1.891339, 1, 1, 1, 1, 1,
0.3055505, -0.3988765, 3.388656, 1, 1, 1, 1, 1,
0.3160876, 0.4541093, 0.4258043, 1, 1, 1, 1, 1,
0.3164063, -1.232117, 1.824378, 1, 1, 1, 1, 1,
0.3172648, -0.7940816, 2.659068, 0, 0, 1, 1, 1,
0.3182016, 2.004078, -0.4141455, 1, 0, 0, 1, 1,
0.3188244, 1.252999, -0.9606813, 1, 0, 0, 1, 1,
0.3212545, -1.262595, 3.106685, 1, 0, 0, 1, 1,
0.3223911, 1.079479, 0.6070644, 1, 0, 0, 1, 1,
0.3226351, -1.153986, 3.354008, 1, 0, 0, 1, 1,
0.3239026, -1.865455, 2.188131, 0, 0, 0, 1, 1,
0.3244739, 0.33, 1.083819, 0, 0, 0, 1, 1,
0.3254165, -0.2337832, 3.427693, 0, 0, 0, 1, 1,
0.3317158, 0.07713103, 3.26527, 0, 0, 0, 1, 1,
0.337975, -0.04913554, 0.6904112, 0, 0, 0, 1, 1,
0.342697, 0.02978617, 0.9040166, 0, 0, 0, 1, 1,
0.3550072, 0.331913, 0.3686318, 0, 0, 0, 1, 1,
0.3559736, 0.45657, 1.199962, 1, 1, 1, 1, 1,
0.3577111, -0.6916025, 3.458952, 1, 1, 1, 1, 1,
0.3639117, 0.3824087, 0.660291, 1, 1, 1, 1, 1,
0.3651548, -0.4436243, 1.272978, 1, 1, 1, 1, 1,
0.3661702, 0.8955564, 1.152766, 1, 1, 1, 1, 1,
0.3711556, 0.9676896, -0.137435, 1, 1, 1, 1, 1,
0.3714727, -0.210868, 2.031638, 1, 1, 1, 1, 1,
0.3717742, -0.152967, 2.455715, 1, 1, 1, 1, 1,
0.3725272, 1.212864, -1.826888, 1, 1, 1, 1, 1,
0.3799185, -0.6946882, 2.709451, 1, 1, 1, 1, 1,
0.3812872, -0.06081464, 2.257426, 1, 1, 1, 1, 1,
0.3832631, 0.3887142, 0.992572, 1, 1, 1, 1, 1,
0.3836504, 1.3028, -0.03404662, 1, 1, 1, 1, 1,
0.3890209, 0.7736288, -1.251673, 1, 1, 1, 1, 1,
0.3919323, -0.9242508, 1.339619, 1, 1, 1, 1, 1,
0.402356, 1.942712, 3.85256, 0, 0, 1, 1, 1,
0.4024542, -0.04736258, 1.942376, 1, 0, 0, 1, 1,
0.4054883, -1.597424, 3.409986, 1, 0, 0, 1, 1,
0.4147041, -1.502538, 4.219167, 1, 0, 0, 1, 1,
0.4179769, 0.2974485, -0.4732461, 1, 0, 0, 1, 1,
0.4200621, -1.339464, 1.498303, 1, 0, 0, 1, 1,
0.4239807, -2.166533, 2.817235, 0, 0, 0, 1, 1,
0.4266921, 0.3695972, 1.592982, 0, 0, 0, 1, 1,
0.4303917, -1.381506, 5.72596, 0, 0, 0, 1, 1,
0.4364295, -1.417247, 3.078063, 0, 0, 0, 1, 1,
0.43761, 0.2719745, 0.7222267, 0, 0, 0, 1, 1,
0.4390813, 0.4545294, 0.4018241, 0, 0, 0, 1, 1,
0.4407963, 0.3446116, 0.7013307, 0, 0, 0, 1, 1,
0.4415974, -0.05485814, 2.566345, 1, 1, 1, 1, 1,
0.444428, -0.554031, 2.161577, 1, 1, 1, 1, 1,
0.445321, -1.101597, 2.840117, 1, 1, 1, 1, 1,
0.4458359, 0.3058745, -0.4643373, 1, 1, 1, 1, 1,
0.4506004, -0.2688532, 2.284058, 1, 1, 1, 1, 1,
0.4513851, -1.382204, 2.875831, 1, 1, 1, 1, 1,
0.4517578, -0.7684567, 1.710529, 1, 1, 1, 1, 1,
0.4538016, -0.8115731, 2.234826, 1, 1, 1, 1, 1,
0.4598687, 1.56805, 0.476751, 1, 1, 1, 1, 1,
0.4656726, -1.382322, 2.891438, 1, 1, 1, 1, 1,
0.4662908, -1.434008, 2.172046, 1, 1, 1, 1, 1,
0.4693381, -1.611983, 3.643888, 1, 1, 1, 1, 1,
0.4694243, -0.2533837, 1.266734, 1, 1, 1, 1, 1,
0.4700219, -0.1114528, 2.152016, 1, 1, 1, 1, 1,
0.4718064, -1.280653, 3.217731, 1, 1, 1, 1, 1,
0.4771062, 0.6281276, 0.5280096, 0, 0, 1, 1, 1,
0.4777635, 0.9208691, 1.405673, 1, 0, 0, 1, 1,
0.480347, -0.2346378, 1.616222, 1, 0, 0, 1, 1,
0.4813607, 0.1247192, 0.001177004, 1, 0, 0, 1, 1,
0.4830285, -0.7974496, 2.38548, 1, 0, 0, 1, 1,
0.4853685, -1.304212, 3.49724, 1, 0, 0, 1, 1,
0.4903688, -1.490191, 3.375301, 0, 0, 0, 1, 1,
0.4939549, 1.963095, 0.4347673, 0, 0, 0, 1, 1,
0.4975278, 1.741497, 0.4032415, 0, 0, 0, 1, 1,
0.498209, 0.2322033, 0.3885327, 0, 0, 0, 1, 1,
0.5006049, -0.5636774, 1.18146, 0, 0, 0, 1, 1,
0.5011967, -0.5074866, 3.183521, 0, 0, 0, 1, 1,
0.5026054, 0.6251381, -0.1592539, 0, 0, 0, 1, 1,
0.5030187, -0.8185234, 4.156988, 1, 1, 1, 1, 1,
0.5089155, 0.1089732, 0.862259, 1, 1, 1, 1, 1,
0.5092655, -0.05336955, 2.084416, 1, 1, 1, 1, 1,
0.5096393, 0.1493783, 2.284904, 1, 1, 1, 1, 1,
0.5147254, -0.781191, 2.176949, 1, 1, 1, 1, 1,
0.5164605, 0.2800572, 1.595942, 1, 1, 1, 1, 1,
0.5175067, -0.5279658, 2.265508, 1, 1, 1, 1, 1,
0.5199049, -0.7907378, 3.214379, 1, 1, 1, 1, 1,
0.5234962, 0.6891007, 1.81408, 1, 1, 1, 1, 1,
0.5247446, 0.0347661, 2.74927, 1, 1, 1, 1, 1,
0.5302291, 1.917611, -0.1234469, 1, 1, 1, 1, 1,
0.5349411, -0.6620657, 3.023956, 1, 1, 1, 1, 1,
0.536626, 0.2860699, 0.1136482, 1, 1, 1, 1, 1,
0.537591, -0.02936181, 3.887395, 1, 1, 1, 1, 1,
0.539352, 0.5366689, -0.1347741, 1, 1, 1, 1, 1,
0.5395262, 1.175811, -1.055298, 0, 0, 1, 1, 1,
0.5411461, 0.5878985, 1.525719, 1, 0, 0, 1, 1,
0.5427712, 0.2835616, 2.015579, 1, 0, 0, 1, 1,
0.5446565, 1.74474, -0.1951124, 1, 0, 0, 1, 1,
0.5466601, 1.925317, 0.304722, 1, 0, 0, 1, 1,
0.547694, 0.1007632, -1.192613, 1, 0, 0, 1, 1,
0.5554718, -0.1642168, 1.449912, 0, 0, 0, 1, 1,
0.5601725, -0.6707332, 1.399381, 0, 0, 0, 1, 1,
0.5612832, -0.6574013, 2.423453, 0, 0, 0, 1, 1,
0.5645288, -0.6687809, 2.226994, 0, 0, 0, 1, 1,
0.5645323, 1.024113, 1.69803, 0, 0, 0, 1, 1,
0.5648093, 0.4381513, 2.600522, 0, 0, 0, 1, 1,
0.5697123, 0.15404, 1.705554, 0, 0, 0, 1, 1,
0.5715452, 0.9711384, 0.1623471, 1, 1, 1, 1, 1,
0.5737071, -0.2687182, 2.610565, 1, 1, 1, 1, 1,
0.574994, -1.326741, 2.3802, 1, 1, 1, 1, 1,
0.5796207, -1.046055, 3.011134, 1, 1, 1, 1, 1,
0.5829555, 1.95189, 0.8187202, 1, 1, 1, 1, 1,
0.5915788, 1.223999, 1.549707, 1, 1, 1, 1, 1,
0.5948049, 0.2814401, 1.184615, 1, 1, 1, 1, 1,
0.5956368, 0.923909, 0.8641989, 1, 1, 1, 1, 1,
0.5960987, 0.06697571, 2.054375, 1, 1, 1, 1, 1,
0.5973985, -0.2378502, 1.389244, 1, 1, 1, 1, 1,
0.5993399, 0.5415382, 1.214363, 1, 1, 1, 1, 1,
0.6030274, 0.5116501, 2.011326, 1, 1, 1, 1, 1,
0.6033869, -1.6894, 3.60399, 1, 1, 1, 1, 1,
0.6100419, 0.7842684, 0.006377778, 1, 1, 1, 1, 1,
0.6158078, -0.1793021, 1.716312, 1, 1, 1, 1, 1,
0.6171119, -0.676618, 2.238927, 0, 0, 1, 1, 1,
0.6206601, -2.024686, 2.629347, 1, 0, 0, 1, 1,
0.6209673, 1.234358, -0.7160342, 1, 0, 0, 1, 1,
0.6258487, 1.506257, -0.174207, 1, 0, 0, 1, 1,
0.626293, -1.075754, 1.684739, 1, 0, 0, 1, 1,
0.6285759, -3.168811, 4.927696, 1, 0, 0, 1, 1,
0.6331664, -0.05485911, 0.4843558, 0, 0, 0, 1, 1,
0.6338062, -0.2611786, 1.98144, 0, 0, 0, 1, 1,
0.6367475, 1.259288, 0.2758704, 0, 0, 0, 1, 1,
0.6377853, -1.614722, 1.365825, 0, 0, 0, 1, 1,
0.6403714, 1.849776, 0.3673567, 0, 0, 0, 1, 1,
0.6461791, 0.9676491, 1.508026, 0, 0, 0, 1, 1,
0.6534089, -0.06923911, 2.790933, 0, 0, 0, 1, 1,
0.6549001, 1.204026, 0.1802327, 1, 1, 1, 1, 1,
0.6549435, 0.7197117, 0.1386843, 1, 1, 1, 1, 1,
0.657335, -0.08818943, 1.352557, 1, 1, 1, 1, 1,
0.6593037, 0.08893239, 1.525718, 1, 1, 1, 1, 1,
0.6599095, 1.376317, -0.4286923, 1, 1, 1, 1, 1,
0.6695313, -0.9426652, 4.78717, 1, 1, 1, 1, 1,
0.678815, -0.801542, 2.906624, 1, 1, 1, 1, 1,
0.6806713, -0.2370034, 2.690226, 1, 1, 1, 1, 1,
0.6812975, -0.9052768, 3.684205, 1, 1, 1, 1, 1,
0.6818361, 0.1917069, 3.275563, 1, 1, 1, 1, 1,
0.6821759, 1.182513, 0.6015024, 1, 1, 1, 1, 1,
0.6883738, 0.5775746, -0.5526624, 1, 1, 1, 1, 1,
0.6947078, -0.3408514, 2.817963, 1, 1, 1, 1, 1,
0.6966549, 0.1369807, 1.60626, 1, 1, 1, 1, 1,
0.7000721, 0.3392018, 1.831125, 1, 1, 1, 1, 1,
0.700551, 0.5073373, 0.1448538, 0, 0, 1, 1, 1,
0.7008626, 0.7602808, 1.035184, 1, 0, 0, 1, 1,
0.702725, 0.1791576, 2.808658, 1, 0, 0, 1, 1,
0.7028043, -0.1572037, 2.09911, 1, 0, 0, 1, 1,
0.7036066, 0.7485449, 0.3437169, 1, 0, 0, 1, 1,
0.7059556, 1.922354, 2.210832, 1, 0, 0, 1, 1,
0.7061729, 0.5660147, 1.499769, 0, 0, 0, 1, 1,
0.7072995, -0.1885484, 1.438499, 0, 0, 0, 1, 1,
0.712997, 0.02711704, 1.342982, 0, 0, 0, 1, 1,
0.7182964, 0.9019256, 1.717133, 0, 0, 0, 1, 1,
0.7192047, 0.6754298, 0.1241672, 0, 0, 0, 1, 1,
0.7219669, 0.2389063, 1.848735, 0, 0, 0, 1, 1,
0.7254246, -0.4099319, 2.05658, 0, 0, 0, 1, 1,
0.726047, 0.6460421, 0.6630374, 1, 1, 1, 1, 1,
0.7377794, -0.8531258, 2.375247, 1, 1, 1, 1, 1,
0.7397557, 1.187879, 1.99361, 1, 1, 1, 1, 1,
0.7488474, -0.8196341, 1.226677, 1, 1, 1, 1, 1,
0.7495446, -0.613349, 2.583677, 1, 1, 1, 1, 1,
0.7516016, -0.2362894, 0.02366045, 1, 1, 1, 1, 1,
0.7541392, -0.01319116, 1.542934, 1, 1, 1, 1, 1,
0.7616013, -0.365776, 2.328485, 1, 1, 1, 1, 1,
0.7618368, 0.2370254, 0.4531577, 1, 1, 1, 1, 1,
0.7688996, -0.8384888, 2.55777, 1, 1, 1, 1, 1,
0.7696583, 0.7086285, -0.8754736, 1, 1, 1, 1, 1,
0.7736121, 0.7897714, 2.052545, 1, 1, 1, 1, 1,
0.7821839, -0.5806752, 1.344776, 1, 1, 1, 1, 1,
0.7922193, -0.3250953, 0.2473834, 1, 1, 1, 1, 1,
0.7949067, 0.9245313, 0.6199984, 1, 1, 1, 1, 1,
0.8000742, -0.3190151, -0.2807795, 0, 0, 1, 1, 1,
0.8005786, -1.824198, 4.012201, 1, 0, 0, 1, 1,
0.8073179, -0.6291589, 3.177488, 1, 0, 0, 1, 1,
0.8151938, 0.7196281, 0.1074229, 1, 0, 0, 1, 1,
0.8248152, -1.104479, 2.230866, 1, 0, 0, 1, 1,
0.8308734, -0.6751893, 1.573946, 1, 0, 0, 1, 1,
0.8310391, 1.636778, -0.2164238, 0, 0, 0, 1, 1,
0.8317909, 0.8069625, 1.537195, 0, 0, 0, 1, 1,
0.8383517, 0.2080363, 2.40933, 0, 0, 0, 1, 1,
0.8429747, -0.2465194, 1.965285, 0, 0, 0, 1, 1,
0.848823, 0.1531333, 1.477033, 0, 0, 0, 1, 1,
0.8523939, 0.6263846, -0.172778, 0, 0, 0, 1, 1,
0.8580205, 0.7004979, -0.2066823, 0, 0, 0, 1, 1,
0.8644009, -0.2860858, -0.49617, 1, 1, 1, 1, 1,
0.8653648, -0.5930216, 2.92801, 1, 1, 1, 1, 1,
0.8689591, -0.545087, 3.558405, 1, 1, 1, 1, 1,
0.8797289, 0.9693446, 2.220459, 1, 1, 1, 1, 1,
0.8808063, -0.1468876, 2.839232, 1, 1, 1, 1, 1,
0.8828569, -0.01736834, 2.449667, 1, 1, 1, 1, 1,
0.8864256, 1.620147, 1.537199, 1, 1, 1, 1, 1,
0.8898528, -0.01441111, 2.202601, 1, 1, 1, 1, 1,
0.892091, 1.72377, 0.5065696, 1, 1, 1, 1, 1,
0.9038485, -0.5590473, 1.575911, 1, 1, 1, 1, 1,
0.9061109, -0.422391, 1.051695, 1, 1, 1, 1, 1,
0.9064657, 0.2347704, -0.80771, 1, 1, 1, 1, 1,
0.9083955, -2.084294, 2.043241, 1, 1, 1, 1, 1,
0.910659, 0.7875344, 1.644225, 1, 1, 1, 1, 1,
0.9147984, 1.226828, 0.803765, 1, 1, 1, 1, 1,
0.9152205, 0.09625204, 1.193989, 0, 0, 1, 1, 1,
0.918352, 2.230839, -0.5839648, 1, 0, 0, 1, 1,
0.9194205, -1.495029, 2.689703, 1, 0, 0, 1, 1,
0.9227458, 0.2672612, -0.03514717, 1, 0, 0, 1, 1,
0.9263093, 1.5786, 1.344721, 1, 0, 0, 1, 1,
0.9266677, 1.536793, -1.471736, 1, 0, 0, 1, 1,
0.928579, -0.5812271, 3.411872, 0, 0, 0, 1, 1,
0.9317366, 0.4593547, 1.649469, 0, 0, 0, 1, 1,
0.9435511, -1.822833, 2.450127, 0, 0, 0, 1, 1,
0.9444858, -0.232673, 2.350127, 0, 0, 0, 1, 1,
0.9549762, -1.1522, 1.936646, 0, 0, 0, 1, 1,
0.9561995, -0.4812874, 2.480422, 0, 0, 0, 1, 1,
0.957863, -1.515609, 3.416543, 0, 0, 0, 1, 1,
0.9602301, -0.9276475, 4.58698, 1, 1, 1, 1, 1,
0.9765838, 0.01035633, 1.720944, 1, 1, 1, 1, 1,
0.9863645, -0.2718234, 2.584747, 1, 1, 1, 1, 1,
0.9897317, -1.350122, 2.663921, 1, 1, 1, 1, 1,
0.9931551, -1.074989, 1.284062, 1, 1, 1, 1, 1,
0.9932051, 0.8973908, 1.520022, 1, 1, 1, 1, 1,
0.9996778, 0.0456978, 0.8671467, 1, 1, 1, 1, 1,
1.000837, 0.1212565, 0.1619618, 1, 1, 1, 1, 1,
1.00699, -0.3609206, 1.813877, 1, 1, 1, 1, 1,
1.009863, -0.5823295, 0.9111315, 1, 1, 1, 1, 1,
1.010168, -0.3112518, 2.567025, 1, 1, 1, 1, 1,
1.015837, -0.9687216, 2.420866, 1, 1, 1, 1, 1,
1.021457, -0.4683904, 1.929355, 1, 1, 1, 1, 1,
1.030979, 0.7497256, 0.6798757, 1, 1, 1, 1, 1,
1.031498, -1.993372, 4.104839, 1, 1, 1, 1, 1,
1.033058, 0.5227647, 0.3869216, 0, 0, 1, 1, 1,
1.03547, 0.02905946, 1.863314, 1, 0, 0, 1, 1,
1.038696, 1.888273, -0.370573, 1, 0, 0, 1, 1,
1.04731, 0.7917464, 1.493674, 1, 0, 0, 1, 1,
1.05637, 0.630491, -0.6046088, 1, 0, 0, 1, 1,
1.05904, -0.9631776, 3.42449, 1, 0, 0, 1, 1,
1.060797, -0.3021429, 2.746962, 0, 0, 0, 1, 1,
1.065238, -1.638883, 3.659979, 0, 0, 0, 1, 1,
1.073845, -1.823443, 3.084598, 0, 0, 0, 1, 1,
1.076787, 1.271835, -0.2390661, 0, 0, 0, 1, 1,
1.076868, -1.197734, 3.486781, 0, 0, 0, 1, 1,
1.102564, -0.3987787, 0.8721848, 0, 0, 0, 1, 1,
1.102994, 0.4262429, 0.6114535, 0, 0, 0, 1, 1,
1.10863, 1.240512, -0.4000963, 1, 1, 1, 1, 1,
1.122072, -0.1440341, 3.526229, 1, 1, 1, 1, 1,
1.125903, 0.2211896, 3.105349, 1, 1, 1, 1, 1,
1.127618, -0.356156, 1.396546, 1, 1, 1, 1, 1,
1.129139, -1.680655, 1.960453, 1, 1, 1, 1, 1,
1.134869, 0.8585484, 0.6884819, 1, 1, 1, 1, 1,
1.149108, -1.285462, 2.956462, 1, 1, 1, 1, 1,
1.149356, 0.03059108, -0.1196622, 1, 1, 1, 1, 1,
1.150598, 1.156368, 0.5616827, 1, 1, 1, 1, 1,
1.16869, -0.7534036, 1.590267, 1, 1, 1, 1, 1,
1.175876, -0.362498, 2.832794, 1, 1, 1, 1, 1,
1.183345, -1.640704, 1.314159, 1, 1, 1, 1, 1,
1.183413, -0.04223576, 2.027542, 1, 1, 1, 1, 1,
1.190397, -1.212082, 2.147156, 1, 1, 1, 1, 1,
1.203383, -2.363521, 1.750974, 1, 1, 1, 1, 1,
1.204469, 0.04396315, 1.820849, 0, 0, 1, 1, 1,
1.208923, 0.2283691, 1.494877, 1, 0, 0, 1, 1,
1.214311, 0.6477859, 1.032366, 1, 0, 0, 1, 1,
1.225723, -0.4175226, 2.280611, 1, 0, 0, 1, 1,
1.24189, -1.325107, 2.164452, 1, 0, 0, 1, 1,
1.242368, -0.5480733, 0.7998335, 1, 0, 0, 1, 1,
1.243765, 0.460877, 1.554713, 0, 0, 0, 1, 1,
1.252324, 2.038321, -1.014155, 0, 0, 0, 1, 1,
1.257947, -0.6744961, 1.460814, 0, 0, 0, 1, 1,
1.25884, 0.9755497, 0.1863192, 0, 0, 0, 1, 1,
1.280586, -1.346341, 4.224009, 0, 0, 0, 1, 1,
1.280774, 0.2129876, 1.196109, 0, 0, 0, 1, 1,
1.282285, 0.151307, 3.06192, 0, 0, 0, 1, 1,
1.288797, -0.04301155, 1.951614, 1, 1, 1, 1, 1,
1.290707, 1.624221, 1.077852, 1, 1, 1, 1, 1,
1.292517, -2.458589, 3.454258, 1, 1, 1, 1, 1,
1.29928, -0.07772633, 1.841184, 1, 1, 1, 1, 1,
1.302093, -1.761952, 1.10057, 1, 1, 1, 1, 1,
1.304475, -0.1596296, 2.265837, 1, 1, 1, 1, 1,
1.308283, 0.9842306, 0.3799989, 1, 1, 1, 1, 1,
1.329615, 1.14409, 0.4640834, 1, 1, 1, 1, 1,
1.33205, 0.471348, 1.434502, 1, 1, 1, 1, 1,
1.333378, -1.041371, 2.60544, 1, 1, 1, 1, 1,
1.338417, -0.1213816, 2.440754, 1, 1, 1, 1, 1,
1.344738, -1.081537, 1.919078, 1, 1, 1, 1, 1,
1.353752, 2.142711, 1.546477, 1, 1, 1, 1, 1,
1.353794, 0.8640679, -0.7734334, 1, 1, 1, 1, 1,
1.35674, 0.05139893, 3.0382, 1, 1, 1, 1, 1,
1.357202, -0.7207102, 2.268516, 0, 0, 1, 1, 1,
1.358407, -0.8204828, 4.322121, 1, 0, 0, 1, 1,
1.367325, -0.6402657, 3.119699, 1, 0, 0, 1, 1,
1.373028, -0.2391568, 1.666928, 1, 0, 0, 1, 1,
1.379568, -0.05879632, 0.09202036, 1, 0, 0, 1, 1,
1.392542, 0.497293, 0.3326929, 1, 0, 0, 1, 1,
1.402985, -0.9236124, 2.092756, 0, 0, 0, 1, 1,
1.411832, -0.8139136, 1.967057, 0, 0, 0, 1, 1,
1.412651, 0.4899355, 0.2444059, 0, 0, 0, 1, 1,
1.420759, -0.5021757, 0.4898493, 0, 0, 0, 1, 1,
1.42098, 0.4106973, 1.739416, 0, 0, 0, 1, 1,
1.457149, -1.603064, 2.527271, 0, 0, 0, 1, 1,
1.464063, 0.332967, 2.62806, 0, 0, 0, 1, 1,
1.465492, -0.4124682, 2.719723, 1, 1, 1, 1, 1,
1.489832, 0.6501743, 2.152094, 1, 1, 1, 1, 1,
1.49029, 1.358213, 1.733514, 1, 1, 1, 1, 1,
1.498115, 0.2536978, 2.338122, 1, 1, 1, 1, 1,
1.499787, -1.399208, 2.729511, 1, 1, 1, 1, 1,
1.502168, -0.666124, 1.223701, 1, 1, 1, 1, 1,
1.504105, 0.4501301, -0.05566384, 1, 1, 1, 1, 1,
1.509004, 1.367752, 0.3063002, 1, 1, 1, 1, 1,
1.511574, 0.09064082, 2.006116, 1, 1, 1, 1, 1,
1.513812, -1.045781, 2.874816, 1, 1, 1, 1, 1,
1.518593, -0.2636116, 2.145337, 1, 1, 1, 1, 1,
1.523868, 0.5437115, 2.957183, 1, 1, 1, 1, 1,
1.525448, 1.636516, 0.1057526, 1, 1, 1, 1, 1,
1.526169, 1.57871, 2.278238, 1, 1, 1, 1, 1,
1.531072, 0.2158101, 3.114632, 1, 1, 1, 1, 1,
1.534048, -0.5056407, 3.056861, 0, 0, 1, 1, 1,
1.548922, 0.1236665, 1.323945, 1, 0, 0, 1, 1,
1.561905, 0.9785622, -0.2172712, 1, 0, 0, 1, 1,
1.562943, -0.7810025, 0.4520795, 1, 0, 0, 1, 1,
1.565171, 1.919459, 0.5706514, 1, 0, 0, 1, 1,
1.581968, -0.1151117, 1.285209, 1, 0, 0, 1, 1,
1.583055, 0.2056085, 2.996516, 0, 0, 0, 1, 1,
1.612098, 0.2123063, 3.122394, 0, 0, 0, 1, 1,
1.615542, 0.8916638, 1.299485, 0, 0, 0, 1, 1,
1.633296, -0.625428, 1.854279, 0, 0, 0, 1, 1,
1.637839, -1.439043, 0.807079, 0, 0, 0, 1, 1,
1.660361, 1.383894, 1.196901, 0, 0, 0, 1, 1,
1.662349, -0.4752671, 2.945508, 0, 0, 0, 1, 1,
1.669397, 1.581354, 0.2276638, 1, 1, 1, 1, 1,
1.670579, -0.8833118, 1.734658, 1, 1, 1, 1, 1,
1.675545, -0.3583989, 2.859792, 1, 1, 1, 1, 1,
1.678783, 1.88609, 1.680425, 1, 1, 1, 1, 1,
1.681071, -0.8353812, 2.86276, 1, 1, 1, 1, 1,
1.682432, 0.1857601, 0.4396604, 1, 1, 1, 1, 1,
1.690229, -0.2638601, 0.7946349, 1, 1, 1, 1, 1,
1.690916, 1.959235, 0.5537858, 1, 1, 1, 1, 1,
1.697021, -0.8824486, 0.2589315, 1, 1, 1, 1, 1,
1.702848, -0.6182886, 2.001466, 1, 1, 1, 1, 1,
1.706236, -1.399778, 1.145736, 1, 1, 1, 1, 1,
1.724516, 1.189354, 1.873712, 1, 1, 1, 1, 1,
1.728602, 0.125019, 1.442745, 1, 1, 1, 1, 1,
1.741178, -0.5681223, 0.4917053, 1, 1, 1, 1, 1,
1.748259, -0.01063036, 1.492267, 1, 1, 1, 1, 1,
1.768876, -0.1652624, 0.7469149, 0, 0, 1, 1, 1,
1.783841, 0.6741958, -0.6310515, 1, 0, 0, 1, 1,
1.787044, -0.2160085, 0.1538251, 1, 0, 0, 1, 1,
1.803444, -0.406875, 3.466877, 1, 0, 0, 1, 1,
1.808919, 0.7692758, 1.133246, 1, 0, 0, 1, 1,
1.810184, -0.0665822, 2.017382, 1, 0, 0, 1, 1,
1.81893, 0.560331, 0.8576179, 0, 0, 0, 1, 1,
1.840524, 0.3618681, 1.565412, 0, 0, 0, 1, 1,
1.850936, -0.9059947, 0.7366824, 0, 0, 0, 1, 1,
1.860444, 0.06393046, 3.487984, 0, 0, 0, 1, 1,
1.918132, 0.3458467, -0.07692651, 0, 0, 0, 1, 1,
1.922942, -1.527362, 0.8170162, 0, 0, 0, 1, 1,
1.923869, -0.07200269, 2.283249, 0, 0, 0, 1, 1,
1.944933, -0.8301421, 1.785155, 1, 1, 1, 1, 1,
1.954498, -1.439618, 1.311232, 1, 1, 1, 1, 1,
1.962354, -0.7884762, 2.433807, 1, 1, 1, 1, 1,
1.963847, 0.9413571, 0.02601635, 1, 1, 1, 1, 1,
1.971544, -0.4200568, 1.173539, 1, 1, 1, 1, 1,
1.973264, -0.1772097, 2.06058, 1, 1, 1, 1, 1,
1.978316, -1.193179, 1.563829, 1, 1, 1, 1, 1,
2.086015, 1.113819, 0.8385917, 1, 1, 1, 1, 1,
2.107598, -0.8826075, 0.2911964, 1, 1, 1, 1, 1,
2.147492, 0.4729742, 1.440686, 1, 1, 1, 1, 1,
2.173329, 0.4487101, 0.6382498, 1, 1, 1, 1, 1,
2.1875, 0.4688647, 2.140434, 1, 1, 1, 1, 1,
2.204824, -0.003055637, 1.701015, 1, 1, 1, 1, 1,
2.214745, 0.222058, 1.866654, 1, 1, 1, 1, 1,
2.216232, -0.3826167, 1.782636, 1, 1, 1, 1, 1,
2.262593, -0.6618294, 2.78337, 0, 0, 1, 1, 1,
2.262925, 0.541636, 1.191777, 1, 0, 0, 1, 1,
2.263668, -0.5653476, 3.002028, 1, 0, 0, 1, 1,
2.318531, 0.02851574, 1.847286, 1, 0, 0, 1, 1,
2.338701, -1.587538, 1.426462, 1, 0, 0, 1, 1,
2.352467, -0.3490296, 0.9438689, 1, 0, 0, 1, 1,
2.441246, 0.5101548, 0.4617041, 0, 0, 0, 1, 1,
2.497607, -0.3460283, -0.04703585, 0, 0, 0, 1, 1,
2.515514, -1.280865, 2.851894, 0, 0, 0, 1, 1,
2.534545, 0.4978496, 3.115448, 0, 0, 0, 1, 1,
2.563275, 0.2216957, 2.535084, 0, 0, 0, 1, 1,
2.583615, -0.1977291, 0.4133612, 0, 0, 0, 1, 1,
2.58582, -0.8687646, 2.247358, 0, 0, 0, 1, 1,
2.586476, -1.217754, 2.736111, 1, 1, 1, 1, 1,
2.712303, 0.9905628, 1.258417, 1, 1, 1, 1, 1,
2.733935, -1.914771, 2.415019, 1, 1, 1, 1, 1,
2.778703, -0.333968, 0.3037649, 1, 1, 1, 1, 1,
2.960737, 0.7078153, 1.211896, 1, 1, 1, 1, 1,
3.30447, 0.8366254, 1.363655, 1, 1, 1, 1, 1,
3.365734, 0.9241818, 0.09158176, 1, 1, 1, 1, 1
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
var radius = 9.623989;
var distance = 33.80386;
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
mvMatrix.translate( -0.2080283, 0.5132281, -0.1181967 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.80386);
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